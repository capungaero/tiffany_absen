-- Converted from MySQL dump for Supabase/PostgreSQL
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;

CREATE TABLE IF NOT EXISTS "asset" (
  "id" integer NOT NULL,
  "branch_id" integer DEFAULT NULL,
  "asset_code" varchar(200) DEFAULT NULL,
  "asset_name" varchar(200) DEFAULT NULL,
  "asset_description" text DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "asset_detail" (
  "id" integer NOT NULL,
  "asset_id" integer DEFAULT NULL,
  "asset_detail_name" varchar(200) DEFAULT NULL,
  "acquisition_date" date DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL,
  "is_condition" varchar(50) DEFAULT '0'
);

CREATE TABLE IF NOT EXISTS "asset_detail_location" (
  "id" integer NOT NULL,
  "asset_detail_id" integer DEFAULT NULL,
  "location_id" integer DEFAULT NULL,
  "move_date" date DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "branch" (
  "id" integer NOT NULL,
  "branch_code" varchar(200) DEFAULT NULL,
  "branch_name" varchar(200) DEFAULT NULL,
  "branch_phone" varchar(20) DEFAULT NULL,
  "branch_tax" integer DEFAULT NULL,
  "city" varchar(200) DEFAULT NULL,
  "address" text DEFAULT NULL,
  "percentage" integer DEFAULT NULL,
  "proporsional" integer DEFAULT NULL,
  "max_overtime" integer DEFAULT NULL,
  "bpjs_health" integer DEFAULT NULL,
  "bpjs_work" integer DEFAULT NULL,
  "payroll_date" integer DEFAULT NULL,
  "is_pray_system" varchar(50) DEFAULT '0',
  "is_fine_system" varchar(50) DEFAULT '0',
  "pray_late_start_rate" integer DEFAULT NULL,
  "pray_late_fix_rate" integer DEFAULT NULL,
  "pray_late_multiple_count" integer DEFAULT NULL,
  "pray_late_multiple_rate" integer DEFAULT NULL,
  "subuh_pray_time" time DEFAULT NULL,
  "subuh_pray_time_range" integer DEFAULT NULL,
  "subuh_pray_time_in" time DEFAULT NULL,
  "subuh_pray_time_out" time DEFAULT NULL,
  "dzuhur_pray_time" time DEFAULT NULL,
  "dzuhur_pray_time_range" integer DEFAULT NULL,
  "dzuhur_pray_time_in" time DEFAULT NULL,
  "dzuhur_pray_time_out" time DEFAULT NULL,
  "ashar_pray_time" time DEFAULT NULL,
  "ashar_pray_time_range" integer DEFAULT NULL,
  "ashar_pray_time_in" time DEFAULT NULL,
  "ashar_pray_time_out" time DEFAULT NULL,
  "maghrib_pray_time" time DEFAULT NULL,
  "maghrib_pray_time_range" integer DEFAULT NULL,
  "maghrib_pray_time_in" time DEFAULT NULL,
  "maghrib_pray_time_out" time DEFAULT NULL,
  "isha_pray_time" time DEFAULT NULL,
  "isha_pray_time_range" integer DEFAULT NULL,
  "isha_pray_time_in" time DEFAULT NULL,
  "isha_pray_time_out" time DEFAULT NULL,
  "friday_pray_time" time DEFAULT NULL,
  "friday_pray_time_range" integer DEFAULT NULL,
  "friday_pray_time_in" time DEFAULT NULL,
  "friday_pray_time_out" time DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "cashflow" (
  "id" integer NOT NULL,
  "branch_id" integer DEFAULT NULL,
  "cashflow_code" varchar(100) DEFAULT NULL,
  "cashflow_type" varchar(50) DEFAULT NULL,
  "cashflow_desc" text DEFAULT NULL,
  "total_price" integer DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "source" varchar(200) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "category" (
  "id" integer NOT NULL,
  "branch_id" integer DEFAULT NULL,
  "category_code" varchar(200) DEFAULT NULL,
  "category_name" varchar(200) DEFAULT NULL,
  "category_type" varchar(50) DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "component" (
  "id" integer NOT NULL,
  "category_id" integer DEFAULT NULL,
  "component_name" varchar(200) DEFAULT NULL,
  "component_type" varchar(50) DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "deduction" (
  "id" integer NOT NULL,
  "branch_id" integer DEFAULT NULL,
  "deduction_name" varchar(200) DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "groups" (
  "id" integer NOT NULL,
  "name" varchar(100) NOT NULL,
  "description" varchar(100) NOT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "insentif" (
  "id" integer NOT NULL,
  "branch_id" integer DEFAULT NULL,
  "insentif_name" varchar(200) DEFAULT NULL,
  "formula" varchar(50) DEFAULT 'none',
  "nominal" integer DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "leave" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "leave_proof" varchar(250) DEFAULT NULL,
  "leave_start" date DEFAULT NULL,
  "leave_end" date DEFAULT NULL,
  "leave_range" integer DEFAULT NULL,
  "leave_type" varchar(50) DEFAULT NULL,
  "default_potongan" integer DEFAULT NULL,
  "request_potongan" integer DEFAULT NULL,
  "jumlah_hari_potongan" integer DEFAULT NULL,
  "acc_potongan" integer DEFAULT NULL,
  "leave_status" varchar(50) DEFAULT 'pending',
  "leave_reason" text DEFAULT NULL,
  "reject_reason" text DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "confirm_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "location" (
  "id" integer NOT NULL,
  "branch_id" integer DEFAULT NULL,
  "location_code" varchar(200) DEFAULT NULL,
  "location_name" varchar(200) DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "login_attempts" (
  "id" integer NOT NULL,
  "ip_address" varchar(45) NOT NULL,
  "login" varchar(100) NOT NULL,
  "time" integer DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "maintenance" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "maintenance_code" varchar(200) DEFAULT NULL,
  "maintenance_status" varchar(50) DEFAULT 'pending',
  "maintenance_description" text DEFAULT NULL,
  "maintenance_file" varchar(200) DEFAULT NULL,
  "type" varchar(50) DEFAULT NULL,
  "reject_reason" text DEFAULT NULL,
  "is_created" varchar(50) DEFAULT '0',
  "is_fixed" varchar(50) DEFAULT '0',
  "created_at" timestamp DEFAULT NULL,
  "confirm_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "maintenance_detail" (
  "id" integer NOT NULL,
  "maintenance_id" integer DEFAULT NULL,
  "asset_detail_id" integer DEFAULT NULL,
  "maintenance_detail_description" text DEFAULT NULL,
  "asset_photo" varchar(200) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "overtime" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "overtime_proof" varchar(200) DEFAULT NULL,
  "overtime_hour" real DEFAULT NULL,
  "overtime_date" date DEFAULT NULL,
  "overtime_status" varchar(50) DEFAULT 'pending',
  "reject_reason" text DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "confirm_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "payroll" (
  "id" integer NOT NULL,
  "payroll_code" varchar(100) DEFAULT NULL,
  "branch_id" integer DEFAULT NULL,
  "month" integer DEFAULT NULL,
  "year" smallint DEFAULT NULL,
  "total_employee" integer DEFAULT 0,
  "out_together_nominal" integer DEFAULT 0,
  "total_salary_in_basic" integer DEFAULT 0,
  "total_salary_in_overtime" integer DEFAULT 0,
  "total_salary_in_insentive" integer DEFAULT 0,
  "total_salary_out_fine" integer DEFAULT 0,
  "total_salary_out_work" integer DEFAULT 0,
  "total_salary_out_health" integer DEFAULT 0,
  "total_salary_out_together" integer DEFAULT 0,
  "total_salary_out_deduction" integer DEFAULT NULL,
  "total_salary_thp" integer DEFAULT 0,
  "total_salary_debt" integer DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "is_final" varchar(50) NOT NULL DEFAULT '0',
  "created_final_at" timestamp NOT NULL,
  "created_rollback_at" timestamp NOT NULL,
  "updated_final_at" timestamp NOT NULL,
  "updated_rollback_at" timestamp NOT NULL
);

CREATE TABLE IF NOT EXISTS "payroll_deduction" (
  "id" integer NOT NULL,
  "payroll_id" integer DEFAULT NULL,
  "user_id" integer NOT NULL,
  "deduction_id" integer DEFAULT NULL,
  "deduction_month" integer DEFAULT NULL,
  "deduction_year" integer DEFAULT NULL,
  "deduction_amount" integer DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "payroll_detail" (
  "id" integer NOT NULL,
  "payroll_id" integer DEFAULT NULL,
  "user_id" integer NOT NULL,
  "payroll_account_number" varchar(200) DEFAULT NULL,
  "payroll_account_bank" varchar(200) DEFAULT NULL,
  "payroll_account_name" varchar(200) DEFAULT NULL,
  "presence_count" integer DEFAULT 0,
  "presence_max" integer DEFAULT 0,
  "presence_count_on_time" integer DEFAULT 0,
  "presence_count_on_late" integer DEFAULT 0,
  "presence_count_on_half" integer DEFAULT 0,
  "presence_count_on_leave" integer DEFAULT 0,
  "presence_count_on_cuti" integer DEFAULT 0,
  "presence_count_on_sakit" integer DEFAULT 0,
  "presence_count_on_izin" integer DEFAULT 0,
  "presence_off_count_on_weekdays" integer DEFAULT 0,
  "presence_off_count_on_weekend" integer DEFAULT 0,
  "subuh_count" integer DEFAULT 0,
  "subuh_count_on_time" integer DEFAULT 0,
  "subuh_count_on_late" integer DEFAULT 0,
  "dzuhur_count" integer DEFAULT 0,
  "dzuhur_count_on_time" integer DEFAULT 0,
  "dzuhur_count_on_late" integer DEFAULT 0,
  "ashar_count" integer DEFAULT 0,
  "ashar_count_on_time" integer DEFAULT 0,
  "ashar_count_on_late" integer DEFAULT 0,
  "maghrib_count" integer DEFAULT 0,
  "maghrib_count_on_time" integer DEFAULT 0,
  "maghrib_count_on_late" integer DEFAULT 0,
  "isha_count" integer DEFAULT 0,
  "isha_count_on_time" integer DEFAULT 0,
  "isha_count_on_late" integer DEFAULT 0,
  "friday_count" integer DEFAULT 0,
  "friday_count_on_time" integer DEFAULT 0,
  "friday_count_on_late" integer DEFAULT 0,
  "salary_basic_in_full" integer DEFAULT 0,
  "salary_basic_out_off_work" integer DEFAULT 0,
  "salary_basic_out_alfa" integer DEFAULT 0,
  "salary_basic_out_alfa_weekdays" integer DEFAULT 0,
  "salary_basic_out_alfa_weekend" integer DEFAULT 0,
  "salary_in_insentive" integer DEFAULT 0,
  "salary_in_overtime" integer DEFAULT 0,
  "salary_in_basic" integer DEFAULT 0,
  "salary_out_work" integer DEFAULT 0,
  "salary_out_health" integer DEFAULT 0,
  "salary_out_fine" integer DEFAULT 0,
  "salary_out_together" integer DEFAULT 0,
  "salary_out_deduction" integer DEFAULT NULL,
  "salary_thp" integer DEFAULT 0,
  "salary_debt" integer DEFAULT NULL,
  "payroll_fine" text DEFAULT NULL,
  "payroll_insentive" text DEFAULT NULL,
  "payroll_deduction" text DEFAULT NULL,
  "total_overtime_hour" double precision DEFAULT 0
);

CREATE TABLE IF NOT EXISTS "payroll_insentif" (
  "id" integer NOT NULL,
  "payroll_id" integer DEFAULT NULL,
  "user_id" integer NOT NULL,
  "insentif_id" integer DEFAULT NULL,
  "insentif_month" integer DEFAULT NULL,
  "insentif_year" integer DEFAULT NULL,
  "insentif_amount" integer DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "position" (
  "id" integer NOT NULL,
  "branch_id" integer DEFAULT NULL,
  "position_code" varchar(200) DEFAULT NULL,
  "position_name" varchar(200) DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL,
  "is_default" varchar(50) DEFAULT '0'
);

CREATE TABLE IF NOT EXISTS "presence" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "entry_time" timestamp DEFAULT NULL,
  "entry_time_late" integer DEFAULT 0,
  "out_time" timestamp DEFAULT NULL,
  "rest_time_in" timestamp DEFAULT NULL,
  "rest_time_out" timestamp DEFAULT NULL,
  "rest_time_late" integer DEFAULT 0,
  "subuh_time_in" timestamp DEFAULT NULL,
  "subuh_time_out" timestamp DEFAULT NULL,
  "subuh_time_late" integer DEFAULT 0,
  "dzuhur_time_in" timestamp DEFAULT NULL,
  "dzuhur_time_out" timestamp DEFAULT NULL,
  "dzuhur_time_late" integer DEFAULT 0,
  "ashar_time_in" timestamp DEFAULT NULL,
  "ashar_time_out" timestamp DEFAULT NULL,
  "ashar_time_late" integer DEFAULT 0,
  "maghrib_time_in" timestamp DEFAULT NULL,
  "maghrib_time_out" timestamp DEFAULT NULL,
  "maghrib_time_late" integer DEFAULT 0,
  "isha_time_in" timestamp DEFAULT NULL,
  "isha_time_out" timestamp DEFAULT NULL,
  "isha_time_late" integer DEFAULT 0,
  "friday_time_in" timestamp DEFAULT NULL,
  "friday_time_out" timestamp DEFAULT NULL,
  "friday_time_late" integer DEFAULT 0,
  "flow_date" varchar(200) DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "input_by" varchar(50) DEFAULT NULL,
  "input_by_user_id" integer DEFAULT NULL,
  "presence_get_paid" integer DEFAULT 100,
  "presence_type" varchar(50) DEFAULT 'normal',
  "presence_status" varchar(50) DEFAULT 'approved',
  "is_overtime" varchar(50) NOT NULL DEFAULT '0',
  "flag" varchar(50) DEFAULT '0'
);

CREATE TABLE IF NOT EXISTS "shift" (
  "id" integer NOT NULL,
  "branch_id" integer DEFAULT NULL,
  "shift_code" varchar(100) DEFAULT NULL,
  "shift_name" varchar(200) DEFAULT NULL,
  "start_time" time DEFAULT NULL,
  "end_time" time DEFAULT NULL,
  "start_time_in" time DEFAULT NULL,
  "start_time_out" time DEFAULT NULL,
  "start_time_late" time DEFAULT NULL,
  "end_time_in" time DEFAULT NULL,
  "end_time_out" time DEFAULT NULL,
  "late_amount_start" integer DEFAULT NULL,
  "late_amount_max_start" integer DEFAULT NULL,
  "late_amount_multiple_start" integer DEFAULT NULL,
  "late_multiple_count_start" integer DEFAULT NULL,
  "start_time_rest" time DEFAULT NULL,
  "end_time_rest" time DEFAULT NULL,
  "rest_time_range" integer DEFAULT NULL,
  "start_time_rest_friday" time NOT NULL,
  "end_time_rest_friday" time NOT NULL,
  "rest_time_range_friday" integer NOT NULL,
  "late_amount_rest" integer DEFAULT NULL,
  "late_amount_max_rest" integer DEFAULT NULL,
  "late_amount_multiple_rest" integer DEFAULT NULL,
  "late_multiple_count_rest" integer DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "shift_cluster" (
  "id" integer NOT NULL,
  "branch_id" integer DEFAULT NULL,
  "cluster_code" varchar(200) DEFAULT NULL,
  "cluster_name" varchar(200) DEFAULT NULL,
  "cluster_applies" date DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "shift_cluster_rotation" (
  "id" integer NOT NULL,
  "shift_cluster_id" integer DEFAULT NULL,
  "shift_id" integer DEFAULT NULL,
  "num" integer DEFAULT NULL,
  "shift_type" varchar(50) DEFAULT 'work'
);

CREATE TABLE IF NOT EXISTS "subdivision" (
  "id" integer NOT NULL,
  "branch_id" integer DEFAULT NULL,
  "subdivision_code" varchar(200) DEFAULT NULL,
  "subdivision_name" varchar(200) DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "transaction" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "category_id" integer DEFAULT NULL,
  "approve_by_user_id" integer DEFAULT NULL,
  "transaction_code" varchar(200) DEFAULT NULL,
  "transaction_date" date DEFAULT NULL,
  "transaction_status" varchar(50) DEFAULT 'pending',
  "transaction_photo" varchar(200) DEFAULT NULL,
  "transaction_photo_transfer" varchar(200) DEFAULT NULL,
  "transaction_desc" text DEFAULT NULL,
  "realization_file" varchar(200) DEFAULT NULL,
  "type" varchar(50) DEFAULT NULL,
  "outcome" varchar(50) DEFAULT NULL,
  "total_confirm" integer DEFAULT NULL,
  "total_realization" integer DEFAULT NULL,
  "total" integer DEFAULT NULL,
  "reject_reason" text DEFAULT NULL,
  "is_created" varchar(50) DEFAULT '0',
  "is_returned" varchar(50) DEFAULT '1',
  "is_transfered" varchar(50) DEFAULT NULL,
  "transfer_date" date DEFAULT NULL,
  "returned_at" timestamp DEFAULT NULL,
  "confirm_returned_at" timestamp DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "confirm_at" timestamp DEFAULT NULL,
  "confirm_transfered_at" timestamp DEFAULT NULL,
  "realization_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "transaction_detail" (
  "id" integer NOT NULL,
  "transaction_id" integer DEFAULT NULL,
  "component_id" integer DEFAULT NULL,
  "price" integer DEFAULT NULL,
  "price_realization" integer DEFAULT NULL,
  "qty" integer DEFAULT NULL,
  "qty_realization" integer DEFAULT NULL,
  "unit" varchar(200) DEFAULT NULL,
  "subtotal" integer DEFAULT NULL,
  "subtotal_realization" integer DEFAULT NULL,
  "transaction_detail_description" text DEFAULT NULL,
  "comp_status" varchar(50) DEFAULT 'approved'
);

CREATE TABLE IF NOT EXISTS "transaction_realization" (
  "id" integer NOT NULL,
  "transaction_id" integer DEFAULT NULL,
  "realization_code" integer DEFAULT NULL,
  "realization_date" date DEFAULT NULL,
  "realization_photo" varchar(200) DEFAULT NULL,
  "total_realization" integer DEFAULT 0,
  "is_created" varchar(50) DEFAULT '0',
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL,
  "input_by" integer DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "transaction_realization_detail" (
  "id" integer NOT NULL,
  "transaction_realization_id" integer DEFAULT NULL,
  "transaction_detail_id" integer DEFAULT NULL,
  "qty" integer DEFAULT NULL,
  "unit" varchar(200) DEFAULT NULL,
  "price" integer DEFAULT NULL,
  "subtotal" integer DEFAULT NULL,
  "transaction_realization_detail_description" varchar(250) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "transaction_request_fund" (
  "id" integer NOT NULL,
  "transaction_id" integer DEFAULT NULL,
  "request_code" varchar(200) DEFAULT NULL,
  "total_request" integer DEFAULT NULL,
  "total_request_confirm" integer DEFAULT NULL,
  "status_request" varchar(50) DEFAULT 'pending',
  "request_photo" varchar(200) DEFAULT NULL,
  "request_description" text DEFAULT NULL,
  "request_reject_reason" text DEFAULT NULL,
  "request_transfer_date" date DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "transfer_at" timestamp DEFAULT NULL,
  "input_by" integer DEFAULT NULL,
  "confirm_by" integer DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "users" (
  "id" integer NOT NULL,
  "position_id" integer DEFAULT NULL,
  "subdivision_id" integer DEFAULT NULL,
  "ip_address" varchar(45) NOT NULL,
  "username" varchar(100) DEFAULT NULL,
  "password" varchar(255) NOT NULL,
  "email" varchar(254) NOT NULL,
  "activation_selector" varchar(255) DEFAULT NULL,
  "activation_code" varchar(255) DEFAULT NULL,
  "forgotten_password_selector" varchar(255) DEFAULT NULL,
  "forgotten_password_code" varchar(255) DEFAULT NULL,
  "forgotten_password_time" integer DEFAULT NULL,
  "remember_selector" varchar(255) DEFAULT NULL,
  "remember_code" varchar(255) DEFAULT NULL,
  "created_time" timestamp DEFAULT NULL,
  "created_on" integer NOT NULL,
  "last_login_time" timestamp DEFAULT NULL,
  "last_login" integer DEFAULT NULL,
  "active" smallint DEFAULT NULL,
  "contract_number" varchar(200) DEFAULT NULL,
  "account_number" varchar(200) DEFAULT NULL,
  "account_bank" varchar(200) DEFAULT NULL,
  "account_name" varchar(200) DEFAULT NULL,
  "first_name" varchar(50) DEFAULT NULL,
  "last_name" varchar(50) DEFAULT NULL,
  "join_date" date DEFAULT NULL,
  "employee_code" varchar(200) DEFAULT NULL,
  "phone" varchar(20) DEFAULT NULL,
  "salary" integer DEFAULT NULL,
  "salary_minimum" integer DEFAULT 0,
  "overtime_hour_rate" integer DEFAULT 0,
  "photo" varchar(100) DEFAULT 'default_photo.jpg',
  "employee_address" varchar(200) DEFAULT NULL,
  "file_cv" varchar(200) DEFAULT NULL,
  "bio" varchar(250) DEFAULT NULL,
  "last_status" timestamp DEFAULT NULL,
  "is_up_percentage_salary" varchar(50) NOT NULL DEFAULT '0',
  "status_work" varchar(50) DEFAULT NULL,
  "status_work_expiration" date DEFAULT NULL,
  "npwp_number" varchar(100) NOT NULL,
  "ptkp_status" varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS "users_groups" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "group_id" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS "users_shift_additional" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "shift_id" integer DEFAULT NULL,
  "additional_date" date DEFAULT NULL,
  "additional_type" varchar(50) DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS "users_shift_cluster" (
  "id" integer NOT NULL,
  "user_id" integer NOT NULL,
  "shift_cluster_id" integer DEFAULT NULL,
  "shift_applies" date DEFAULT NULL,
  "created_at" timestamp DEFAULT NULL,
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);


-- Primary keys and indexes
ALTER TABLE "asset" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "asset_branch_id_idx" ON "asset" ("branch_id");
ALTER TABLE "asset_detail" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "asset_detail_asset_id_idx" ON "asset_detail" ("asset_id");
ALTER TABLE "asset_detail_location" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "asset_detail_location_location_id_idx" ON "asset_detail_location" ("location_id");
CREATE INDEX IF NOT EXISTS "asset_detail_location_asset_detail_id_idx" ON "asset_detail_location" ("asset_detail_id");
ALTER TABLE "branch" ADD PRIMARY KEY ("id");
ALTER TABLE "cashflow" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "cashflow_branch_id_idx" ON "cashflow" ("branch_id");
ALTER TABLE "category" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "category_branch_id_idx" ON "category" ("branch_id");
ALTER TABLE "component" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "component_category_id_idx" ON "component" ("category_id");
ALTER TABLE "deduction" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "deduction_branch_id_idx" ON "deduction" ("branch_id");
ALTER TABLE "groups" ADD PRIMARY KEY ("id");
ALTER TABLE "insentif" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "insentif_branch_id_idx" ON "insentif" ("branch_id");
ALTER TABLE "leave" ADD PRIMARY KEY ("id");
ALTER TABLE "location" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "location_branch_id_idx" ON "location" ("branch_id");
ALTER TABLE "login_attempts" ADD PRIMARY KEY ("id");
ALTER TABLE "maintenance" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "maintenance_user_id_idx" ON "maintenance" ("user_id");
ALTER TABLE "maintenance_detail" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "maintenance_detail_maintenance_id_idx" ON "maintenance_detail" ("maintenance_id");
CREATE INDEX IF NOT EXISTS "maintenance_detail_asset_detail_id_idx" ON "maintenance_detail" ("asset_detail_id");
ALTER TABLE "overtime" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "overtime_user_id_idx" ON "overtime" ("user_id");
ALTER TABLE "payroll" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "payroll_branch_id_idx" ON "payroll" ("branch_id");
ALTER TABLE "payroll_deduction" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "payroll_deduction_payroll_id_idx" ON "payroll_deduction" ("payroll_id");
CREATE INDEX IF NOT EXISTS "payroll_deduction_deduction_id_idx" ON "payroll_deduction" ("deduction_id");
CREATE INDEX IF NOT EXISTS "payroll_deduction_user_id_idx" ON "payroll_deduction" ("user_id");
ALTER TABLE "payroll_detail" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "payroll_detail_payroll_id_idx" ON "payroll_detail" ("payroll_id");
CREATE INDEX IF NOT EXISTS "payroll_detail_user_id_idx" ON "payroll_detail" ("user_id");
ALTER TABLE "payroll_insentif" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "payroll_insentif_payroll_id_idx" ON "payroll_insentif" ("payroll_id");
CREATE INDEX IF NOT EXISTS "payroll_insentif_user_id_idx" ON "payroll_insentif" ("user_id");
CREATE INDEX IF NOT EXISTS "payroll_insentif_insentif_id_idx" ON "payroll_insentif" ("insentif_id");
ALTER TABLE "position" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "position_branch_id_idx" ON "position" ("branch_id");
ALTER TABLE "presence" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "presence_users_id_idx" ON "presence" ("user_id");
ALTER TABLE "shift" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "shift_branch_id_idx" ON "shift" ("branch_id");
ALTER TABLE "shift_cluster" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "shift_cluster_branch_id_idx" ON "shift_cluster" ("branch_id");
ALTER TABLE "shift_cluster_rotation" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "shift_cluster_rotation_shift_cluster_id_idx" ON "shift_cluster_rotation" ("shift_cluster_id");
CREATE INDEX IF NOT EXISTS "shift_cluster_rotation_shift_id_idx" ON "shift_cluster_rotation" ("shift_id");
ALTER TABLE "subdivision" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "subdivision_branch_id_idx" ON "subdivision" ("branch_id");
ALTER TABLE "transaction" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "transaction_user_id_idx" ON "transaction" ("user_id");
CREATE INDEX IF NOT EXISTS "transaction_category_id_idx" ON "transaction" ("category_id");
ALTER TABLE "transaction_detail" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "transaction_detail_transaction_id_idx" ON "transaction_detail" ("transaction_id");
CREATE INDEX IF NOT EXISTS "transaction_detail_component_id_idx" ON "transaction_detail" ("component_id");
ALTER TABLE "transaction_realization" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "transaction_realization_transaction_id_idx" ON "transaction_realization" ("transaction_id");
ALTER TABLE "transaction_realization_detail" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "transaction_realization_detail_transaction_detail_id_idx" ON "transaction_realization_detail" ("transaction_detail_id");
CREATE INDEX IF NOT EXISTS "transaction_realization_detail_transaction_realization_id_idx" ON "transaction_realization_detail" ("transaction_realization_id");
ALTER TABLE "transaction_request_fund" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "transaction_request_fund_transaction_id_idx" ON "transaction_request_fund" ("transaction_id");
ALTER TABLE "users" ADD PRIMARY KEY ("id");
CREATE UNIQUE INDEX IF NOT EXISTS "users_uc_email_uidx" ON "users" ("email");
CREATE UNIQUE INDEX IF NOT EXISTS "users_uc_activation_selector_uidx" ON "users" ("activation_selector");
CREATE UNIQUE INDEX IF NOT EXISTS "users_uc_forgotten_password_selector_uidx" ON "users" ("forgotten_password_selector");
CREATE UNIQUE INDEX IF NOT EXISTS "users_uc_remember_selector_uidx" ON "users" ("remember_selector");
CREATE INDEX IF NOT EXISTS "users_position_id_idx" ON "users" ("position_id");
CREATE INDEX IF NOT EXISTS "users_subdivision_id_idx" ON "users" ("subdivision_id");
ALTER TABLE "users_groups" ADD PRIMARY KEY ("id");
CREATE UNIQUE INDEX IF NOT EXISTS "users_groups_uc_users_groups_uidx" ON "users_groups" ("user_id","group_id");
CREATE INDEX IF NOT EXISTS "users_groups_fk_users_groups_users1_idx_idx" ON "users_groups" ("user_id");
CREATE INDEX IF NOT EXISTS "users_groups_fk_users_groups_groups1_idx_idx" ON "users_groups" ("group_id");
ALTER TABLE "users_shift_additional" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "users_shift_additional_user_id_idx" ON "users_shift_additional" ("user_id");
CREATE INDEX IF NOT EXISTS "users_shift_additional_shift_id_idx" ON "users_shift_additional" ("shift_id");
ALTER TABLE "users_shift_cluster" ADD PRIMARY KEY ("id");
CREATE INDEX IF NOT EXISTS "users_shift_cluster_user_id_idx" ON "users_shift_cluster" ("user_id");
CREATE INDEX IF NOT EXISTS "users_shift_cluster_shift_cluster_id_idx" ON "users_shift_cluster" ("shift_cluster_id");

-- Auto increment sequences
CREATE SEQUENCE IF NOT EXISTS "asset_id_seq" START WITH 14;
SELECT setval('asset_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "asset"), 0) + 1, 14), false);
ALTER TABLE "asset" ALTER COLUMN "id" SET DEFAULT nextval('asset_id_seq');
ALTER SEQUENCE "asset_id_seq" OWNED BY "asset"."id";

CREATE SEQUENCE IF NOT EXISTS "asset_detail_id_seq" START WITH 63;
SELECT setval('asset_detail_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "asset_detail"), 0) + 1, 63), false);
ALTER TABLE "asset_detail" ALTER COLUMN "id" SET DEFAULT nextval('asset_detail_id_seq');
ALTER SEQUENCE "asset_detail_id_seq" OWNED BY "asset_detail"."id";

CREATE SEQUENCE IF NOT EXISTS "asset_detail_location_id_seq" START WITH 37;
SELECT setval('asset_detail_location_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "asset_detail_location"), 0) + 1, 37), false);
ALTER TABLE "asset_detail_location" ALTER COLUMN "id" SET DEFAULT nextval('asset_detail_location_id_seq');
ALTER SEQUENCE "asset_detail_location_id_seq" OWNED BY "asset_detail_location"."id";

CREATE SEQUENCE IF NOT EXISTS "branch_id_seq" START WITH 15;
SELECT setval('branch_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "branch"), 0) + 1, 15), false);
ALTER TABLE "branch" ALTER COLUMN "id" SET DEFAULT nextval('branch_id_seq');
ALTER SEQUENCE "branch_id_seq" OWNED BY "branch"."id";

CREATE SEQUENCE IF NOT EXISTS "cashflow_id_seq" START WITH 139;
SELECT setval('cashflow_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "cashflow"), 0) + 1, 139), false);
ALTER TABLE "cashflow" ALTER COLUMN "id" SET DEFAULT nextval('cashflow_id_seq');
ALTER SEQUENCE "cashflow_id_seq" OWNED BY "cashflow"."id";

CREATE SEQUENCE IF NOT EXISTS "category_id_seq" START WITH 53;
SELECT setval('category_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "category"), 0) + 1, 53), false);
ALTER TABLE "category" ALTER COLUMN "id" SET DEFAULT nextval('category_id_seq');
ALTER SEQUENCE "category_id_seq" OWNED BY "category"."id";

CREATE SEQUENCE IF NOT EXISTS "component_id_seq" START WITH 4;
SELECT setval('component_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "component"), 0) + 1, 4), false);
ALTER TABLE "component" ALTER COLUMN "id" SET DEFAULT nextval('component_id_seq');
ALTER SEQUENCE "component_id_seq" OWNED BY "component"."id";

CREATE SEQUENCE IF NOT EXISTS "deduction_id_seq" START WITH 66;
SELECT setval('deduction_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "deduction"), 0) + 1, 66), false);
ALTER TABLE "deduction" ALTER COLUMN "id" SET DEFAULT nextval('deduction_id_seq');
ALTER SEQUENCE "deduction_id_seq" OWNED BY "deduction"."id";

CREATE SEQUENCE IF NOT EXISTS "groups_id_seq" START WITH 12;
SELECT setval('groups_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "groups"), 0) + 1, 12), false);
ALTER TABLE "groups" ALTER COLUMN "id" SET DEFAULT nextval('groups_id_seq');
ALTER SEQUENCE "groups_id_seq" OWNED BY "groups"."id";

CREATE SEQUENCE IF NOT EXISTS "insentif_id_seq" START WITH 67;
SELECT setval('insentif_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "insentif"), 0) + 1, 67), false);
ALTER TABLE "insentif" ALTER COLUMN "id" SET DEFAULT nextval('insentif_id_seq');
ALTER SEQUENCE "insentif_id_seq" OWNED BY "insentif"."id";

CREATE SEQUENCE IF NOT EXISTS "leave_id_seq" START WITH 1995;
SELECT setval('leave_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "leave"), 0) + 1, 1995), false);
ALTER TABLE "leave" ALTER COLUMN "id" SET DEFAULT nextval('leave_id_seq');
ALTER SEQUENCE "leave_id_seq" OWNED BY "leave"."id";

CREATE SEQUENCE IF NOT EXISTS "location_id_seq" START WITH 14;
SELECT setval('location_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "location"), 0) + 1, 14), false);
ALTER TABLE "location" ALTER COLUMN "id" SET DEFAULT nextval('location_id_seq');
ALTER SEQUENCE "location_id_seq" OWNED BY "location"."id";

CREATE SEQUENCE IF NOT EXISTS "login_attempts_id_seq" START WITH 10356;
SELECT setval('login_attempts_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "login_attempts"), 0) + 1, 10356), false);
ALTER TABLE "login_attempts" ALTER COLUMN "id" SET DEFAULT nextval('login_attempts_id_seq');
ALTER SEQUENCE "login_attempts_id_seq" OWNED BY "login_attempts"."id";

CREATE SEQUENCE IF NOT EXISTS "maintenance_id_seq" START WITH 16;
SELECT setval('maintenance_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "maintenance"), 0) + 1, 16), false);
ALTER TABLE "maintenance" ALTER COLUMN "id" SET DEFAULT nextval('maintenance_id_seq');
ALTER SEQUENCE "maintenance_id_seq" OWNED BY "maintenance"."id";

CREATE SEQUENCE IF NOT EXISTS "maintenance_detail_id_seq" START WITH 19;
SELECT setval('maintenance_detail_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "maintenance_detail"), 0) + 1, 19), false);
ALTER TABLE "maintenance_detail" ALTER COLUMN "id" SET DEFAULT nextval('maintenance_detail_id_seq');
ALTER SEQUENCE "maintenance_detail_id_seq" OWNED BY "maintenance_detail"."id";

CREATE SEQUENCE IF NOT EXISTS "overtime_id_seq" START WITH 13952;
SELECT setval('overtime_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "overtime"), 0) + 1, 13952), false);
ALTER TABLE "overtime" ALTER COLUMN "id" SET DEFAULT nextval('overtime_id_seq');
ALTER SEQUENCE "overtime_id_seq" OWNED BY "overtime"."id";

CREATE SEQUENCE IF NOT EXISTS "payroll_id_seq" START WITH 750;
SELECT setval('payroll_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "payroll"), 0) + 1, 750), false);
ALTER TABLE "payroll" ALTER COLUMN "id" SET DEFAULT nextval('payroll_id_seq');
ALTER SEQUENCE "payroll_id_seq" OWNED BY "payroll"."id";

CREATE SEQUENCE IF NOT EXISTS "payroll_deduction_id_seq" START WITH 110948;
SELECT setval('payroll_deduction_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "payroll_deduction"), 0) + 1, 110948), false);
ALTER TABLE "payroll_deduction" ALTER COLUMN "id" SET DEFAULT nextval('payroll_deduction_id_seq');
ALTER SEQUENCE "payroll_deduction_id_seq" OWNED BY "payroll_deduction"."id";

CREATE SEQUENCE IF NOT EXISTS "payroll_detail_id_seq" START WITH 31092;
SELECT setval('payroll_detail_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "payroll_detail"), 0) + 1, 31092), false);
ALTER TABLE "payroll_detail" ALTER COLUMN "id" SET DEFAULT nextval('payroll_detail_id_seq');
ALTER SEQUENCE "payroll_detail_id_seq" OWNED BY "payroll_detail"."id";

CREATE SEQUENCE IF NOT EXISTS "payroll_insentif_id_seq" START WITH 156143;
SELECT setval('payroll_insentif_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "payroll_insentif"), 0) + 1, 156143), false);
ALTER TABLE "payroll_insentif" ALTER COLUMN "id" SET DEFAULT nextval('payroll_insentif_id_seq');
ALTER SEQUENCE "payroll_insentif_id_seq" OWNED BY "payroll_insentif"."id";

CREATE SEQUENCE IF NOT EXISTS "position_id_seq" START WITH 78;
SELECT setval('position_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "position"), 0) + 1, 78), false);
ALTER TABLE "position" ALTER COLUMN "id" SET DEFAULT nextval('position_id_seq');
ALTER SEQUENCE "position_id_seq" OWNED BY "position"."id";

CREATE SEQUENCE IF NOT EXISTS "presence_id_seq" START WITH 360813;
SELECT setval('presence_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "presence"), 0) + 1, 360813), false);
ALTER TABLE "presence" ALTER COLUMN "id" SET DEFAULT nextval('presence_id_seq');
ALTER SEQUENCE "presence_id_seq" OWNED BY "presence"."id";

CREATE SEQUENCE IF NOT EXISTS "shift_id_seq" START WITH 120;
SELECT setval('shift_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "shift"), 0) + 1, 120), false);
ALTER TABLE "shift" ALTER COLUMN "id" SET DEFAULT nextval('shift_id_seq');
ALTER SEQUENCE "shift_id_seq" OWNED BY "shift"."id";

CREATE SEQUENCE IF NOT EXISTS "shift_cluster_id_seq" START WITH 34;
SELECT setval('shift_cluster_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "shift_cluster"), 0) + 1, 34), false);
ALTER TABLE "shift_cluster" ALTER COLUMN "id" SET DEFAULT nextval('shift_cluster_id_seq');
ALTER SEQUENCE "shift_cluster_id_seq" OWNED BY "shift_cluster"."id";

CREATE SEQUENCE IF NOT EXISTS "shift_cluster_rotation_id_seq" START WITH 338;
SELECT setval('shift_cluster_rotation_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "shift_cluster_rotation"), 0) + 1, 338), false);
ALTER TABLE "shift_cluster_rotation" ALTER COLUMN "id" SET DEFAULT nextval('shift_cluster_rotation_id_seq');
ALTER SEQUENCE "shift_cluster_rotation_id_seq" OWNED BY "shift_cluster_rotation"."id";

CREATE SEQUENCE IF NOT EXISTS "subdivision_id_seq" START WITH 14;
SELECT setval('subdivision_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "subdivision"), 0) + 1, 14), false);
ALTER TABLE "subdivision" ALTER COLUMN "id" SET DEFAULT nextval('subdivision_id_seq');
ALTER SEQUENCE "subdivision_id_seq" OWNED BY "subdivision"."id";

CREATE SEQUENCE IF NOT EXISTS "transaction_id_seq" START WITH 58;
SELECT setval('transaction_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "transaction"), 0) + 1, 58), false);
ALTER TABLE "transaction" ALTER COLUMN "id" SET DEFAULT nextval('transaction_id_seq');
ALTER SEQUENCE "transaction_id_seq" OWNED BY "transaction"."id";

CREATE SEQUENCE IF NOT EXISTS "transaction_detail_id_seq" START WITH 96;
SELECT setval('transaction_detail_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "transaction_detail"), 0) + 1, 96), false);
ALTER TABLE "transaction_detail" ALTER COLUMN "id" SET DEFAULT nextval('transaction_detail_id_seq');
ALTER SEQUENCE "transaction_detail_id_seq" OWNED BY "transaction_detail"."id";

CREATE SEQUENCE IF NOT EXISTS "transaction_realization_id_seq" START WITH 3;
SELECT setval('transaction_realization_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "transaction_realization"), 0) + 1, 3), false);
ALTER TABLE "transaction_realization" ALTER COLUMN "id" SET DEFAULT nextval('transaction_realization_id_seq');
ALTER SEQUENCE "transaction_realization_id_seq" OWNED BY "transaction_realization"."id";

CREATE SEQUENCE IF NOT EXISTS "transaction_realization_detail_id_seq" START WITH 2;
SELECT setval('transaction_realization_detail_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "transaction_realization_detail"), 0) + 1, 2), false);
ALTER TABLE "transaction_realization_detail" ALTER COLUMN "id" SET DEFAULT nextval('transaction_realization_detail_id_seq');
ALTER SEQUENCE "transaction_realization_detail_id_seq" OWNED BY "transaction_realization_detail"."id";

CREATE SEQUENCE IF NOT EXISTS "transaction_request_fund_id_seq" START WITH 2;
SELECT setval('transaction_request_fund_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "transaction_request_fund"), 0) + 1, 2), false);
ALTER TABLE "transaction_request_fund" ALTER COLUMN "id" SET DEFAULT nextval('transaction_request_fund_id_seq');
ALTER SEQUENCE "transaction_request_fund_id_seq" OWNED BY "transaction_request_fund"."id";

CREATE SEQUENCE IF NOT EXISTS "users_id_seq" START WITH 1508;
SELECT setval('users_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "users"), 0) + 1, 1508), false);
ALTER TABLE "users" ALTER COLUMN "id" SET DEFAULT nextval('users_id_seq');
ALTER SEQUENCE "users_id_seq" OWNED BY "users"."id";

CREATE SEQUENCE IF NOT EXISTS "users_groups_id_seq" START WITH 3807;
SELECT setval('users_groups_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "users_groups"), 0) + 1, 3807), false);
ALTER TABLE "users_groups" ALTER COLUMN "id" SET DEFAULT nextval('users_groups_id_seq');
ALTER SEQUENCE "users_groups_id_seq" OWNED BY "users_groups"."id";

CREATE SEQUENCE IF NOT EXISTS "users_shift_additional_id_seq" START WITH 212241;
SELECT setval('users_shift_additional_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "users_shift_additional"), 0) + 1, 212241), false);
ALTER TABLE "users_shift_additional" ALTER COLUMN "id" SET DEFAULT nextval('users_shift_additional_id_seq');
ALTER SEQUENCE "users_shift_additional_id_seq" OWNED BY "users_shift_additional"."id";

CREATE SEQUENCE IF NOT EXISTS "users_shift_cluster_id_seq" START WITH 731;
SELECT setval('users_shift_cluster_id_seq', GREATEST(COALESCE((SELECT MAX("id") FROM "users_shift_cluster"), 0) + 1, 731), false);
ALTER TABLE "users_shift_cluster" ALTER COLUMN "id" SET DEFAULT nextval('users_shift_cluster_id_seq');
ALTER SEQUENCE "users_shift_cluster_id_seq" OWNED BY "users_shift_cluster"."id";

