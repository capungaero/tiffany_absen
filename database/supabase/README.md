# Supabase SQL Export

Generated from `D:\Downloads\newtiffa_timesheet 08 05 26.sql.txt`.

Files:

- `schema.sql` - PostgreSQL table definitions, primary keys, indexes, and sequences.
- `data.sql` - converted INSERT data.
- `all.sql` - schema + data in one file.
- `data_chunks/` - data split into smaller files for Supabase SQL editor.

Summary:

- Tables converted: 35
- Insert statements converted: 1391

Import order for Supabase SQL editor or `psql`:

1. Run `schema.sql`.
2. Run `data.sql`, or run every file in `data_chunks/` sequentially if the SQL editor rejects large files.

Warning: this is an automated MySQL-to-PostgreSQL conversion. Test login, presence, payroll, upload, and sync flows after import because some application queries may still rely on MySQL-specific behavior.
