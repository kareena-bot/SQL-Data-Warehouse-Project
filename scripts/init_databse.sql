/* 
================================================================================================
Create Database and Schemas
================================================================================================

Script Purpose:
	The following script creates a database called DataWareHouse. 
	Before it does that, it first checks to make sure that such a database does not exist. 
	If it exists, it drops it before recreating it. 
	The script also creates 3 SHEMAS in the databse: 'bronze', 'silver' and 'gold'.

WARNING:
	Running this scrip will delete the entire 'Datawarehouse" database if it exists. 
	Proceed with caution and make sure you have backups before running the script
*/

USE Master;
GO

-- Drop and recreate the Database 'DataWarehouse'

IF EXISTS (SELECT 1 FROM sys.databases WHERE NAME = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- Create the DataWareHouse Databse

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create SHEMAS

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
