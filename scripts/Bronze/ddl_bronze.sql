/*
===============================================================================
Database: Datawarehouse
Layer:    Bronze (Raw Landing Zone)
Purpose:  To ingest raw data from CRM and ERP source systems without 
          transformation.
Author:   Aman
===============================================================================
*/

USE Datawarehouse;
GO

-- 1. CRM Customer Info
IF OBJECT_ID('Bronze.crm_cust_info', 'U') IS NOT NULL DROP TABLE Bronze.crm_cust_info;
CREATE TABLE Bronze.crm_cust_info (
    cst_id             NVARCHAR(MAX),
    cst_key            NVARCHAR(MAX),  
    cst_firstname      NVARCHAR(MAX),
    cst_lastname       NVARCHAR(MAX),
    cst_marital_status NVARCHAR(MAX),
    cst_gender         NVARCHAR(MAX),
    cst_create_date    NVARCHAR(MAX)
);
GO

-- 2. CRM Product Info
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
    prd_id       NVARCHAR(50),
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     NVARCHAR(50), 
    prd_line     NVARCHAR(50),
    prd_start_dt NVARCHAR(50), 
    prd_end_dt   NVARCHAR(50)  -- Changed to NVARCHAR to accept empty values
);
GO

IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  NVARCHAR(50), -- Changed from INT
    sls_order_dt NVARCHAR(50), -- Changed from INT
    sls_ship_dt  NVARCHAR(50), -- Changed from INT
    sls_due_dt   NVARCHAR(50), -- Changed from INT
    sls_quantity NVARCHAR(50), -- Changed from INT
    sls_price    NVARCHAR(50)  -- Changed from DECIMAL
);
GO

-- 4. ERP Location A101
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
    cid   NVARCHAR(50),
    bdate NVARCHAR(50),
    gen   NVARCHAR(50)
);
GO

-- 5. ERP Product Category G1V2
IF OBJECT_ID('Bronze.erp_px_cat_g1v2', 'U') IS NOT NULL DROP TABLE Bronze.erp_px_cat_g1v2;
CREATE TABLE Bronze.erp_px_cat_g1v2 (
    id                 NVARCHAR(50),
    cat                NVARCHAR(50),
    subcat             NVARCHAR(50),
    maintenance        NVARCHAR(50)
);

-- 6. ERP Customer AZ12
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
    cid     NVARCHAR(50),
    country NVARCHAR(50)
);
GO

