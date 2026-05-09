import re
from pathlib import Path

SRC_DEFAULT = Path(r'D:\Downloads\newtiffa_timesheet 08 05 26.sql.txt')
OUT_DIR_DEFAULT = Path('database/supabase')

TYPE_RULES = [
    (re.compile(r'\bint\s*\(\s*\d+\s*\)\s+unsigned\b', re.I), 'integer'),
    (re.compile(r'\bint\s*\(\s*\d+\s*\)', re.I), 'integer'),
    (re.compile(r'\bbigint\s*\(\s*\d+\s*\)\s+unsigned\b', re.I), 'bigint'),
    (re.compile(r'\bbigint\s*\(\s*\d+\s*\)', re.I), 'bigint'),
    (re.compile(r'\bsmallint\s*\(\s*\d+\s*\)\s+unsigned\b', re.I), 'smallint'),
    (re.compile(r'\bsmallint\s*\(\s*\d+\s*\)', re.I), 'smallint'),
    (re.compile(r'\btinyint\s*\(\s*1\s*\)', re.I), 'smallint'),
    (re.compile(r'\btinyint\s*\(\s*\d+\s*\)', re.I), 'smallint'),
    (re.compile(r'\bmediumint\s*\(\s*\d+\s*\)', re.I), 'integer'),
    (re.compile(r'\byear\s*\(\s*\d+\s*\)', re.I), 'smallint'),
    (re.compile(r'\bdouble\b', re.I), 'double precision'),
    (re.compile(r'\bfloat\b', re.I), 'real'),
    (re.compile(r'\bdatetime\b', re.I), 'timestamp'),
    (re.compile(r'\blongtext\b|\bmediumtext\b', re.I), 'text'),
    (re.compile(r'\btinytext\b', re.I), 'text'),
    (re.compile(r'\blongblob\b|\bmediumblob\b|\bblob\b', re.I), 'bytea'),
]


def qident(name: str) -> str:
    return '"' + name.replace('"', '""') + '"'


def split_sql(text: str):
    statements = []
    start = 0
    quote = None
    escape = False
    i = 0
    while i < len(text):
        ch = text[i]
        if quote:
            if escape:
                escape = False
            elif ch == '\\':
                escape = True
            elif ch == quote:
                quote = None
        else:
            if ch in ("'", '"'):
                quote = ch
            elif ch == ';':
                stmt = text[start:i+1].strip()
                if stmt:
                    statements.append(stmt)
                start = i + 1
        i += 1
    tail = text[start:].strip()
    if tail:
        statements.append(tail)
    return statements


def clean_preamble(sql: str) -> str:
    lines = []
    for line in sql.splitlines():
        if line.startswith('--') or line.startswith('/*') or line.startswith('LOCK TABLES') or line.startswith('UNLOCK TABLES'):
            continue
        if line.startswith('SET ') or line.startswith('START TRANSACTION') or line.startswith('COMMIT'):
            continue
        lines.append(line)
    return '\n'.join(lines)


def split_columns(body: str):
    parts = []
    start = 0
    depth = 0
    quote = None
    escape = False
    for i, ch in enumerate(body):
        if quote:
            if escape:
                escape = False
            elif ch == '\\':
                escape = True
            elif ch == quote:
                quote = None
        else:
            if ch in ("'", '"', '`'):
                quote = ch
            elif ch == '(':
                depth += 1
            elif ch == ')':
                depth -= 1
            elif ch == ',' and depth == 0:
                parts.append(body[start:i].strip())
                start = i + 1
    tail = body[start:].strip()
    if tail:
        parts.append(tail)
    return parts


def convert_default_literals(line: str) -> str:
    line = re.sub(r"DEFAULT\s+'0000-00-00 00:00:00'", 'DEFAULT NULL', line, flags=re.I)
    line = re.sub(r"DEFAULT\s+'0000-00-00'", 'DEFAULT NULL', line, flags=re.I)
    line = re.sub(r"DEFAULT\s+current_timestamp\(\)", 'DEFAULT CURRENT_TIMESTAMP', line, flags=re.I)
    line = re.sub(r"DEFAULT\s+CURRENT_TIMESTAMP\(\)", 'DEFAULT CURRENT_TIMESTAMP', line, flags=re.I)
    line = re.sub(r"\s+ON UPDATE\s+current_timestamp\(\)", '', line, flags=re.I)
    return line


def convert_column(line: str):
    m = re.match(r'`([^`]+)`\s+(.+)$', line.strip(), re.S)
    if not m:
        return None
    name, rest = m.groups()
    rest = re.sub(r"\s+COMMENT\s+'(?:\\'|[^'])*'", '', rest, flags=re.I)
    rest = re.sub(r"\s+CHARACTER SET\s+\w+", '', rest, flags=re.I)
    rest = re.sub(r"\s+COLLATE\s+\w+", '', rest, flags=re.I)
    rest = re.sub(r"\s+UNSIGNED\b", '', rest, flags=re.I)
    rest = re.sub(r"\s+ZEROFILL\b", '', rest, flags=re.I)
    rest = re.sub(r"\s+AUTO_INCREMENT\b", '', rest, flags=re.I)
    rest = re.sub(r"\benum\s*\((.*?)\)", 'varchar(50)', rest, flags=re.I|re.S)
    for pattern, repl in TYPE_RULES:
        rest = pattern.sub(repl, rest)
    rest = convert_default_literals(rest)
    return f'  {qident(name)} {rest}'


def convert_create(stmt: str):
    m = re.search(r'CREATE TABLE\s+`([^`]+)`\s*\((.*)\)\s*ENGINE\s*=.*', stmt, re.I|re.S)
    if not m:
        return None
    table, body = m.groups()
    cols = []
    for part in split_columns(body):
        part = part.strip().rstrip(',')
        if not part.startswith('`'):
            continue
        col = convert_column(part)
        if col:
            cols.append(col)
    return table, f'CREATE TABLE IF NOT EXISTS {qident(table)} (\n' + ',\n'.join(cols) + '\n);\n'


def replace_backtick_idents(sql: str) -> str:
    return re.sub(r'`([^`]+)`', lambda m: qident(m.group(1)), sql)


def convert_insert(stmt: str):
    if not re.match(r'INSERT\s+INTO\s+`', stmt, re.I):
        return None
    stmt = re.sub(r'\bINSERT\s+IGNORE\s+INTO\b', 'INSERT INTO', stmt, flags=re.I)
    stmt = replace_backtick_idents(stmt)
    stmt = re.sub(r"_binary\s*'", "'", stmt, flags=re.I)
    stmt = re.sub(r"\b0x([0-9a-fA-F]+)\b", r"'\\x\1'", stmt)
    stmt = re.sub(r"'0000-00-00 00:00:00'", 'NULL', stmt)
    stmt = re.sub(r"'0000-00-00'", 'NULL', stmt)
    return stmt.rstrip(';') + ';\n'


def convert_alter_keys(stmt: str):
    m = re.match(r'ALTER TABLE\s+`([^`]+)`\s+(.*);?$', stmt.strip(), re.I|re.S)
    if not m:
        return []
    table, body = m.groups()
    if 'AUTO_INCREMENT' in body.upper() or 'MODIFY' in body.upper():
        return []
    out = []
    for part in split_columns(body.rstrip(';')):
        part = part.strip().rstrip(',')
        pk = re.match(r'ADD PRIMARY KEY\s*\((.*?)\)$', part, re.I|re.S)
        if pk:
            cols = replace_backtick_idents(pk.group(1))
            out.append(f'ALTER TABLE {qident(table)} ADD PRIMARY KEY ({cols});\n')
            continue
        uq = re.match(r'ADD UNIQUE KEY\s+`([^`]+)`\s*\((.*?)\)$', part, re.I|re.S)
        if uq:
            name, cols = uq.groups()
            out.append(f'CREATE UNIQUE INDEX IF NOT EXISTS {qident(table + "_" + name + "_uidx")} ON {qident(table)} ({replace_backtick_idents(cols)});\n')
            continue
        key = re.match(r'ADD KEY\s+`([^`]+)`\s*\((.*?)\)$', part, re.I|re.S)
        if key:
            name, cols = key.groups()
            safe_name = table + '_' + name + '_idx'
            out.append(f'CREATE INDEX IF NOT EXISTS {qident(safe_name)} ON {qident(table)} ({replace_backtick_idents(cols)});\n')
            continue
    return out


def convert_sequences(stmt: str):
    m = re.match(r'ALTER TABLE\s+`([^`]+)`\s+MODIFY\s+`([^`]+)`.*AUTO_INCREMENT,?\s*AUTO_INCREMENT\s*=\s*(\d+)', stmt.strip(), re.I|re.S)
    if not m:
        return None
    table, col, nxt = m.groups()
    seq = f'{table}_{col}_seq'
    return (
        f'CREATE SEQUENCE IF NOT EXISTS {qident(seq)} START WITH {nxt};\n'
        f"SELECT setval('{seq}', GREATEST(COALESCE((SELECT MAX({qident(col)}) FROM {qident(table)}), 0) + 1, {nxt}), false);\n"
        f'ALTER TABLE {qident(table)} ALTER COLUMN {qident(col)} SET DEFAULT nextval(\'{seq}\');\n'
        f'ALTER SEQUENCE {qident(seq)} OWNED BY {qident(table)}.{qident(col)};\n'
    )


def convert(src=SRC_DEFAULT, out_dir=OUT_DIR_DEFAULT):
    out_dir.mkdir(parents=True, exist_ok=True)
    raw = src.read_text(encoding='utf-8', errors='replace')
    raw = clean_preamble(raw)
    statements = split_sql(raw)
    schema = ['-- Converted from MySQL dump for Supabase/PostgreSQL\n', 'SET client_encoding = \'UTF8\';\n', 'SET standard_conforming_strings = off;\n\n']
    data = ['-- Data converted from MySQL dump\n', 'SET client_encoding = \'UTF8\';\n', 'SET standard_conforming_strings = off;\n\n']
    indexes = ['\n-- Primary keys and indexes\n']
    sequences = ['\n-- Auto increment sequences\n']
    tables = []
    insert_count = 0
    for stmt in statements:
        stmt_strip = stmt.strip()
        if not stmt_strip:
            continue
        created = convert_create(stmt_strip)
        if created:
            table, sql = created
            tables.append(table)
            schema.append(sql + '\n')
            continue
        ins = convert_insert(stmt_strip)
        if ins:
            data.append(ins)
            insert_count += 1
            continue
        if stmt_strip.upper().startswith('ALTER TABLE'):
            seq = convert_sequences(stmt_strip)
            if seq:
                sequences.append(seq + '\n')
                continue
            indexes.extend(convert_alter_keys(stmt_strip))
            continue
    schema_text = ''.join(schema + indexes + sequences)
    data_text = ''.join(data)
    all_text = schema_text + '\n' + data_text
    (out_dir / 'schema.sql').write_text(schema_text, encoding='utf-8')
    (out_dir / 'data.sql').write_text(data_text, encoding='utf-8')
    (out_dir / 'all.sql').write_text(all_text, encoding='utf-8')

    chunk_dir = out_dir / 'data_chunks'
    chunk_dir.mkdir(exist_ok=True)
    for old_chunk in chunk_dir.glob('*.sql'):
        old_chunk.unlink()
    chunk_header = ''.join(data[:3])
    max_chunk_size = 8 * 1024 * 1024
    chunk_number = 1
    chunk_parts = [chunk_header]
    chunk_size = len(chunk_header.encode('utf-8'))
    for stmt in data[3:]:
        stmt_size = len(stmt.encode('utf-8'))
        if chunk_size > len(chunk_header) and chunk_size + stmt_size > max_chunk_size:
            (chunk_dir / f'data_part_{chunk_number:03d}.sql').write_text(''.join(chunk_parts), encoding='utf-8')
            chunk_number += 1
            chunk_parts = [chunk_header]
            chunk_size = len(chunk_header.encode('utf-8'))
        chunk_parts.append(stmt)
        chunk_size += stmt_size
    if len(chunk_parts) > 1:
        (chunk_dir / f'data_part_{chunk_number:03d}.sql').write_text(''.join(chunk_parts), encoding='utf-8')
    (out_dir / 'README.md').write_text(f'''# Supabase SQL Export\n\nGenerated from `{src}`.\n\nFiles:\n\n- `schema.sql` - PostgreSQL table definitions, primary keys, indexes, and sequences.\n- `data.sql` - converted INSERT data.\n- `all.sql` - schema + data in one file.\n- `data_chunks/` - data split into smaller files for Supabase SQL editor.\n\nSummary:\n\n- Tables converted: {len(tables)}\n- Insert statements converted: {insert_count}\n\nImport order for Supabase SQL editor or `psql`:\n\n1. Run `schema.sql`.\n2. Run `data.sql`, or run every file in `data_chunks/` sequentially if the SQL editor rejects large files.\n\nWarning: this is an automated MySQL-to-PostgreSQL conversion. Test login, presence, payroll, upload, and sync flows after import because some application queries may still rely on MySQL-specific behavior.\n''', encoding='utf-8')
    print(f'Converted tables={len(tables)} insert_statements={insert_count}')
    print(f'Output={out_dir.resolve()}')

if __name__ == '__main__':
    convert()
