/*
==========================================================
GOLD LAYER - STAR SCHEMA (VIEWS)
==========================================================
Combines data from silver layer and performs transformations to produce clean, enriched and business-ready data-set.
Purpose:
- Provide business-ready, analytics-friendly data model
- Implements a star schema with fact and dimension views
- Optimized for direct querying and reporting.

==========================================================
*/
-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================

IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
DROP VIEW gold.dim_customers;
GO

CREATE VIEW gold.dim_customers 	AS
SELECT 
ROW_NUMBER () OVER(ORDER BY ci.cst_id) AS customer_key,
	ci.cst_id			        				AS customer_id,
	ci.cst_key			      					AS customer_number,
	ci.cst_firstname	    					AS first_name,
	ci.cst_lastname		    					AS last_name,
	COALESCE(NULLIF(TRIM(la.cntry), ''), 'n/a') AS country
	CASE 
	WHEN ci.cst_gndr != 'n/a' 	THEN ci.cst_gndr
		 ELSE COALESCE (ca.gen, 'n/a')
	END                  	 					AS gender,	
	ci.cst_marital_status 						AS marital_status,
	ca.bdate              						AS birth_date,
	ci.cst_create_date    						AS creation_date
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca 
ON		  ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 cl 
ON        ca.cid = cl.cid;
GO

-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================
IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

CREATE VIEW gold.dim_products 	AS
SELECT 
ROW_NUMBER() OVER(ORDER BY po.prd_start_dt, po.prd_key) AS product_key,
po.prd_id					    AS product_id,
po.prd_key					  	AS product_number,
po.prd_nm				  	  	AS product_name,
po.cat_id					    AS category_id,
pc.cat						    AS category,
pc.subcat					    AS subcategory,
pc.maintenance 					AS maintenance,
po.prd_cost					  	AS product_cost,
po.prd_line					  	AS product_line,
po.prd_start_dt					AS start_date
FROM silver.crm_prd_info po
LEFT JOIN silver.erp_px_cat_g1v2 pc
ON po.cat_id = pc.id
WHERE po.prd_end_dt IS NULL;
GO

-- =============================================================================
-- Create Fact Table: gold.fact_sales
-- =============================================================================
IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO

CREATE VIEW gold.fact_sales 	AS
SELECT 
sd.sls_ord_num					AS order_number,
gp.product_key					AS product_key,
gc.customer_key					AS customer_key,
sd.sls_order_dt					AS order_date,
sd.sls_ship_dt					AS shipping_date,
sd.sls_due_dt				 	AS due_date,
sd.sls_sales				  	AS sales_amount,
sd.sls_quantity					AS sales_quantity,
sd.sls_price				  	AS sales_price
FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_products gp
ON sd.sls_prd_key = gp.product_number
LEFT JOIN gold.dim_customers gc
ON gc.customer_id = sd.sls_cust_id;
GO
