/*
Project: Data Warehouse & Analytics Pipeline
Description: Environment Initialization & Schema Layering
Author: [Your Name/Aman]
*/

USE master;
GO

-- Create the central repository for all analytical data
CREATE DATABASE Datawarehouse;
GO

USE Datawarehouse;
GO

-- Initialize Medallion Layers
CREATE SCHEMA Bronze; -- Raw Data Landing
GO
CREATE SCHEMA Silver; -- Cleaned & Standardized Data
GO
CREATE SCHEMA Gold;   -- Analytics & Reporting Ready
GO
