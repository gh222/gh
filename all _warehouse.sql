USE [master]
GO
/****** Object:  Database [Caspar_Warehouse]    Script Date: 28/04/2016 08:50:14 ******/
CREATE DATABASE [Caspar_Warehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Caspar_Warehouse2', FILENAME = N'G:\Databases\Caspar_Warehouse2.mdf' , SIZE = 56512KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Caspar_Warehouse2_log', FILENAME = N'L:\Logfiles\Caspar_Warehouse2_log.ldf' , SIZE = 326720KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Caspar_Warehouse] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Caspar_Warehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Caspar_Warehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Caspar_Warehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Caspar_Warehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Caspar_Warehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Caspar_Warehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Caspar_Warehouse] SET  MULTI_USER 
GO
ALTER DATABASE [Caspar_Warehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Caspar_Warehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Caspar_Warehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Caspar_Warehouse] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Caspar_Warehouse] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Caspar_Warehouse]
GO
/****** Object:  User [WWIT-SVC-CASPAR-WH]    Script Date: 28/04/2016 08:50:14 ******/
CREATE USER [WWIT-SVC-CASPAR-WH] FOR LOGIN [WWIT-SVC-CASPAR-WH] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [worldwide\WWIT-SVC-CASPAR-WH]    Script Date: 28/04/2016 08:50:14 ******/
CREATE USER [worldwide\WWIT-SVC-CASPAR-WH] FOR LOGIN [WORLDWIDE\WWIT-SVC-CASPAR-WH] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Caspar_user]    Script Date: 28/04/2016 08:50:15 ******/
CREATE USER [Caspar_user] FOR LOGIN [CASPAR_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [WWIT-SVC-CASPAR-WH]
GO
ALTER ROLE [db_owner] ADD MEMBER [worldwide\WWIT-SVC-CASPAR-WH]
GO
ALTER ROLE [db_owner] ADD MEMBER [Caspar_user]
GO
/****** Object:  Schema [CRA]    Script Date: 28/04/2016 08:50:15 ******/
CREATE SCHEMA [CRA]
GO
/****** Object:  Schema [IPA]    Script Date: 28/04/2016 08:50:15 ******/
CREATE SCHEMA [IPA]
GO
/****** Object:  Schema [Product_Transformer]    Script Date: 28/04/2016 08:50:15 ******/
CREATE SCHEMA [Product_Transformer]
GO
/****** Object:  Schema [Report_Support]    Script Date: 28/04/2016 08:50:15 ******/
CREATE SCHEMA [Report_Support]
GO
/****** Object:  Schema [SSIS]    Script Date: 28/04/2016 08:50:15 ******/
CREATE SCHEMA [SSIS]
GO
/****** Object:  Table [CRA].[Investment_Reference]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CRA].[Investment_Reference](
	[Investment_ID] [nvarchar](60) NULL,
	[Investment_Desc] [nvarchar](60) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [CRA].[Product_Detail]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [CRA].[Product_Detail](
	[Product_ID] [nvarchar](400) NULL,
	[UDF_Name] [varchar](39) NULL,
	[UDF_Value] [nvarchar](400) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [CRA].[Product_Detail_Errors]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CRA].[Product_Detail_Errors](
	[Error_Date] [datetime] NULL,
	[Error_Type] [nvarchar](100) NULL,
	[Product_Id] [nvarchar](100) NULL,
	[UDF_Name] [nvarchar](100) NULL,
	[UDF_Value] [nvarchar](100) NULL,
	[Validation_Reason] [nvarchar](400) NULL,
	[Error_End_Date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [CRA].[Product_Detail_Raw]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CRA].[Product_Detail_Raw](
	[Catalogue_ID] [nvarchar](400) NULL,
	[Product_ID] [nvarchar](400) NULL,
	[Catalogue_Title] [nvarchar](400) NULL,
	[Product_Description] [nvarchar](400) NULL,
	[ReleaseDate] [nvarchar](400) NULL,
	[Medium_Code] [nvarchar](400) NULL,
	[Medium_Code_Description] [nvarchar](400) NULL,
	[Box_set] [nvarchar](400) NULL,
	[Business_Area] [nvarchar](400) NULL,
	[TPPPFLAG] [nvarchar](400) NULL,
	[Royalty_Rate] [nvarchar](400) NULL,
	[Strand_Description] [nvarchar](400) NULL,
	[New_WW_Genre] [nvarchar](400) NULL,
	[BBCProductionGenre] [nvarchar](400) NULL,
	[BBCGenre_Description] [nvarchar](400) NULL,
	[SubGenreCode] [nvarchar](400) NULL,
	[WWSubGenre_Description] [nvarchar](400) NULL,
	[BBC_Production_Department_Code] [nvarchar](400) NULL,
	[BBC_Production_Department_Description] [nvarchar](400) NULL,
	[CoreNumber] [nvarchar](400) NULL,
	[Product_Classification_Code] [nvarchar](400) NULL,
	[Product_Classification_Description] [nvarchar](400) NULL,
	[FPINo] [nvarchar](400) NULL,
	[CILSID] [nvarchar](400) NULL,
	[Archive_Content] [nvarchar](400) NULL,
	[Dormant_Content] [nvarchar](400) NULL,
	[BrandID] [nvarchar](400) NULL,
	[IndieName] [nvarchar](400) NULL,
	[Live_Date] [nvarchar](400) NULL,
	[JVStatus] [nvarchar](400) NULL,
	[Created_Date] [nvarchar](400) NULL,
	[Status] [nvarchar](400) NULL,
	[Episode_Number] [nvarchar](400) NULL,
	[Duration] [nvarchar](400) NULL,
	[Strand_Code] [nvarchar](400) NULL,
	[ProductionHouseFlag] [nvarchar](400) NULL,
	[Parent_ID] [nvarchar](400) NULL,
	[FirstTransmissionDate] [nvarchar](400) NULL,
	[ProductMediaFormat] [nvarchar](400) NULL,
	[ProductType] [nvarchar](400) NULL,
	[Title] [nvarchar](400) NULL,
	[MMContractID] [nvarchar](400) NULL,
	[ScheduleRef] [nvarchar](400) NULL,
	[RightsArchiveRate] [nvarchar](400) NULL,
	[IndieStrandTitle] [nvarchar](400) NULL,
	[WWGenre] [nvarchar](400) NULL,
	[TitleGroup] [nvarchar](400) NULL,
	[BBCGenre] [nvarchar](400) NULL,
	[WWSubGenre] [nvarchar](400) NULL,
	[BBCGenreBoard] [nvarchar](400) NULL,
	[AdditionalThirdPartyShareFlag] [nvarchar](400) NULL,
	[CommissioningDepartment] [nvarchar](400) NULL,
	[ContractType] [nvarchar](400) NULL,
	[Caspar_Layer] [nvarchar](3) NULL,
	[SeriesProductID] [nvarchar](400) NULL,
	[LotcapsCostCentre] [nvarchar](400) NULL,
	[Validation_Failed] [bit] NULL,
	[Validation_Reason] [nvarchar](400) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [CRA].[Product_ID]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CRA].[Product_ID](
	[Product_ID] [nvarchar](400) NULL,
	[Parent_ID] [nvarchar](400) NULL,
	[Product_Description] [nvarchar](400) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [IPA].[Investment_Reference]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IPA].[Investment_Reference](
	[Investment_ID] [nvarchar](60) NULL,
	[Investment_Desc] [nvarchar](60) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [IPA].[Product_Detail]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [IPA].[Product_Detail](
	[Product_ID] [nvarchar](400) NULL,
	[UDF_Name] [varchar](39) NULL,
	[UDF_Value] [nvarchar](400) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [IPA].[Product_Detail_Errors]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IPA].[Product_Detail_Errors](
	[Error_Date] [datetime] NULL,
	[Error_Type] [nvarchar](100) NULL,
	[Product_Id] [nvarchar](100) NULL,
	[UDF_Name] [nvarchar](100) NULL,
	[UDF_Value] [nvarchar](100) NULL,
	[Validation_Reason] [nvarchar](400) NULL,
	[Error_End_Date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [IPA].[Product_Detail_Raw]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IPA].[Product_Detail_Raw](
	[Catalogue_ID] [nvarchar](400) NULL,
	[Product_ID] [nvarchar](400) NULL,
	[Catalogue_Title] [nvarchar](400) NULL,
	[Product_Description] [nvarchar](400) NULL,
	[ReleaseDate] [nvarchar](400) NULL,
	[Medium_Code] [nvarchar](400) NULL,
	[Medium_Code_Description] [nvarchar](400) NULL,
	[Box_set] [nvarchar](400) NULL,
	[Business_Area] [nvarchar](400) NULL,
	[TPPPFLAG] [nvarchar](400) NULL,
	[Royalty_Rate] [nvarchar](400) NULL,
	[Strand_Description] [nvarchar](400) NULL,
	[New_WW_Genre] [nvarchar](400) NULL,
	[BBCProductionGenre] [nvarchar](400) NULL,
	[BBCGenre_Description] [nvarchar](400) NULL,
	[SubGenreCode] [nvarchar](400) NULL,
	[WWSubGenre_Description] [nvarchar](400) NULL,
	[BBC_Production_Department_Code] [nvarchar](400) NULL,
	[BBC_Production_Department_Description] [nvarchar](400) NULL,
	[CoreNumber] [nvarchar](400) NULL,
	[Product_Classification_Code] [nvarchar](400) NULL,
	[Product_Classification_Description] [nvarchar](400) NULL,
	[FPINo] [nvarchar](400) NULL,
	[CILSID] [nvarchar](400) NULL,
	[Archive_Content] [nvarchar](400) NULL,
	[Dormant_Content] [nvarchar](400) NULL,
	[BrandID] [nvarchar](400) NULL,
	[IndieName] [nvarchar](400) NULL,
	[Live_Date] [nvarchar](400) NULL,
	[JVStatus] [nvarchar](400) NULL,
	[Created_Date] [nvarchar](400) NULL,
	[Status] [nvarchar](400) NULL,
	[Episode_Number] [nvarchar](400) NULL,
	[Duration] [nvarchar](400) NULL,
	[Strand_Code] [nvarchar](400) NULL,
	[ProductionHouseFlag] [nvarchar](400) NULL,
	[Parent_ID] [nvarchar](400) NULL,
	[FirstTransmissionDate] [nvarchar](400) NULL,
	[ProductMediaFormat] [nvarchar](400) NULL,
	[ProductType] [nvarchar](400) NULL,
	[Title] [nvarchar](400) NULL,
	[MMContractID] [nvarchar](400) NULL,
	[ScheduleRef] [nvarchar](400) NULL,
	[RightsArchiveRate] [nvarchar](400) NULL,
	[IndieStrandTitle] [nvarchar](400) NULL,
	[WWGenre] [nvarchar](400) NULL,
	[TitleGroup] [nvarchar](400) NULL,
	[BBCGenre] [nvarchar](400) NULL,
	[WWSubGenre] [nvarchar](400) NULL,
	[BBCGenreBoard] [nvarchar](400) NULL,
	[AdditionalThirdPartyShareFlag] [nvarchar](400) NULL,
	[CommissioningDepartment] [nvarchar](400) NULL,
	[ContractType] [nvarchar](400) NULL,
	[Caspar_Layer] [nvarchar](3) NULL,
	[SeriesProductID] [nvarchar](400) NULL,
	[LotcapsCostCentre] [nvarchar](400) NULL,
	[Validation_Failed] [bit] NULL,
	[Validation_Reason] [nvarchar](400) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [IPA].[Product_ID]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IPA].[Product_ID](
	[Product_ID] [nvarchar](400) NULL,
	[Parent_ID] [nvarchar](400) NULL,
	[Product_Description] [nvarchar](400) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [SSIS].[Configurations_CRA]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SSIS].[Configurations_CRA](
	[Configuration_ID] [int] IDENTITY(1,1) NOT NULL,
	[Turn_On] [bit] NULL DEFAULT ((0)),
	[Caspar_Layer_Type] [nvarchar](3) NULL DEFAULT ('CRA'),
	[Caspar_Layer_Name] [nvarchar](100) NOT NULL,
	[Caspar_Layer_Database] [nvarchar](20) NULL DEFAULT ('bbc_cra_prod'),
	[Caspar_Layer_Server] [nvarchar](20) NOT NULL,
	[Available] [bit] NULL DEFAULT ((1))
) ON [PRIMARY]

GO
/****** Object:  Table [SSIS].[Configurations_IPA]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SSIS].[Configurations_IPA](
	[Configuration_ID] [int] IDENTITY(1,1) NOT NULL,
	[Turn_On] [bit] NULL DEFAULT ((0)),
	[Caspar_Layer_Type] [nvarchar](3) NULL DEFAULT ('IPA'),
	[Caspar_Layer_Name] [nvarchar](100) NOT NULL,
	[Caspar_Layer_Database] [nvarchar](20) NULL DEFAULT ('bbc_ipa_production'),
	[Caspar_Layer_Server] [nvarchar](20) NOT NULL,
	[Available] [bit] NULL DEFAULT ((1))
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [CRA].[usp_Transformer_Product_Detail]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [CRA].[usp_Transformer_Product_Detail] 

AS 

			IF OBJECT_ID('CRA.Product_Detail') IS NOT NULL TRUNCATE TABLE CRA.Product_Detail
			IF OBJECT_ID('tempdb..#Table_Columns') IS NOT NULL DROP TABLE #Table_Columns
			select name,column_id
			INTO #Table_Columns
			from sys.columns
			where object_id IN (
								select object_id 
								from sys.tables  t
								where t.name = 'Product_Detail_Raw'
								and t.schema_id IN (select schema_id from sys.schemas s where s.name LIKE 'CRA')
								)
			and name NOT IN ('Parent_ID','Product_Description')
			order by column_id	

			--select * from #Table_Columns
			

					DECLARE @sql_remove_Blanks nvarchar(200) SET @sql_remove_Blanks = ''
					DECLARE @sql1 nvarchar(2000) SET @sql1 = ' '
					DECLARE @sql1_Total nvarchar(4000) SET @sql1_Total = ''
					DECLARE @Actual_Column_names nVARCHAR(2000) SET @Actual_Column_names = ''  
					DECLARE @Column_name nVARCHAR(50) 
					DECLARE db_cursor CURSOR FOR  
							SELECT name
							FROM #Table_Columns

					OPEN db_cursor   
					FETCH NEXT FROM db_cursor INTO @Column_name   

					WHILE @@FETCH_STATUS = 0   
					BEGIN   
						
						
									SET @sql1 =
									'INSERT INTO [CRA].[Product_Detail] (Product_ID, UDF_Name, UDF_Value)
									 select distinct Product_ID,'''+@Column_name+''' AS UDF, LTRIM(CAST('+@Column_name+' AS nvarchar(100))) AS UDF_Value from CRA.Product_Detail_Raw '
									exec (@sql1)

						 FETCH NEXT FROM db_cursor INTO @Column_name   
					END   

					CLOSE db_cursor   
					DEALLOCATE db_cursor

				
					UPDATE [CRA].[Product_Detail]
					SET  UDF_value = REPLACE(UDF_Value,' ',NULL) where UDF_Value = ''


					UPDATE [CRA].[Product_Detail_Raw]
					SET  Parent_ID = REPLACE(Parent_ID,' ',NULL) where Parent_ID = ''

					DELETE
					from [CRA].[Product_Detail]
					where UDF_name IN ('Caspar_Layer','Product_ID')

		

	

		/********************************************************************************************/
		/********************************************************************************************/
		/************************* Delete UDFs Not Needed  ******************************************/
		/********************************************************************************************/
		/********************************************************************************************/		
		DECLARE @SQL				nvarchar(4000)		SET @SQL = ''
		DECLARE @UDFs_To_Keep		nvarchar(2000)		SET @UDFs_To_Keep = '''LotcapsCostCentre'',''ProductMediaFormat'',''gg'',''CoreNumber'',''BrandID'',''JVStatus'',''Duration'',''ReleaseDate'',''FirstTransmissionDate'',''ProductType'',''IndieName'',''SeriesProductID'',''BBCProductionGenre'', ''SubGenreCode'',''ProductionHouseFlag'''
		SET @SQL =
		'
			DELETE 	from CRA.Product_Detail where UDF_Name NOT IN ('+@UDFs_To_Keep+')
			DELETE 	from CRA.Product_Detail where UDF_Name IN ('+@UDFs_To_Keep+') AND UDF_Value is NUll

		'
		--print @SQL
		exec (@SQL)







GO
/****** Object:  StoredProcedure [CRA].[usp_Transformer_Raw_Updates]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [CRA].[usp_Transformer_Raw_Updates] 
--exec [CRA].[usp_Transformer_Raw_Updates] 
AS 

UPDATE [CRA].[Product_Detail_Raw]  SET Caspar_Layer = Caspar_Layer_Type from [SSIS].[Configurations_CRA] where Turn_On = 1
UPDATE [CRA].[Product_Detail_Raw] SET Catalogue_ID= NULL FROM [CRA].[Product_Detail_Raw] where Catalogue_ID= ''
UPDATE [CRA].[Product_Detail_Raw] SET Product_ID= NULL FROM [CRA].[Product_Detail_Raw] where Product_ID= ''
UPDATE [CRA].[Product_Detail_Raw] SET Catalogue_Title= NULL FROM [CRA].[Product_Detail_Raw] where Catalogue_Title= ''
UPDATE [CRA].[Product_Detail_Raw] SET Product_Description= NULL FROM [CRA].[Product_Detail_Raw] where Product_Description= ''
UPDATE [CRA].[Product_Detail_Raw] SET ReleaseDate= NULL FROM [CRA].[Product_Detail_Raw] where ReleaseDate= ''
UPDATE [CRA].[Product_Detail_Raw] SET Medium_Code= NULL FROM [CRA].[Product_Detail_Raw] where Medium_Code= ''
UPDATE [CRA].[Product_Detail_Raw] SET Medium_Code_Description= NULL FROM [CRA].[Product_Detail_Raw] where Medium_Code_Description= ''
UPDATE [CRA].[Product_Detail_Raw] SET Box_set= NULL FROM [CRA].[Product_Detail_Raw] where Box_set= ''
UPDATE [CRA].[Product_Detail_Raw] SET Business_Area= NULL FROM [CRA].[Product_Detail_Raw] where Business_Area= ''
UPDATE [CRA].[Product_Detail_Raw] SET TPPPFLAG= NULL FROM [CRA].[Product_Detail_Raw] where TPPPFLAG= ''
UPDATE [CRA].[Product_Detail_Raw] SET Royalty_Rate= NULL FROM [CRA].[Product_Detail_Raw] where Royalty_Rate= ''
UPDATE [CRA].[Product_Detail_Raw] SET Strand_Description= NULL FROM [CRA].[Product_Detail_Raw] where Strand_Description= ''
UPDATE [CRA].[Product_Detail_Raw] SET New_WW_Genre= NULL FROM [CRA].[Product_Detail_Raw] where New_WW_Genre= ''
UPDATE [CRA].[Product_Detail_Raw] SET BBCProductionGenre= NULL FROM [CRA].[Product_Detail_Raw] where BBCProductionGenre= ''
UPDATE [CRA].[Product_Detail_Raw] SET BBCGenre_Description= NULL FROM [CRA].[Product_Detail_Raw] where BBCGenre_Description= ''
UPDATE [CRA].[Product_Detail_Raw] SET SubGenreCode= NULL FROM [CRA].[Product_Detail_Raw] where SubGenreCode= ''
UPDATE [CRA].[Product_Detail_Raw] SET WWSubGenre_Description= NULL FROM [CRA].[Product_Detail_Raw] where WWSubGenre_Description= ''
UPDATE [CRA].[Product_Detail_Raw] SET BBC_Production_Department_Code= NULL FROM [CRA].[Product_Detail_Raw] where BBC_Production_Department_Code= ''
UPDATE [CRA].[Product_Detail_Raw] SET BBC_Production_Department_Description= NULL FROM [CRA].[Product_Detail_Raw] where BBC_Production_Department_Description= ''
UPDATE [CRA].[Product_Detail_Raw] SET CoreNumber= NULL FROM [CRA].[Product_Detail_Raw] where CoreNumber= ''
UPDATE [CRA].[Product_Detail_Raw] SET Product_Classification_Code= NULL FROM [CRA].[Product_Detail_Raw] where Product_Classification_Code= ''
UPDATE [CRA].[Product_Detail_Raw] SET Product_Classification_Description= NULL FROM [CRA].[Product_Detail_Raw] where Product_Classification_Description= ''
UPDATE [CRA].[Product_Detail_Raw] SET FPINo= NULL FROM [CRA].[Product_Detail_Raw] where FPINo= ''
UPDATE [CRA].[Product_Detail_Raw] SET CILSID= NULL FROM [CRA].[Product_Detail_Raw] where CILSID= ''
UPDATE [CRA].[Product_Detail_Raw] SET Archive_Content= NULL FROM [CRA].[Product_Detail_Raw] where Archive_Content= ''
UPDATE [CRA].[Product_Detail_Raw] SET Dormant_Content= NULL FROM [CRA].[Product_Detail_Raw] where Dormant_Content= ''
UPDATE [CRA].[Product_Detail_Raw] SET BrandID= NULL FROM [CRA].[Product_Detail_Raw] where BrandID= ''
UPDATE [CRA].[Product_Detail_Raw] SET IndieName= NULL FROM [CRA].[Product_Detail_Raw] where IndieName= ''
UPDATE [CRA].[Product_Detail_Raw] SET Live_Date= NULL FROM [CRA].[Product_Detail_Raw] where Live_Date= ''
UPDATE [CRA].[Product_Detail_Raw] SET JVStatus= NULL FROM [CRA].[Product_Detail_Raw] where JVStatus= ''
UPDATE [CRA].[Product_Detail_Raw] SET Created_Date= NULL FROM [CRA].[Product_Detail_Raw] where Created_Date= ''
UPDATE [CRA].[Product_Detail_Raw] SET Status= NULL FROM [CRA].[Product_Detail_Raw] where Status= ''
UPDATE [CRA].[Product_Detail_Raw] SET Episode_Number= NULL FROM [CRA].[Product_Detail_Raw] where Episode_Number= ''
UPDATE [CRA].[Product_Detail_Raw] SET Duration= NULL FROM [CRA].[Product_Detail_Raw] where Duration= ''
UPDATE [CRA].[Product_Detail_Raw] SET Strand_Code= NULL FROM [CRA].[Product_Detail_Raw] where Strand_Code= ''
UPDATE [CRA].[Product_Detail_Raw] SET ProductionHouseFlag= NULL FROM [CRA].[Product_Detail_Raw] where ProductionHouseFlag= ''
UPDATE [CRA].[Product_Detail_Raw] SET Parent_ID= NULL FROM [CRA].[Product_Detail_Raw] where Parent_ID= ''
UPDATE [CRA].[Product_Detail_Raw] SET FirstTransmissionDate= NULL FROM [CRA].[Product_Detail_Raw] where FirstTransmissionDate= ''
UPDATE [CRA].[Product_Detail_Raw] SET ProductMediaFormat= NULL FROM [CRA].[Product_Detail_Raw] where ProductMediaFormat= ''
UPDATE [CRA].[Product_Detail_Raw] SET ProductType= NULL FROM [CRA].[Product_Detail_Raw] where ProductType= ''
UPDATE [CRA].[Product_Detail_Raw] SET Title= NULL FROM [CRA].[Product_Detail_Raw] where Title= ''
UPDATE [CRA].[Product_Detail_Raw] SET MMContractID= NULL FROM [CRA].[Product_Detail_Raw] where MMContractID= ''
UPDATE [CRA].[Product_Detail_Raw] SET ScheduleRef= NULL FROM [CRA].[Product_Detail_Raw] where ScheduleRef= ''
UPDATE [CRA].[Product_Detail_Raw] SET RightsArchiveRate= NULL FROM [CRA].[Product_Detail_Raw] where RightsArchiveRate= ''
UPDATE [CRA].[Product_Detail_Raw] SET IndieStrandTitle= NULL FROM [CRA].[Product_Detail_Raw] where IndieStrandTitle= ''
UPDATE [CRA].[Product_Detail_Raw] SET WWGenre= NULL FROM [CRA].[Product_Detail_Raw] where WWGenre= ''
UPDATE [CRA].[Product_Detail_Raw] SET TitleGroup= NULL FROM [CRA].[Product_Detail_Raw] where TitleGroup= ''
UPDATE [CRA].[Product_Detail_Raw] SET BBCGenre= NULL FROM [CRA].[Product_Detail_Raw] where BBCGenre= ''
UPDATE [CRA].[Product_Detail_Raw] SET WWSubGenre= NULL FROM [CRA].[Product_Detail_Raw] where WWSubGenre= ''
UPDATE [CRA].[Product_Detail_Raw] SET BBCGenreBoard= NULL FROM [CRA].[Product_Detail_Raw] where BBCGenreBoard= ''
UPDATE [CRA].[Product_Detail_Raw] SET AdditionalThirdPartyShareFlag= NULL FROM [CRA].[Product_Detail_Raw] where AdditionalThirdPartyShareFlag= ''
UPDATE [CRA].[Product_Detail_Raw] SET CommissioningDepartment= NULL FROM [CRA].[Product_Detail_Raw] where CommissioningDepartment= ''
UPDATE [CRA].[Product_Detail_Raw] SET ContractType= NULL FROM [CRA].[Product_Detail_Raw] where ContractType= ''
UPDATE [CRA].[Product_Detail_Raw] SET Caspar_Layer= NULL FROM [CRA].[Product_Detail_Raw] where Caspar_Layer= ''
UPDATE [CRA].[Product_Detail_Raw] SET  Catalogue_ID= RTRIM(LTRIM(Catalogue_ID))
UPDATE [CRA].[Product_Detail_Raw] SET  Product_ID= RTRIM(LTRIM(Product_ID))
UPDATE [CRA].[Product_Detail_Raw] SET  Catalogue_Title= RTRIM(LTRIM(Catalogue_Title))
UPDATE [CRA].[Product_Detail_Raw] SET  Product_Description= RTRIM(LTRIM(Product_Description))
UPDATE [CRA].[Product_Detail_Raw] SET  ReleaseDate= RTRIM(LTRIM(ReleaseDate))
UPDATE [CRA].[Product_Detail_Raw] SET  Medium_Code= RTRIM(LTRIM(Medium_Code))
UPDATE [CRA].[Product_Detail_Raw] SET  Medium_Code_Description= RTRIM(LTRIM(Medium_Code_Description))
UPDATE [CRA].[Product_Detail_Raw] SET  Box_set= RTRIM(LTRIM(Box_set))
UPDATE [CRA].[Product_Detail_Raw] SET  Business_Area= RTRIM(LTRIM(Business_Area))
UPDATE [CRA].[Product_Detail_Raw] SET  TPPPFLAG= RTRIM(LTRIM(TPPPFLAG))
UPDATE [CRA].[Product_Detail_Raw] SET  Royalty_Rate= RTRIM(LTRIM(Royalty_Rate))
UPDATE [CRA].[Product_Detail_Raw] SET  Strand_Description= RTRIM(LTRIM(Strand_Description))
UPDATE [CRA].[Product_Detail_Raw] SET  New_WW_Genre= RTRIM(LTRIM(New_WW_Genre))
UPDATE [CRA].[Product_Detail_Raw] SET  BBCProductionGenre= RTRIM(LTRIM(BBCProductionGenre))
UPDATE [CRA].[Product_Detail_Raw] SET  BBCGenre_Description= RTRIM(LTRIM(BBCGenre_Description))
UPDATE [CRA].[Product_Detail_Raw] SET  SubGenreCode= RTRIM(LTRIM(SubGenreCode))
UPDATE [CRA].[Product_Detail_Raw] SET  WWSubGenre_Description= RTRIM(LTRIM(WWSubGenre_Description))
UPDATE [CRA].[Product_Detail_Raw] SET  BBC_Production_Department_Code= RTRIM(LTRIM(BBC_Production_Department_Code))
UPDATE [CRA].[Product_Detail_Raw] SET  BBC_Production_Department_Description= RTRIM(LTRIM(BBC_Production_Department_Description))
UPDATE [CRA].[Product_Detail_Raw] SET  CoreNumber= RTRIM(LTRIM(CoreNumber))
UPDATE [CRA].[Product_Detail_Raw] SET  Product_Classification_Code= RTRIM(LTRIM(Product_Classification_Code))
UPDATE [CRA].[Product_Detail_Raw] SET  Product_Classification_Description= RTRIM(LTRIM(Product_Classification_Description))
UPDATE [CRA].[Product_Detail_Raw] SET  FPINo= RTRIM(LTRIM(FPINo))
UPDATE [CRA].[Product_Detail_Raw] SET  CILSID= RTRIM(LTRIM(CILSID))
UPDATE [CRA].[Product_Detail_Raw] SET  Archive_Content= RTRIM(LTRIM(Archive_Content))
UPDATE [CRA].[Product_Detail_Raw] SET  Dormant_Content= RTRIM(LTRIM(Dormant_Content))
UPDATE [CRA].[Product_Detail_Raw] SET  BrandID= RTRIM(LTRIM(BrandID))
UPDATE [CRA].[Product_Detail_Raw] SET  IndieName= RTRIM(LTRIM(IndieName))
UPDATE [CRA].[Product_Detail_Raw] SET  Live_Date= RTRIM(LTRIM(Live_Date))
UPDATE [CRA].[Product_Detail_Raw] SET  JVStatus= RTRIM(LTRIM(JVStatus))
UPDATE [CRA].[Product_Detail_Raw] SET  Created_Date= RTRIM(LTRIM(Created_Date))
UPDATE [CRA].[Product_Detail_Raw] SET  Status= RTRIM(LTRIM(Status))
UPDATE [CRA].[Product_Detail_Raw] SET  Episode_Number= RTRIM(LTRIM(Episode_Number))
UPDATE [CRA].[Product_Detail_Raw] SET  Duration= RTRIM(LTRIM(Duration))
UPDATE [CRA].[Product_Detail_Raw] SET  Strand_Code= RTRIM(LTRIM(Strand_Code))
UPDATE [CRA].[Product_Detail_Raw] SET  ProductionHouseFlag= RTRIM(LTRIM(ProductionHouseFlag))
UPDATE [CRA].[Product_Detail_Raw] SET  Parent_ID= RTRIM(LTRIM(Parent_ID))
UPDATE [CRA].[Product_Detail_Raw] SET  FirstTransmissionDate= RTRIM(LTRIM(FirstTransmissionDate))
UPDATE [CRA].[Product_Detail_Raw] SET  ProductMediaFormat= RTRIM(LTRIM(ProductMediaFormat))
UPDATE [CRA].[Product_Detail_Raw] SET  ProductType= RTRIM(LTRIM(ProductType))
UPDATE [CRA].[Product_Detail_Raw] SET  Title= RTRIM(LTRIM(Title))
UPDATE [CRA].[Product_Detail_Raw] SET  MMContractID= RTRIM(LTRIM(MMContractID))
UPDATE [CRA].[Product_Detail_Raw] SET  ScheduleRef= RTRIM(LTRIM(ScheduleRef))
UPDATE [CRA].[Product_Detail_Raw] SET  RightsArchiveRate= RTRIM(LTRIM(RightsArchiveRate))
UPDATE [CRA].[Product_Detail_Raw] SET  IndieStrandTitle= RTRIM(LTRIM(IndieStrandTitle))
UPDATE [CRA].[Product_Detail_Raw] SET  WWGenre= RTRIM(LTRIM(WWGenre))
UPDATE [CRA].[Product_Detail_Raw] SET  TitleGroup= RTRIM(LTRIM(TitleGroup))
UPDATE [CRA].[Product_Detail_Raw] SET  BBCGenre= RTRIM(LTRIM(BBCGenre))
UPDATE [CRA].[Product_Detail_Raw] SET  WWSubGenre= RTRIM(LTRIM(WWSubGenre))
UPDATE [CRA].[Product_Detail_Raw] SET  BBCGenreBoard= RTRIM(LTRIM(BBCGenreBoard))
UPDATE [CRA].[Product_Detail_Raw] SET  AdditionalThirdPartyShareFlag= RTRIM(LTRIM(AdditionalThirdPartyShareFlag))
UPDATE [CRA].[Product_Detail_Raw] SET  CommissioningDepartment= RTRIM(LTRIM(CommissioningDepartment))
UPDATE [CRA].[Product_Detail_Raw] SET  ContractType= RTRIM(LTRIM(ContractType))
UPDATE [CRA].[Product_Detail_Raw] SET  Caspar_Layer= RTRIM(LTRIM(Caspar_Layer))

UPDATE [CRA].[Product_Detail_Raw] SET Product_Description = UPPER(Product_Description)
UPDATE [CRA].[Product_Detail_Raw] SET IndieName = UPPER(IndieName)
UPDATE [CRA].[Product_Detail_Raw] SET [Catalogue_Title] = UPPER([Catalogue_Title])
UPDATE [CRA].[Product_Detail_Raw] SET [Product_Description] = REPLACE(REPLACE(REPLACE(	  [Product_Description], CHAR(9),''), CHAR(13),''), CHAR(10),'')
UPDATE [CRA].[Product_Detail_Raw] SET [Catalogue_Title] = REPLACE(REPLACE(REPLACE(	  [Catalogue_Title], CHAR(9),''), CHAR(13),''), CHAR(10),'')
UPDATE [CRA].[Product_Detail_Raw] SET FirstTransmissionDate = REPLACE(FirstTransmissionDate,'.','/') where FirstTransmissionDate LIKE '%.%'




;WITH CTE_Genre_Mapping AS
(
select 'AR' AS BBC_Genre ,'Arts' AS Descrip UNION ALL
select 'CH' AS BBC_Genre ,'Childrens' AS Descrip UNION ALL
select 'DO' AS BBC_Genre ,'Documentaries' AS Descrip UNION ALL
select 'DR' AS BBC_Genre ,'Drama' AS Descrip UNION ALL
select 'ED' AS BBC_Genre ,'Education' AS Descrip UNION ALL
select 'LB' AS BBC_Genre ,'Library Sales' AS Descrip UNION ALL
select 'LE' AS BBC_Genre ,'Light Entertainment' AS Descrip UNION ALL
select 'MA' AS BBC_Genre ,'Music & Arts' AS Descrip UNION ALL
select 'MU' AS BBC_Genre ,'Music' AS Descrip UNION ALL
select 'NA' AS BBC_Genre ,'Not Applicable' AS Descrip UNION ALL
select 'NC' AS BBC_Genre ,'News & Current' AS Descrip UNION ALL
select 'NT' AS BBC_Genre ,'Natural History' AS Descrip UNION ALL
select 'RA' AS BBC_Genre ,'Reading' AS Descrip UNION ALL
select 'RE' AS BBC_Genre ,'Religion' AS Descrip UNION ALL
select 'RI' AS BBC_Genre ,'Radio' AS Descrip UNION ALL
select 'SM' AS BBC_Genre ,'Science & Medicine' AS Descrip UNION ALL
select 'SP' AS BBC_Genre ,'Sport' AS Descrip UNION ALL
select 'TP' AS BBC_Genre ,'Topical' AS Descrip UNION ALL
select 'TV' AS BBC_Genre ,'Training Videos' AS Descrip UNION ALL
select 'ZZ' AS BBC_Genre ,'Unclassified' AS Descrip
)
UPDATE CRA.Product_Detail_Raw SET BBCGenre_Description = m.Descrip
--select top 100  r.[BBCProductionGenre], m.BBC_Genre, m.Descrip, r.[BBCGenre_Description]
from CRA.Product_Detail_Raw r
INNER JOIN CTE_Genre_Mapping m on r.[BBCProductionGenre] = m.BBC_Genre



;WITH CTE_Genre_Mapping AS
(
select 'CHA' AS WW_Genre ,'Childrens Animation' AS Descrip UNION ALL
select 'CHI' AS WW_Genre ,'Childrens' AS Descrip UNION ALL
select 'DED' AS WW_Genre ,'Drama' AS Descrip UNION ALL
select 'DEL' AS WW_Genre ,'Light Entertainment' AS Descrip UNION ALL
select 'GFC' AS WW_Genre ,'Cookery' AS Descrip UNION ALL
select 'GFD' AS WW_Genre ,'Docs & Investigation' AS Descrip UNION ALL
select 'GFL' AS WW_Genre ,'Leisure & Factual En' AS Descrip UNION ALL
select 'GFS' AS WW_Genre ,'Factual Special' AS Descrip UNION ALL
select 'GFT' AS WW_Genre ,'Travel' AS Descrip UNION ALL
select 'LBU' AS WW_Genre ,'Business' AS Descrip UNION ALL
select 'LEL' AS WW_Genre ,'Elt' AS Descrip UNION ALL
select 'LLA' AS WW_Genre ,'Languages' AS Descrip UNION ALL
select 'LLL' AS WW_Genre ,'Lifelong Learning' AS Descrip UNION ALL
select 'LSE' AS WW_Genre ,'Schools Education' AS Descrip UNION ALL
select 'MCL' AS WW_Genre ,'Classical Music' AS Descrip UNION ALL
select 'MCO' AS WW_Genre ,'Contemporary Music' AS Descrip UNION ALL
select 'MOT' AS WW_Genre ,'Music (Other)' AS Descrip UNION ALL
select 'NA' AS WW_Genre ,'Not Applicable' AS Descrip UNION ALL
select 'NCA' AS WW_Genre ,'News & Current Affai' AS Descrip UNION ALL
select 'SFA' AS WW_Genre ,'Arts' AS Descrip 


)
UPDATE CRA.Product_Detail_Raw SET [WWSubGenre_Description] = m.Descrip
--select top 100  r.[WWSubGenre], m.WW_Genre, m.Descrip, r.[WWSubGenre_Description]
from CRA.Product_Detail_Raw r
INNER JOIN CTE_Genre_Mapping m on r.subGenreCode = m.WW_Genre


GO
/****** Object:  StoredProcedure [CRA].[usp_Transformer_Validations]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CRA].[usp_Transformer_Validations] AS 
----exec CRA.[usp_Transformer_Validations]


/********************************************************************************************/
/********************************************************************************************/
/************************* Base Parameters  *************************************************/
/********************************************************************************************/
/********************************************************************************************/

			SET XACT_ABORT ON;
			SET IMPLICIT_TRANSACTIONS OFF; -- Do not change this
			SET LANGUAGE English;
			SET DATEFORMAT DMY;
			SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
			SET NOCOUNT ON;
			DECLARE @Caspar_Layer				nvarchar(3)					SET @Caspar_Layer =		(	select [Caspar_Layer_Type] from [SSIS].[Configurations_CRA] where Turn_On = 1)
			DECLARE @Caspar_Server				nvarchar(20)				SET @Caspar_Server =	(   select [Caspar_Layer_Server] from [SSIS].[Configurations_CRA] where Turn_On = 1)
			DECLARE @Caspar_Database			nvarchar(20)				SET @Caspar_Database =	(	select [Caspar_Layer_Database] from [SSIS].[Configurations_CRA] where Turn_On = 1)
			DECLARE @UDFs_Required				nvarchar(2000)				SET @UDFs_Required = '''Product_ID'',''Parent_ID'',''Product_Description'',''Product_Media_Format'''
			DECLARE @SQL						nvarchar(4000)				SET @SQL = ''
			DECLARE	@Product_ID_Lenght			nvarchar(2)					SET @Product_ID_Lenght= 30
			DECLARE	@Product_Description_Lenght nvarchar(2)					SET @Product_Description_Lenght = 60
			DECLARE	@UDF_Value_Length			nvarchar(2)					SET @UDF_Value_Length = 30
			IF OBJECT_ID('CRA.Product_Detail_Errors')	IS NOT NULL TRUNCATE TABLE CRA.Product_Detail_Errors

		/********************************************************************************************/
		/********************************************************************************************/
		/************************* Get Source Details  **********************************************/
		/********************************************************************************************/
		/********************************************************************************************/


			IF OBJECT_ID('tempdb..#Products_n_UDF') IS NOT NULL DROP TABLE #Products_n_UDF
			CREATE TABLE #Products_n_UDF ([Type] nvarchar(30) ,	[Product_ID] nvarchar(30), 	[Product_Descrip] nvarchar(60), [UDF_Name] nvarchar(60), [UDF_Value] nvarchar(60)	)
			SET @SQL = 
			'	
				SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
				/**** Product Data ***/
				INSERT INTO #Products_n_UDF  (Type,Product_ID,Product_Descrip,UDF_Name,UDF_Value )
				select ''Product_ID'' AS Type, LEFT(udkey_1_id,30) AS Product_ID, LEFT(descr,60) AS Product_Descrip, NULL AS UDF_Name, NULL AS UDF_Value
				from			'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_udkey_1
				UNION ALL
				
				/**** UDF Data ***/
				select ''UDfs'' AS Type, NULL AS Product_ID, NULL AS Product_Descrip, cu.name AS UDF_Name, cdev.enumerated_id AS UDF_Value
				from			'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_udf							cu
				LEFT JOIN		'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_datatype						cd		ON cd.datatype_sid = cu.datatype_sid
				LEFT JOIN		'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_datatype_enumerated_value		cdev	ON cd.datatype_sid = cdev.datatype_sid
				where 	cdev.enumerated_id IS NOT NULL
				UNION ALL
				select ''UDfs'' AS Type, NULL AS Product_ID, NULL AS Product_Descrip, udkey_7_id collate DATABASE_DEFAULT AS UDF_Name,  udkey_7_id collate DATABASE_DEFAULT AS UDF_Value
				from			'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_udkey_7
				UNION ALL
				select ''UDfs'' AS Type, NULL AS Product_ID, NULL AS Product_Descrip, udkey_17_id collate DATABASE_DEFAULT AS UDF_Name,  udkey_17_id collate DATABASE_DEFAULT AS UDF_Value
				from			'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_udkey_17
			'
			EXec (@SQL)

		/********************************************************************************************/
		/********************************************************************************************/
		/************************* Validation Rules On File *****************************************/
		/********************************************************************************************/
		/********************************************************************************************/			
		
		IF OBJECT_ID('tempdb..#CTE_Validations_OnFile')					IS NOT NULL DROP TABLE #CTE_Validations_OnFile
		;WITH CTE_Validations AS
		(
		select   'Validation Test 3' as Category, 'UDF_Name'					as UDF_Name ,'p where UDF_Name = ''ReleaseDate''  AND ISDATE(UDF_Value) = 0'																								AS WhereClause, 'Realease/Transmission Date Format incorrect YYYY/MM/DD'		AS Validation_Reason			,'Product_Detail'			AS Table_Source		,'UDF_Value'						AS UDF_Value		UNION ALL
		select   'Validation Test 3' as Category, 'UDF_Name'					as UDF_Name ,'p where UDF_Name = ''FirstTransmissionDate''  AND ISDATE(UDF_Value) = 0'																					AS WhereClause, 'Realease/Transmission Date Format incorrect YYYY/MM/DD'		AS Validation_Reason			,'Product_Detail'			AS Table_Source		,'UDF_Value'						AS UDF_Value		UNION ALL
		select   'Validation Test 4' as Category, 'UDF_Name'					as UDF_Name ,'p where UDF_Name IN (''RightsArchiveRate'',''Duration'')AND ISNUMERIC(UDF_Value) = 0 '																		AS WhereClause, 'Rate is not numeric'											AS Validation_Reason			,'Product_Detail'			AS Table_Source		,'UDF_Value'						AS UDF_Value		UNION ALL
		select   'Validation Test 5' as Category, '''Product_ID'''				as UDF_Name ,'p where Product_ID LIKE ''%,%'' '																															AS WhereClause, 'Commas Not Allowed'											AS Validation_Reason			,'Product_Detail'			AS Table_Source		,'UDF_Value'						AS UDF_Value		UNION ALL
		select   'Validation Test 5' as Category,'''Parent_ID'''				as UDF_Name ,'p where Parent_ID LIKE ''%,%'''																																AS WhereClause, 'Commas Not Allowed'											AS Validation_Reason			,'Product_ID'				AS Table_Source		,'Parent_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 5' as Category, '''Product_ID'''				as UDF_Name ,'p where Product_ID LIKE ''%#%'''																															AS WhereClause, 'Hash Not Allowed'												AS Validation_Reason			,'Product_Detail'			AS Table_Source		,'UDF_Value'						AS UDF_Value		UNION ALL
		select   'Validation Test 5' as Category, '''Parent_ID'''				as UDF_Name ,'p where Parent_ID LIKE ''%#%'''																																AS WhereClause, 'Hash Not Allowed'												AS Validation_Reason			,'Product_ID'				AS Table_Source		,'Parent_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 5' as Category, '''Product_Description'''		as UDF_Name ,'p where Product_Description LIKE ''%#%'''																													AS WhereClause, 'Hash Not Allowed'												AS Validation_Reason			,'Product_ID'				AS Table_Source		,'Product_Description'				AS UDF_Value		UNION ALL	
		select   'Validation Test 5' as Category, '''Product_Description'''		as UDF_Name ,'p where Product_Description IS NULL'																													AS WhereClause, 'Hash Not Allowed'												AS Validation_Reason			,'Product_ID'				AS Table_Source		,'Product_Description'				AS UDF_Value		UNION ALL	
		select   'Validation Test 5' as Category, 'Product_ID'					as UDF_Name ,'p where Product_ID LIKE ''%''''%'' '																														AS WhereClause, 'Single Quote Not Allowed'										AS Validation_Reason			,'Product_Detail'			AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 5' as Category, 'Parent_ID'					as UDF_Name ,'p where Parent_ID LIKE ''%''''%'' '																															AS WhereClause, 'Single Quote Not Allowed'										AS Validation_Reason			,'Product_ID'				AS Table_Source		,'Parent_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 5' as Category,'''Product_ID'''				as UDF_Name ,'p where Product_ID IS NULL'																																	AS WhereClause, 'Commas Not Allowed'											AS Validation_Reason			,'Product_Detail_Raw'		AS Table_Source		,'''Product_ID Blank Refer to: '' +ISNULL(Product_ID,Product_Description)'	AS UDF_Value		UNION ALL
		select   'Validation Test 5' as Category, '''Product_ID'''				as UDF_Name ,'p where Product_ID = ''#N/A'''																																AS WhereClause, 'Hash Not Allowed'												AS Validation_Reason			,'Product_Detail'			AS Table_Source		,'''Blank Product/Description'''	AS UDF_Value		UNION ALL
		select   'Validation Test 5' as Category, '''Product_Description'''		as UDF_Name ,'p where Product_Description IS NULL'																														AS WhereClause, 'Hash Not Allowed'												AS Validation_Reason			,'Product_ID'				AS Table_Source		,'''Blank Product/Description'''	AS UDF_Value		UNION ALL
		select   'Validation Test 5' as Category, '''Product_Description'''		as UDF_Name ,'p where Product_Description = ''#N/A'''																													AS WhereClause, 'Hash Not Allowed'												AS Validation_Reason			,'Product_ID'				AS Table_Source		,'''Blank Product/Description'''	AS UDF_Value		UNION ALL
		select   'Validation Test 08a' as Category, '''Product_ID'''			as UDF_Name ,'p GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'																								AS WhereClause, 'Duplicate_Product ID In Source'	AS Validation_Reason			,'Product_ID'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 08b' as Category, '''Product_Description'''	as UDF_Name ,' GROUP BY Product_Description	HAVING COUNT(Product_Description) > 1'																						AS WhereClause, 'Duplicate_Product_Description In Source'	AS Validation_Reason			,'Product_ID'				AS Table_Source		,'Product_Description'				AS UDF_Value		UNION ALL
		select   'Validation Test 08c' as Category, 'p.Product_ID'				as UDF_Name ,'p LEFT JOIN	#Products_n_UDF		pu on pu.Product_ID  COLLATE DATABASE_DEFAULT = p.Product_ID	where  pu.Product_ID IS NOT NULL'						AS WhereClause, 'Duplicate_Product_ID in caspar'	AS Validation_Reason			,'Product_ID'				AS Table_Source		,'p.Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 08d' as Category, '''Product_Description'''	as UDF_Name ,'p LEFT JOIN	#Products_n_UDF		pu on pu.Product_Descrip  COLLATE DATABASE_DEFAULT = p.Product_Description	where  pu.Product_Descrip IS NOT NULL'		AS WhereClause, 'Duplicate_Product_Description in caspar'	AS Validation_Reason			,'Product_ID'				AS Table_Source		,'p.Product_Description'			AS UDF_Value		UNION ALL
		select   'Validation Test 11' as Category,'Product_ID'					as UDF_Name ,'p where  LEN(Product_ID) > '+@Product_ID_Lenght+''																										AS WhereClause, 'Length Over '+@Product_ID_Lenght+''							AS Validation_Reason			,'Product_ID'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 11' as Category, 'Product_Description'		as UDF_Name ,'p where  LEN(Product_Description) > '+@Product_Description_Lenght+''																						AS WhereClause, 'Length Over '+@Product_Description_Lenght+''					AS Validation_Reason			,'Product_ID'				AS Table_Source		,'Product_Description'				AS UDF_Value		UNION ALL
		select   'Validation Test 11' as Category, 'UDF_Name'					as UDF_Name ,'p where  LEN(UDF_Value) > '+@UDF_Value_Length+''																											AS WhereClause, 'Length Over '+@UDF_Value_Length+''								AS Validation_Reason			,'Product_Detail'			AS Table_Source		,'UDF_Value'						AS UDF_Value		UNION ALL
		select   'Validation Test 12' as Category,'UDF_Name'					as UDF_Name ,'p where UDF_Name IN (''ProductMediaFormat'',''ProductType'') AND UDF_Value IS NULL'																			AS WhereClause, 'Entry must have value'											AS Validation_Reason			,'Product_Detail'			AS Table_Source		,'''None'''							AS UDF_Value	UNION ALL	
	--	select   'Validation Test 15' as Category,'pd.Product_ID'				as UDF_Name ,'	pd LEFT JOIN #Products_n_UDF pu  on pd.UDF_Value COLLATE DATABASE_DEFAULT = pu.UDF_Value	where pd.UDF_Name IN (''BBCProductionGenre'',''SubGenreCode'')and pu.UDF_Value IS NULL ' AS WhereClause, 'UDF Doesnt Exist'					AS Validation_Reason			,'Product_Detail'			AS Table_Source		,'pd.UDF_value'						AS UDF_Value		
		
		select   'Validation Test 2' as Category, '''FirstTransmissionDate'''	as UDF_Name ,'p where p.UDF_Name = ''FirstTransmissionDate'' GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'													AS WhereClause, 'Duplicate FirstTransmissionDate In Source'	AS Validation_Reason			,'Product_Detail'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 2' as Category, '''ProductionHouseFlag'''		as UDF_Name ,'p where p.UDF_Name = ''ProductionHouseFlag'' GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'													AS WhereClause, 'Duplicate ProductionHouseFlag In Source'	AS Validation_Reason			,'Product_Detail'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 2' as Category, '''SeriesProductID'''			as UDF_Name ,'p where p.UDF_Name = ''SeriesProductID'' GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'														AS WhereClause, 'Duplicate SeriesProductID In Source'	AS Validation_Reason			,'Product_Detail'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 2' as Category, '''CoreNumber'''				as UDF_Name ,'p where p.UDF_Name = ''CoreNumber'' GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'																AS WhereClause, 'Duplicate CoreNumber In Source'	AS Validation_Reason			,'Product_Detail'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 2' as Category, '''SubGenreCode'''			as UDF_Name ,'p where p.UDF_Name = ''SubGenreCode'' GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'															AS WhereClause, 'Duplicate SubGenreCode In Source'	AS Validation_Reason			,'Product_Detail'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 2' as Category, '''BBCProductionGenre'''		as UDF_Name ,'p where p.UDF_Name = ''BBCProductionGenre'' GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'														AS WhereClause, 'Duplicate BBCProductionGenre In Source'	AS Validation_Reason			,'Product_Detail'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 2' as Category, '''Duration'''				as UDF_Name ,'p where p.UDF_Name = ''Duration'' GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'																AS WhereClause, 'Duplicate Duration In Source'	AS Validation_Reason			,'Product_Detail'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 2' as Category, '''IndieName'''				as UDF_Name ,'p where p.UDF_Name = ''IndieName'' GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'																AS WhereClause, 'Duplicate IndieName In Source'	AS Validation_Reason			,'Product_Detail'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 2' as Category, '''JVStatus'''				as UDF_Name ,'p where p.UDF_Name = ''JVStatus'' GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'																AS WhereClause, 'Duplicate JVStatus In Source'	AS Validation_Reason			,'Product_Detail'				AS Table_Source		,'Product_ID'						AS UDF_Value		UNION ALL
		select   'Validation Test 2' as Category, '''BrandID'''					as UDF_Name ,'p where p.UDF_Name = ''BrandID'' GROUP BY p.Product_ID HAVING COUNT([Product_ID]) > 1'																AS WhereClause, 'Duplicate BrandID In Source'	AS Validation_Reason			,'Product_Detail'				AS Table_Source		,'Product_ID'						AS UDF_Value		

		)
		select *, ROW_NUMBER() OVER (ORDER BY  Category ) AS Roww
		INTO #CTE_Validations_OnFile
		from CTE_Validations
		
		
		/********************************************************************************************/
		/*******************************************************************************************/
		/************************* Unicode Validation Rules On File *********************************/
		/********************************************************************************************/
		/********************************************************************************************/			
		

		IF OBJECT_ID('tempdb..#Product_Descriptions') IS NOT NULL DROP TABLE #Product_Descriptions
			select  LEFT(Product_Description,60) as name, ROW_NUMBER() OVER (ORDER BY Product_Description) AS Roww, Product_ID as Product_ID_U
			INTO #Product_Descriptions
			from CRA.[Product_ID]
			
		
					DECLARE @sql_remove_Blanks nvarchar(200) SET @sql_remove_Blanks = ''
					DECLARE @sql1 nvarchar(2000) SET @sql1 = ' '
					DECLARE @sql1_Total nvarchar(4000) SET @sql1_Total = ''
					DECLARE @Actual_Column_names nVARCHAR(2000) SET @Actual_Column_names = ''  
					DECLARE @Product_Descriptions_name nVARCHAR(50) 
					DECLARE @Product_ID_U nVARCHAR(50) 
					DECLARE @position int SET @position = 1;
					DECLARE @Roww int SET @Roww = 1;
					DECLARE @unicodestring nvarchar(10) SET @unicodestring = ' '
					DECLARE db_cursor CURSOR FOR  
							SELECT name, Roww,Product_ID_U
							FROM #Product_Descriptions

					OPEN db_cursor   
					FETCH NEXT FROM db_cursor INTO @Product_Descriptions_name , @Roww  ,@Product_ID_U

					
					WHILE @@FETCH_STATUS = 0   
					BEGIN   
						SET @position = 1;
					--	print @Product_Descriptions_name+' - '+ CAST(@position as nvarchar(30)) +' - '+ CAST(LEN(@Product_Descriptions_name) as nvarchar(30)) 
				
									/******************************************************************/
									WHILE @position < (LEN(@Product_Descriptions_name)+1)
									BEGIN
									  IF ( UNICODE(SUBSTRING(@Product_Descriptions_name, @position, 1)) > 122)
											   BEGIN
											   INSERT INTO 	CRA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
											   select 'Validation Test 6' AS Category, Product_ID, '+Product_Description' as UDF_Name ,Product_Description as UDF_Value, 'Incorrect Characters' AS Validation_Reason
											   from CRA.[Product_ID]
											   where Product_ID = @Product_ID_U
											   END
									SET @position = @position + 1
									END
									/******************************************************************/
				
						 FETCH NEXT FROM db_cursor INTO @Product_Descriptions_name  , @Roww  ,@Product_ID_U
					END   

					CLOSE db_cursor   
					DEALLOCATE db_cursor

		/********************************************************************************************/
		/********************************************************************************************/
		/************************* Run Validation On File *******************************************/
		/********************************************************************************************/
		/********************************************************************************************/
		
			
		DECLARE @For_Limit int						SET @For_Limit = (select count(*) from #CTE_Validations_OnFile)
		DECLARE @i int								SET @i = 1
		DECLARE @Split int							SET @Split = 7
		DECLARE @Category nvarchar(100) 			SET @Category = ''
		DECLARE @WhereClause nvarchar(500)			SET @WhereClause = ''
		DECLARE @Validation_Reason nvarchar(500)	SET @Validation_Reason = ''
		DECLARE @UDF_Name nvarchar(500)				SET @UDF_Name = ''
		DECLARE @Table_Source nvarchar(500)			SET @Table_Source = ''
		DECLARE @UDF_Value nvarchar(500)			SET @UDF_Value = ''
		DECLARE @Product_ID nvarchar(500)			
	

		/******************************************************************************************************************/
		SET @SQL = ''
		print '@i = '+ CAST(@i as nvarchar(10))  +' , Split = '+  CAST(@Split as nvarchar(10))+' , Limit = '+  CAST(@For_Limit as nvarchar(10))
		WHILE (@i <  @Split)
		BEGIN
			SET @Product_ID = 'p.Product_ID'
			SET @Category = (select Category from #CTE_Validations_OnFile where Roww = @i)
			SET @WhereClause = (select WhereClause from #CTE_Validations_OnFile where Roww = @i)
			SET @Validation_Reason = (select Validation_Reason from #CTE_Validations_OnFile where Roww = @i)
			SET @UDF_Name = (select UDF_Name from #CTE_Validations_OnFile where Roww = @i)
			SET @Table_Source = (select Table_Source from #CTE_Validations_OnFile where Roww = @i)
			SET @UDF_Value = (select UDF_Value from #CTE_Validations_OnFile where Roww = @i)

			IF ( @WhereClause LIKE '%GROUP%' AND @i NOT IN ( 1,9,10,11,12,13,14,15,16,17,18) ) BEGIN SET @Product_ID = '''Many''' END 

			SET @SQL = @SQL + 
			'
			INSERT INTO 	CRA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
			select '''+@Category+''' AS Category, '+@Product_ID+' as Product_ID, '+@UDF_Name+' as UDF_Name ,'+@UDF_Value+' as UDF_Value, '''+@Validation_Reason+''' AS Validation_Reason
			from CRA.'+@Table_Source+'
			'+@WhereClause+'
			'
			
			SET @i = @i + 1
		END
		exec (@SQL)
		
	
		/******************************************************************************************************************/
		SET @SQL = ''
		SET @i = @Split
		print '@i = '+ CAST(@i as nvarchar(10))  +' , Split = '+  CAST(@Split as nvarchar(10))+' , Limit = '+  CAST(@For_Limit as nvarchar(10))
		WHILE (@i <  @Split*2)
		BEGIN
			SET @Product_ID = 'p.Product_ID'
			SET @Category = (select Category from #CTE_Validations_OnFile where Roww = @i)
			SET @WhereClause = (select WhereClause from #CTE_Validations_OnFile where Roww = @i)
			SET @Validation_Reason = (select Validation_Reason from #CTE_Validations_OnFile where Roww = @i)
			SET @UDF_Name = (select UDF_Name from #CTE_Validations_OnFile where Roww = @i)
			SET @Table_Source = (select Table_Source from #CTE_Validations_OnFile where Roww = @i)
			SET @UDF_Value = (select UDF_Value from #CTE_Validations_OnFile where Roww = @i)
			IF ( @WhereClause LIKE '%GROUP%' AND @i NOT IN ( 1,9,10,11,12,13,14,15,16,17,18) ) BEGIN SET @Product_ID = '''Many''' END 

			SET @SQL = @SQL + 
			'
			INSERT INTO 	CRA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
			select '''+@Category+''' AS Category, '+@Product_ID+' as Product_ID, '+@UDF_Name+' as UDF_Name ,'+@UDF_Value+' as UDF_Value, '''+@Validation_Reason+''' AS Validation_Reason
			from CRA.'+@Table_Source+'
			'+@WhereClause+'
			'
			
			SET @i = @i + 1
		END
	--	print (@SQL)
		EXEC (@SQL)




	
		/******************************************************************************************************************/
		SET @SQL = ''
		SET @i = @Split*2
		print '@i = '+ CAST(@i as nvarchar(10))  +' , Split = '+  CAST(@Split as nvarchar(10))+' , Limit = '+  CAST(@For_Limit as nvarchar(10))

		WHILE (@i <  @Split*3)
		BEGIN
			SET @Product_ID = 'p.Product_ID'
			SET @Category = (select Category from #CTE_Validations_OnFile where Roww = @i)
			SET @WhereClause = (select WhereClause from #CTE_Validations_OnFile where Roww = @i)
			SET @Validation_Reason = (select Validation_Reason from #CTE_Validations_OnFile where Roww = @i)
			SET @UDF_Name = (select UDF_Name from #CTE_Validations_OnFile where Roww = @i)
			SET @Table_Source = (select Table_Source from #CTE_Validations_OnFile where Roww = @i)
			SET @UDF_Value = (select UDF_Value from #CTE_Validations_OnFile where Roww = @i)
			IF ( @WhereClause LIKE '%GROUP%' AND @i NOT IN ( 1,9,10,11,12,13,14,15,16,17,18) ) BEGIN SET @Product_ID = '''Many''' END 

			SET @SQL = @SQL + 
			'
			INSERT INTO 	CRA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
			select '''+@Category+''' AS Category, '+@Product_ID+' as Product_ID, '+@UDF_Name+' as UDF_Name ,'+@UDF_Value+' as UDF_Value, '''+@Validation_Reason+''' AS Validation_Reason
			from CRA.'+@Table_Source+'
			'+@WhereClause+'
			'
			
			SET @i = @i + 1
		END
		EXEC (@SQL)



		/******************************************************************************************************************/
		SET @SQL = ''
		SET @i = @Split*3
		print '@i = '+ CAST(@i as nvarchar(10))  +' , Split = '+  CAST(@Split as nvarchar(10))+' , Limit = '+  CAST(@For_Limit as nvarchar(10))

		WHILE (@i <  @Split*4)
		BEGIN
			SET @Product_ID = 'p.Product_ID'
			SET @Category = (select Category from #CTE_Validations_OnFile where Roww = @i)
			SET @WhereClause = (select WhereClause from #CTE_Validations_OnFile where Roww = @i)
			SET @Validation_Reason = (select Validation_Reason from #CTE_Validations_OnFile where Roww = @i)
			SET @UDF_Name = (select UDF_Name from #CTE_Validations_OnFile where Roww = @i)
			SET @Table_Source = (select Table_Source from #CTE_Validations_OnFile where Roww = @i)
			SET @UDF_Value = (select UDF_Value from #CTE_Validations_OnFile where Roww = @i)
			IF ( @WhereClause LIKE '%GROUP%' AND @i NOT IN ( 1,9,10,11,12,13,14,15,16,17,18) ) BEGIN SET @Product_ID = '''Many''' END 

			SET @SQL = @SQL + 
			'
			INSERT INTO 	CRA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
			select '''+@Category+''' AS Category, '+@Product_ID+' as Product_ID, '+@UDF_Name+' as UDF_Name ,'+@UDF_Value+' as UDF_Value, '''+@Validation_Reason+''' AS Validation_Reason
			from CRA.'+@Table_Source+'
			'+@WhereClause+'
			'
			
			SET @i = @i + 1
		END
		exec (@SQL)




		/******************************************************************************************************************/
		SET @SQL = ''
		SET @i = @Split*4
		print '@i = '+ CAST(@i as nvarchar(10))  +' , Split = '+  CAST(@Split as nvarchar(10))+' , Limit = '+  CAST(@For_Limit as nvarchar(10))

		WHILE (@i <  @For_Limit+1)
		BEGIN
			SET @Product_ID = 'p.Product_ID'
			SET @Category = (select Category from #CTE_Validations_OnFile where Roww = @i)
			SET @WhereClause = (select WhereClause from #CTE_Validations_OnFile where Roww = @i)
			SET @Validation_Reason = (select Validation_Reason from #CTE_Validations_OnFile where Roww = @i)
			SET @UDF_Name = (select UDF_Name from #CTE_Validations_OnFile where Roww = @i)
			SET @Table_Source = (select Table_Source from #CTE_Validations_OnFile where Roww = @i)
			SET @UDF_Value = (select UDF_Value from #CTE_Validations_OnFile where Roww = @i)
			IF ( @WhereClause LIKE '%GROUP%' AND @i NOT IN ( 1,9,10,11,12,13,14,15,16,17,18) ) BEGIN SET @Product_ID = '''Many''' END 

			SET @SQL = @SQL + 
			'
			INSERT INTO 	CRA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
			select '''+@Category+''' AS Category, '+@Product_ID+' as Product_ID, '+@UDF_Name+' as UDF_Name ,'+@UDF_Value+' as UDF_Value, '''+@Validation_Reason+''' AS Validation_Reason
			from CRA.'+@Table_Source+'
			'+@WhereClause+'
			'
			
			SET @i = @i + 1
		END
		exec (@SQL)
		





	



		



	



		


GO
/****** Object:  StoredProcedure [CRA].[usp_Transformer_Validations_Removal]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [CRA].[usp_Transformer_Validations_Removal] AS 
--   exec CRA.[usp_Transformer_Validations_Removal]


/********************************************************************************************/
/********************************************************************************************/
/************************* Base Parameters  *************************************************/
/********************************************************************************************/
/********************************************************************************************/
			SET NOCOUNT ON;
			SET XACT_ABORT ON;
			SET IMPLICIT_TRANSACTIONS OFF; -- Do not change this
			SET LANGUAGE English;
			SET DATEFORMAT DMY;
			SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

			DECLARE @Caspar_Layer				nvarchar(3)					SET @Caspar_Layer =		(	select [Caspar_Layer_Type] from [SSIS].[Configurations_CRA] where Turn_On = 1)
			DECLARE @Caspar_Server				nvarchar(20)				SET @Caspar_Server =	(   select [Caspar_Layer_Server] from [SSIS].[Configurations_CRA] where Turn_On = 1)
			DECLARE @Caspar_Database			nvarchar(20)				SET @Caspar_Database =	(	select [Caspar_Layer_Database] from [SSIS].[Configurations_CRA] where Turn_On = 1)
			DECLARE @UDFs_Required				nvarchar(2000)				SET @UDFs_Required = '''Product_ID'',''Parent_ID'',''Product_Description'',''Product_Media_Format'''
			DECLARE @SQL						nvarchar(4000)				SET @SQL = ''
			DECLARE	@Product_ID_Lenght			nvarchar(2)					SET @Product_ID_Lenght= 30
			DECLARE	@Product_Description_Lenght nvarchar(2)					SET @Product_Description_Lenght = 60
			DECLARE	@UDF_Value_Length			nvarchar(2)					SET @UDF_Value_Length = 30


		/********************************************************************************************/
		/********************************************************************************************/
		/************************* Update Raw Sheet with Validation *********************************/
		/********************************************************************************************/
		/********************************************************************************************/
		
		UPDATE CRA.[Product_Detail_Raw]  		SET [Validation_Failed] = 0, [Validation_Reason] = NULL						
			
			
			
			IF OBJECT_ID('tempdb..#Table_Columns') IS NOT NULL DROP TABLE #Table_Columns
			select name,column_id
			INTO #Table_Columns
			from sys.columns
			where object_id IN (
								select object_id 
								from sys.tables  t
								where t.name = 'Product_Detail_Raw'
								and t.schema_id IN (select schema_id from sys.schemas s where s.name LIKE 'CRA')
								)
								--AND name NOT IN ('FirstTransmissionDate','ProductionHouseFlag','SeriesProductID','CoreNumber','SubGenreCode','BBCProductionGenre','Duration','IndieName','JVStatus','BrandID')
			order by column_id	




					DECLARE @sql_remove_Blanks nvarchar(200) SET @sql_remove_Blanks = ''
					DECLARE @sql1 nvarchar(2000) SET @sql1 = ' '
					DECLARE @sql1_Total nvarchar(4000) SET @sql1_Total = ''
					DECLARE @Actual_Column_names nVARCHAR(2000) SET @Actual_Column_names = ''  
					DECLARE @Column_name nVARCHAR(50) 
					
					DECLARE db_cursor CURSOR FOR  
							SELECT name
							FROM #Table_Columns

					OPEN db_cursor   
					FETCH NEXT FROM db_cursor INTO @Column_name   

					WHILE @@FETCH_STATUS = 0   
					BEGIN   
						
						
									SET @sql1 =
									'
									UPDATE CRA.Product_Detail_Raw 	SET Validation_Failed = 1, Validation_Reason = ISNULL(r.Validation_Reason,'''') + ''/ '' + '''+@Column_name+'''+''=> ''+e.Validation_Reason 
									--select ''Many'' AS Type,'''+@Column_name+''' AS UDF_Name,e.Product_ID, r.Product_ID, r.Validation_Failed, e.Validation_Reason as Validation_Reason
									from			CRA.Product_Detail_Errors e
									INNER JOIN		CRA.Product_Detail_Raw r on e.UDF_Value = r.'+@Column_name+'
									where e.Product_ID = ''Many'' AND e.UDF_Name = '''+@Column_name+''' 
									'
									exec (@sql1)
			
									SET @sql1 =
									'
									UPDATE CRA.Product_Detail_Raw 	SET Validation_Failed = 1, Validation_Reason = ISNULL(r.Validation_Reason,'''') + ''/ '' + '''+@Column_name+'''+''=> ''+e.Validation_Reason 
									--select ''NOT Many'' AS Type,'''+@Column_name+''' AS UDF_Name,e.Product_ID, r.Product_ID, r.Validation_Failed, e.Validation_Reason as Validation_Reason
									from			CRA.Product_Detail_Errors e
									INNER JOIN		CRA.Product_Detail_Raw r on e.UDF_Value = r.'+@Column_name+'
									where e.Product_ID <> ''Many'' AND e.UDF_Name = '''+@Column_name+''' 
									'
									exec (@sql1)
			

						 FETCH NEXT FROM db_cursor INTO @Column_name   
					END   

					CLOSE db_cursor   
					DEALLOCATE db_cursor

			
				UPDATE CRA.Product_Detail_Raw SET Validation_Reason = SUBSTRING(Validation_Reason,2,400)
				from CRA.Product_Detail_Raw
				where Validation_Failed = 1 And LEFT(Validation_Reason,2) = '/ '

	
		/********************************************************************************************/
		/********************************************************************************************/
		/************************* Update Groups with Validation ************************************/
		/********************************************************************************************/
		/********************************************************************************************/
		

			IF OBJECT_ID('tempdb..#Table_ColumnsGroups') IS NOT NULL DROP TABLE #Table_ColumnsGroups
			select name,column_id
			INTO #Table_ColumnsGroups
			from sys.columns
			where object_id IN (
								select object_id 
								from sys.tables  t
								where t.name = 'Product_Detail_Raw'
								and t.schema_id IN (select schema_id from sys.schemas s where s.name LIKE 'CRA')
								)
								AND name IN ('FirstTransmissionDate','ProductionHouseFlag','SeriesProductID','CoreNumber','SubGenreCode','BBCProductionGenre','Duration','IndieName','JVStatus','BrandID')
			order by column_id


			
					SET @sql_remove_Blanks = ''
					SET @sql1 = ' '
					SET @sql1_Total = ''
					SET @Actual_Column_names = ''  
										
					DECLARE db_cursor CURSOR FOR  
							SELECT name
							FROM #Table_ColumnsGroups

					OPEN db_cursor   
					FETCH NEXT FROM db_cursor INTO @Column_name   

					WHILE @@FETCH_STATUS = 0   
					BEGIN   
		
									SET @sql1 =
									'
									UPDATE CRA.Product_Detail_Raw 	SET Validation_Failed = 1, Validation_Reason = ISNULL(r.Validation_Reason,'''') + ''/ '' + '''+@Column_name+'''+''=> ''+e.Validation_Reason 
									--select ''NOT Many'' AS Type,'''+@Column_name+''' AS UDF_Name,e.Product_ID, r.Product_ID, r.Validation_Failed, e.Validation_Reason as Validation_Reason
									from			CRA.Product_Detail_Errors e
									INNER JOIN		CRA.Product_Detail_Raw r on e.UDF_Value = r.Product_ID
									where e.Product_ID <> ''Many'' AND e.UDF_Name = '''+@Column_name+''' 
									'
									exec (@sql1)
			

						 FETCH NEXT FROM db_cursor INTO @Column_name   
					END   

					CLOSE db_cursor   
					DEALLOCATE db_cursor



		/********************************************************************************************/
		/********************************************************************************************/
		/************************* Update Unicode with Validation ************************************/
		/********************************************************************************************/
		/********************************************************************************************/
		
		UPDATE CRA.Product_Detail_Raw
		SET Validation_Failed = 1
		--select r.Validation_Failed
		from			CRA.Product_Detail_Errors e
		INNER JOIN		CRA.Product_Detail_Raw r on e.Product_Id = r.Product_ID
		 where e.Validation_Reason = 'Incorrect Characters' 


		/********************************************************************************************/
		/********************************************************************************************/
		/************************* Remove Errors ****************************************************/
		/********************************************************************************************/
		/********************************************************************************************/


		IF OBJECT_ID('tempdb..#Errors') IS NOT NULL DROP TABLE #Errors
		select distinct Product_ID
		INTO #Errors
		from CRA.Product_Detail_Raw
		where Validation_Failed = 1 


		DELETE 	from		CRA.[Product_Detail] 
		where Product_ID IN 
		(	select  Product_ID	from #Errors
		)

		DELETE 	from		CRA.[Product_ID] 
		where Product_ID IN 
		(	select  Product_ID	from #Errors
		)
		



		


GO
/****** Object:  StoredProcedure [IPA].[usp_Transformer_Product_Detail]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [IPA].[usp_Transformer_Product_Detail] 

AS 

			IF OBJECT_ID('IPA.Product_Detail') IS NOT NULL TRUNCATE TABLE IPA.Product_Detail
			IF OBJECT_ID('tempdb..#Table_Columns') IS NOT NULL DROP TABLE #Table_Columns
			select name,column_id
			INTO #Table_Columns
			from sys.columns
			where object_id IN (
								select object_id 
								from sys.tables  t
								where t.name = 'Product_Detail_Raw'
								and t.schema_id IN (select schema_id from sys.schemas s where s.name LIKE 'IPA')
								)
			and name NOT IN ('Parent_ID','Product_Description')
			order by column_id	

			--select * from #Table_Columns
			

					DECLARE @sql_remove_Blanks nvarchar(200) SET @sql_remove_Blanks = ''
					DECLARE @sql1 nvarchar(2000) SET @sql1 = ' '
					DECLARE @sql1_Total nvarchar(4000) SET @sql1_Total = ''
					DECLARE @Actual_Column_names nVARCHAR(2000) SET @Actual_Column_names = ''  
					DECLARE @Column_name nVARCHAR(50) 
					DECLARE db_cursor CURSOR FOR  
							SELECT name
							FROM #Table_Columns

					OPEN db_cursor   
					FETCH NEXT FROM db_cursor INTO @Column_name   

					WHILE @@FETCH_STATUS = 0   
					BEGIN   
						
						
									SET @sql1 =
									'INSERT INTO [IPA].[Product_Detail] (Product_ID, UDF_Name, UDF_Value)
									 select Product_ID,'''+@Column_name+''' AS UDF, LTRIM(CAST('+@Column_name+' AS nvarchar(100))) AS UDF_Value from IPA.Product_Detail_Raw '
									exec (@sql1)

						 FETCH NEXT FROM db_cursor INTO @Column_name   
					END   

					CLOSE db_cursor   
					DEALLOCATE db_cursor

				
					UPDATE IPA.[Product_Detail]
					SET  UDF_value = REPLACE(UDF_Value,' ',NULL) where UDF_Value = ''


					UPDATE IPA.[Product_Detail_Raw]
					SET  Parent_ID = REPLACE(Parent_ID,' ',NULL) where Parent_ID = ''

					DELETE
					from IPA.[Product_Detail]
					where UDF_name IN ('Caspar_Layer','Product_ID')

		

			DECLARE @Caspar_Layer		nvarchar(3)			SET @Caspar_Layer = (select Caspar_Layer_Type from [SSIS].[Configurations_IPA] where Turn_On = 1)
			IF (@Caspar_Layer = 'IPA')
			BEGIN	
					DELETE
					from IPA.[Product_Detail] 
					where UDF_Value iS null



			END



GO
/****** Object:  StoredProcedure [IPA].[usp_Transformer_Raw_Updates]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [IPA].[usp_Transformer_Raw_Updates] 
--exec [IPA].[usp_Transformer_Raw_Updates] 
AS 

UPDATE [IPA].[Product_Detail_Raw]  SET Caspar_Layer = Caspar_Layer_Type from [SSIS].[Configurations_IPA] where Turn_On = 1
UPDATE [IPA].[Product_Detail_Raw] SET Catalogue_ID= NULL FROM [IPA].[Product_Detail_Raw] where Catalogue_ID= ''
UPDATE [IPA].[Product_Detail_Raw] SET Product_ID= NULL FROM [IPA].[Product_Detail_Raw] where Product_ID= ''
UPDATE [IPA].[Product_Detail_Raw] SET Catalogue_Title= NULL FROM [IPA].[Product_Detail_Raw] where Catalogue_Title= ''
UPDATE [IPA].[Product_Detail_Raw] SET Product_Description= NULL FROM [IPA].[Product_Detail_Raw] where Product_Description= ''
UPDATE [IPA].[Product_Detail_Raw] SET ReleaseDate= NULL FROM [IPA].[Product_Detail_Raw] where ReleaseDate= ''
UPDATE [IPA].[Product_Detail_Raw] SET Medium_Code= NULL FROM [IPA].[Product_Detail_Raw] where Medium_Code= ''
UPDATE [IPA].[Product_Detail_Raw] SET Medium_Code_Description= NULL FROM [IPA].[Product_Detail_Raw] where Medium_Code_Description= ''
UPDATE [IPA].[Product_Detail_Raw] SET Box_set= NULL FROM [IPA].[Product_Detail_Raw] where Box_set= ''
UPDATE [IPA].[Product_Detail_Raw] SET Business_Area= NULL FROM [IPA].[Product_Detail_Raw] where Business_Area= ''
UPDATE [IPA].[Product_Detail_Raw] SET TPPPFLAG= NULL FROM [IPA].[Product_Detail_Raw] where TPPPFLAG= ''
UPDATE [IPA].[Product_Detail_Raw] SET Royalty_Rate= NULL FROM [IPA].[Product_Detail_Raw] where Royalty_Rate= ''
UPDATE [IPA].[Product_Detail_Raw] SET Strand_Description= NULL FROM [IPA].[Product_Detail_Raw] where Strand_Description= ''
UPDATE [IPA].[Product_Detail_Raw] SET New_WW_Genre= NULL FROM [IPA].[Product_Detail_Raw] where New_WW_Genre= ''
UPDATE [IPA].[Product_Detail_Raw] SET BBCProductionGenre= NULL FROM [IPA].[Product_Detail_Raw] where BBCProductionGenre= ''
UPDATE [IPA].[Product_Detail_Raw] SET BBCGenre_Description= NULL FROM [IPA].[Product_Detail_Raw] where BBCGenre_Description= ''
UPDATE [IPA].[Product_Detail_Raw] SET SubGenreCode= NULL FROM [IPA].[Product_Detail_Raw] where SubGenreCode= ''
UPDATE [IPA].[Product_Detail_Raw] SET WWSubGenre_Description= NULL FROM [IPA].[Product_Detail_Raw] where WWSubGenre_Description= ''
UPDATE [IPA].[Product_Detail_Raw] SET BBC_Production_Department_Code= NULL FROM [IPA].[Product_Detail_Raw] where BBC_Production_Department_Code= ''
UPDATE [IPA].[Product_Detail_Raw] SET BBC_Production_Department_Description= NULL FROM [IPA].[Product_Detail_Raw] where BBC_Production_Department_Description= ''
UPDATE [IPA].[Product_Detail_Raw] SET CoreNumber= NULL FROM [IPA].[Product_Detail_Raw] where CoreNumber= ''
UPDATE [IPA].[Product_Detail_Raw] SET Product_Classification_Code= NULL FROM [IPA].[Product_Detail_Raw] where Product_Classification_Code= ''
UPDATE [IPA].[Product_Detail_Raw] SET Product_Classification_Description= NULL FROM [IPA].[Product_Detail_Raw] where Product_Classification_Description= ''
UPDATE [IPA].[Product_Detail_Raw] SET FPINo= NULL FROM [IPA].[Product_Detail_Raw] where FPINo= ''
UPDATE [IPA].[Product_Detail_Raw] SET CILSID= NULL FROM [IPA].[Product_Detail_Raw] where CILSID= ''
UPDATE [IPA].[Product_Detail_Raw] SET Archive_Content= NULL FROM [IPA].[Product_Detail_Raw] where Archive_Content= ''
UPDATE [IPA].[Product_Detail_Raw] SET Dormant_Content= NULL FROM [IPA].[Product_Detail_Raw] where Dormant_Content= ''
UPDATE [IPA].[Product_Detail_Raw] SET BrandID= NULL FROM [IPA].[Product_Detail_Raw] where BrandID= ''
UPDATE [IPA].[Product_Detail_Raw] SET IndieName= NULL FROM [IPA].[Product_Detail_Raw] where IndieName= ''
UPDATE [IPA].[Product_Detail_Raw] SET Live_Date= NULL FROM [IPA].[Product_Detail_Raw] where Live_Date= ''
UPDATE [IPA].[Product_Detail_Raw] SET JVStatus= NULL FROM [IPA].[Product_Detail_Raw] where JVStatus= ''
UPDATE [IPA].[Product_Detail_Raw] SET Created_Date= NULL FROM [IPA].[Product_Detail_Raw] where Created_Date= ''
UPDATE [IPA].[Product_Detail_Raw] SET Status= NULL FROM [IPA].[Product_Detail_Raw] where Status= ''
UPDATE [IPA].[Product_Detail_Raw] SET Episode_Number= NULL FROM [IPA].[Product_Detail_Raw] where Episode_Number= ''
UPDATE [IPA].[Product_Detail_Raw] SET Duration= NULL FROM [IPA].[Product_Detail_Raw] where Duration= ''
UPDATE [IPA].[Product_Detail_Raw] SET Strand_Code= NULL FROM [IPA].[Product_Detail_Raw] where Strand_Code= ''
UPDATE [IPA].[Product_Detail_Raw] SET ProductionHouseFlag= NULL FROM [IPA].[Product_Detail_Raw] where ProductionHouseFlag= ''
UPDATE [IPA].[Product_Detail_Raw] SET Parent_ID= NULL FROM [IPA].[Product_Detail_Raw] where Parent_ID= ''
UPDATE [IPA].[Product_Detail_Raw] SET FirstTransmissionDate= NULL FROM [IPA].[Product_Detail_Raw] where FirstTransmissionDate= ''
UPDATE [IPA].[Product_Detail_Raw] SET ProductMediaFormat= NULL FROM [IPA].[Product_Detail_Raw] where ProductMediaFormat= ''
UPDATE [IPA].[Product_Detail_Raw] SET ProductType= NULL FROM [IPA].[Product_Detail_Raw] where ProductType= ''
UPDATE [IPA].[Product_Detail_Raw] SET Title= NULL FROM [IPA].[Product_Detail_Raw] where Title= ''
UPDATE [IPA].[Product_Detail_Raw] SET MMContractID= NULL FROM [IPA].[Product_Detail_Raw] where MMContractID= ''
UPDATE [IPA].[Product_Detail_Raw] SET ScheduleRef= NULL FROM [IPA].[Product_Detail_Raw] where ScheduleRef= ''
UPDATE [IPA].[Product_Detail_Raw] SET RightsArchiveRate= NULL FROM [IPA].[Product_Detail_Raw] where RightsArchiveRate= ''
UPDATE [IPA].[Product_Detail_Raw] SET IndieStrandTitle= NULL FROM [IPA].[Product_Detail_Raw] where IndieStrandTitle= ''
UPDATE [IPA].[Product_Detail_Raw] SET WWGenre= NULL FROM [IPA].[Product_Detail_Raw] where WWGenre= ''
UPDATE [IPA].[Product_Detail_Raw] SET TitleGroup= NULL FROM [IPA].[Product_Detail_Raw] where TitleGroup= ''
UPDATE [IPA].[Product_Detail_Raw] SET BBCGenre= NULL FROM [IPA].[Product_Detail_Raw] where BBCGenre= ''
UPDATE [IPA].[Product_Detail_Raw] SET WWSubGenre= NULL FROM [IPA].[Product_Detail_Raw] where WWSubGenre= ''
UPDATE [IPA].[Product_Detail_Raw] SET BBCGenreBoard= NULL FROM [IPA].[Product_Detail_Raw] where BBCGenreBoard= ''
UPDATE [IPA].[Product_Detail_Raw] SET AdditionalThirdPartyShareFlag= NULL FROM [IPA].[Product_Detail_Raw] where AdditionalThirdPartyShareFlag= ''
UPDATE [IPA].[Product_Detail_Raw] SET CommissioningDepartment= NULL FROM [IPA].[Product_Detail_Raw] where CommissioningDepartment= ''
UPDATE [IPA].[Product_Detail_Raw] SET ContractType= NULL FROM [IPA].[Product_Detail_Raw] where ContractType= ''
UPDATE [IPA].[Product_Detail_Raw] SET Caspar_Layer= NULL FROM [IPA].[Product_Detail_Raw] where Caspar_Layer= ''
UPDATE [IPA].[Product_Detail_Raw] SET  Catalogue_ID= RTRIM(LTRIM(Catalogue_ID))
UPDATE [IPA].[Product_Detail_Raw] SET  Product_ID= RTRIM(LTRIM(Product_ID))
UPDATE [IPA].[Product_Detail_Raw] SET  Catalogue_Title= RTRIM(LTRIM(Catalogue_Title))
UPDATE [IPA].[Product_Detail_Raw] SET  Product_Description= RTRIM(LTRIM(Product_Description))
UPDATE [IPA].[Product_Detail_Raw] SET  ReleaseDate= RTRIM(LTRIM(ReleaseDate))
UPDATE [IPA].[Product_Detail_Raw] SET  Medium_Code= RTRIM(LTRIM(Medium_Code))
UPDATE [IPA].[Product_Detail_Raw] SET  Medium_Code_Description= RTRIM(LTRIM(Medium_Code_Description))
UPDATE [IPA].[Product_Detail_Raw] SET  Box_set= RTRIM(LTRIM(Box_set))
UPDATE [IPA].[Product_Detail_Raw] SET  Business_Area= RTRIM(LTRIM(Business_Area))
UPDATE [IPA].[Product_Detail_Raw] SET  TPPPFLAG= RTRIM(LTRIM(TPPPFLAG))
UPDATE [IPA].[Product_Detail_Raw] SET  Royalty_Rate= RTRIM(LTRIM(Royalty_Rate))
UPDATE [IPA].[Product_Detail_Raw] SET  Strand_Description= RTRIM(LTRIM(Strand_Description))
UPDATE [IPA].[Product_Detail_Raw] SET  New_WW_Genre= RTRIM(LTRIM(New_WW_Genre))
UPDATE [IPA].[Product_Detail_Raw] SET  BBCProductionGenre= RTRIM(LTRIM(BBCProductionGenre))
UPDATE [IPA].[Product_Detail_Raw] SET  BBCGenre_Description= RTRIM(LTRIM(BBCGenre_Description))
UPDATE [IPA].[Product_Detail_Raw] SET  SubGenreCode= RTRIM(LTRIM(SubGenreCode))
UPDATE [IPA].[Product_Detail_Raw] SET  WWSubGenre_Description= RTRIM(LTRIM(WWSubGenre_Description))
UPDATE [IPA].[Product_Detail_Raw] SET  BBC_Production_Department_Code= RTRIM(LTRIM(BBC_Production_Department_Code))
UPDATE [IPA].[Product_Detail_Raw] SET  BBC_Production_Department_Description= RTRIM(LTRIM(BBC_Production_Department_Description))
UPDATE [IPA].[Product_Detail_Raw] SET  CoreNumber= RTRIM(LTRIM(CoreNumber))
UPDATE [IPA].[Product_Detail_Raw] SET  Product_Classification_Code= RTRIM(LTRIM(Product_Classification_Code))
UPDATE [IPA].[Product_Detail_Raw] SET  Product_Classification_Description= RTRIM(LTRIM(Product_Classification_Description))
UPDATE [IPA].[Product_Detail_Raw] SET  FPINo= RTRIM(LTRIM(FPINo))
UPDATE [IPA].[Product_Detail_Raw] SET  CILSID= RTRIM(LTRIM(CILSID))
UPDATE [IPA].[Product_Detail_Raw] SET  Archive_Content= RTRIM(LTRIM(Archive_Content))
UPDATE [IPA].[Product_Detail_Raw] SET  Dormant_Content= RTRIM(LTRIM(Dormant_Content))
UPDATE [IPA].[Product_Detail_Raw] SET  BrandID= RTRIM(LTRIM(BrandID))
UPDATE [IPA].[Product_Detail_Raw] SET  IndieName= RTRIM(LTRIM(IndieName))
UPDATE [IPA].[Product_Detail_Raw] SET  Live_Date= RTRIM(LTRIM(Live_Date))
UPDATE [IPA].[Product_Detail_Raw] SET  JVStatus= RTRIM(LTRIM(JVStatus))
UPDATE [IPA].[Product_Detail_Raw] SET  Created_Date= RTRIM(LTRIM(Created_Date))
UPDATE [IPA].[Product_Detail_Raw] SET  Status= RTRIM(LTRIM(Status))
UPDATE [IPA].[Product_Detail_Raw] SET  Episode_Number= RTRIM(LTRIM(Episode_Number))
UPDATE [IPA].[Product_Detail_Raw] SET  Duration= RTRIM(LTRIM(Duration))
UPDATE [IPA].[Product_Detail_Raw] SET  Strand_Code= RTRIM(LTRIM(Strand_Code))
UPDATE [IPA].[Product_Detail_Raw] SET  ProductionHouseFlag= RTRIM(LTRIM(ProductionHouseFlag))
UPDATE [IPA].[Product_Detail_Raw] SET  Parent_ID= RTRIM(LTRIM(Parent_ID))
UPDATE [IPA].[Product_Detail_Raw] SET  FirstTransmissionDate= RTRIM(LTRIM(FirstTransmissionDate))
UPDATE [IPA].[Product_Detail_Raw] SET  ProductMediaFormat= RTRIM(LTRIM(ProductMediaFormat))
UPDATE [IPA].[Product_Detail_Raw] SET  ProductType= RTRIM(LTRIM(ProductType))
UPDATE [IPA].[Product_Detail_Raw] SET  Title= RTRIM(LTRIM(Title))
UPDATE [IPA].[Product_Detail_Raw] SET  MMContractID= RTRIM(LTRIM(MMContractID))
UPDATE [IPA].[Product_Detail_Raw] SET  ScheduleRef= RTRIM(LTRIM(ScheduleRef))
UPDATE [IPA].[Product_Detail_Raw] SET  RightsArchiveRate= RTRIM(LTRIM(RightsArchiveRate))
UPDATE [IPA].[Product_Detail_Raw] SET  IndieStrandTitle= RTRIM(LTRIM(IndieStrandTitle))
UPDATE [IPA].[Product_Detail_Raw] SET  WWGenre= RTRIM(LTRIM(WWGenre))
UPDATE [IPA].[Product_Detail_Raw] SET  TitleGroup= RTRIM(LTRIM(TitleGroup))
UPDATE [IPA].[Product_Detail_Raw] SET  BBCGenre= RTRIM(LTRIM(BBCGenre))
UPDATE [IPA].[Product_Detail_Raw] SET  WWSubGenre= RTRIM(LTRIM(WWSubGenre))
UPDATE [IPA].[Product_Detail_Raw] SET  BBCGenreBoard= RTRIM(LTRIM(BBCGenreBoard))
UPDATE [IPA].[Product_Detail_Raw] SET  AdditionalThirdPartyShareFlag= RTRIM(LTRIM(AdditionalThirdPartyShareFlag))
UPDATE [IPA].[Product_Detail_Raw] SET  CommissioningDepartment= RTRIM(LTRIM(CommissioningDepartment))
UPDATE [IPA].[Product_Detail_Raw] SET  ContractType= RTRIM(LTRIM(ContractType))
UPDATE [IPA].[Product_Detail_Raw] SET  Caspar_Layer= RTRIM(LTRIM(Caspar_Layer))

UPDATE [IPA].[Product_Detail_Raw] SET Product_Description = UPPER(Product_Description)
UPDATE [IPA].[Product_Detail_Raw] SET IndieName = UPPER(IndieName)
UPDATE [IPA].[Product_Detail_Raw] SET [Catalogue_Title] = UPPER([Catalogue_Title])
UPDATE [IPA].[Product_Detail_Raw] SET [Product_Description] = REPLACE(REPLACE(REPLACE(	  [Product_Description], CHAR(9),''), CHAR(13),''), CHAR(10),'')
UPDATE [IPA].[Product_Detail_Raw] SET [Catalogue_Title] = REPLACE(REPLACE(REPLACE(	  [Catalogue_Title], CHAR(9),''), CHAR(13),''), CHAR(10),'')
UPDATE [IPA].[Product_Detail_Raw] SET FirstTransmissionDate = REPLACE(FirstTransmissionDate,'.','/') where FirstTransmissionDate LIKE '%.%'




;WITH CTE_Genre_Mapping AS
(
select 'AR' AS BBC_Genre ,'Arts' AS Descrip UNION ALL
select 'CH' AS BBC_Genre ,'Childrens' AS Descrip UNION ALL
select 'DO' AS BBC_Genre ,'Documentaries' AS Descrip UNION ALL
select 'DR' AS BBC_Genre ,'Drama' AS Descrip UNION ALL
select 'ED' AS BBC_Genre ,'Education' AS Descrip UNION ALL
select 'LB' AS BBC_Genre ,'Library Sales' AS Descrip UNION ALL
select 'LE' AS BBC_Genre ,'Light Entertainment' AS Descrip UNION ALL
select 'MA' AS BBC_Genre ,'Music & Arts' AS Descrip UNION ALL
select 'MU' AS BBC_Genre ,'Music' AS Descrip UNION ALL
select 'NA' AS BBC_Genre ,'Not Applicable' AS Descrip UNION ALL
select 'NC' AS BBC_Genre ,'News & Current' AS Descrip UNION ALL
select 'NT' AS BBC_Genre ,'Natural History' AS Descrip UNION ALL
select 'RA' AS BBC_Genre ,'Reading' AS Descrip UNION ALL
select 'RE' AS BBC_Genre ,'Religion' AS Descrip UNION ALL
select 'RI' AS BBC_Genre ,'Radio' AS Descrip UNION ALL
select 'SM' AS BBC_Genre ,'Science & Medicine' AS Descrip UNION ALL
select 'SP' AS BBC_Genre ,'Sport' AS Descrip UNION ALL
select 'TP' AS BBC_Genre ,'Topical' AS Descrip UNION ALL
select 'TV' AS BBC_Genre ,'Training Videos' AS Descrip UNION ALL
select 'ZZ' AS BBC_Genre ,'Unclassified' AS Descrip
)
UPDATE IPA.Product_Detail_Raw SET BBCGenre_Description = m.Descrip
--select top 100  r.[BBCProductionGenre], m.BBC_Genre, m.Descrip, r.[BBCGenre_Description]
from IPA.Product_Detail_Raw r
INNER JOIN CTE_Genre_Mapping m on r.[BBCProductionGenre] = m.BBC_Genre



;WITH CTE_Genre_Mapping AS
(
select 'CHA' AS WW_Genre ,'Childrens Animation' AS Descrip UNION ALL
select 'CHI' AS WW_Genre ,'Childrens' AS Descrip UNION ALL
select 'DED' AS WW_Genre ,'Drama' AS Descrip UNION ALL
select 'DEL' AS WW_Genre ,'Light Entertainment' AS Descrip UNION ALL
select 'GFC' AS WW_Genre ,'Cookery' AS Descrip UNION ALL
select 'GFD' AS WW_Genre ,'Docs & Investigation' AS Descrip UNION ALL
select 'GFL' AS WW_Genre ,'Leisure & Factual En' AS Descrip UNION ALL
select 'GFS' AS WW_Genre ,'Factual Special' AS Descrip UNION ALL
select 'GFT' AS WW_Genre ,'Travel' AS Descrip UNION ALL
select 'LBU' AS WW_Genre ,'Business' AS Descrip UNION ALL
select 'LEL' AS WW_Genre ,'Elt' AS Descrip UNION ALL
select 'LLA' AS WW_Genre ,'Languages' AS Descrip UNION ALL
select 'LLL' AS WW_Genre ,'Lifelong Learning' AS Descrip UNION ALL
select 'LSE' AS WW_Genre ,'Schools Education' AS Descrip UNION ALL
select 'MCL' AS WW_Genre ,'Classical Music' AS Descrip UNION ALL
select 'MCO' AS WW_Genre ,'Contemporary Music' AS Descrip UNION ALL
select 'MOT' AS WW_Genre ,'Music (Other)' AS Descrip UNION ALL
select 'NA' AS WW_Genre ,'Not Applicable' AS Descrip UNION ALL
select 'NCA' AS WW_Genre ,'News & Current Affai' AS Descrip UNION ALL
select 'SFA' AS WW_Genre ,'Arts' AS Descrip 


)
UPDATE IPA.Product_Detail_Raw SET [WWSubGenre_Description] = m.Descrip
--select top 100  r.[WWSubGenre], m.WW_Genre, m.Descrip, r.[WWSubGenre_Description]
from IPA.Product_Detail_Raw r
INNER JOIN CTE_Genre_Mapping m on r.subGenreCode = m.WW_Genre



GO
/****** Object:  StoredProcedure [IPA].[usp_Transformer_Store_Products]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [IPA].[usp_Transformer_Store_Products] 

AS 

	DECLARE @IPA_Server nvarchar(20) SET @IPA_Server = (SELECT Caspar_Layer_Server from [SSIS].[Configurations_IPA] where Turn_On = 1 AND Caspar_Layer_Type='STR')
	DECLARE @IPA_Database nvarchar(20) SET @IPA_Database = (SELECT Caspar_Layer_Database from [SSIS].[Configurations_IPA] where Turn_On = 1 AND Caspar_Layer_Type='STR')
	DECLARE @CRA_Server nvarchar(20) SET @CRA_Server = (SELECT SUBSTRING ( REPLACE(Caspar_Layer_Name,@IPA_Server,'')  ,CHARINDEX('W', REPLACE(Caspar_Layer_Name,@IPA_Server,'') ) , 11 ) from [SSIS].[Configurations_IPA] where Turn_On = 1 AND Caspar_Layer_Type='STR')
	DECLARE @CRA_Database nvarchar(20) SET @CRA_Database = (select Caspar_Layer_Database from [SSIS].[Configurations_CRA] where Caspar_Layer_Server = @CRA_Server)
	DECLARE @StoreSalesType nvarchar(20) SET @StoreSalesType = 'Z8'
	DECLARE @StoreMedia nvarchar(20) SET @StoreMedia = 'STOREUK'
	--select @IPA_Server, @IPA_Database,@CRA_Server,@CRA_Database

    DECLARE @sql nvarchar(4000)

   /*********************************************************************************************/
   /*********************************************************************************************/
   /************************ Get CRA Possible Products to Load with Z8 **************************/
   /*********************************************************************************************/
   /*********************************************************************************************/

   IF OBJECT_ID('tempdb..#Products_Possible_To_Include') IS NOT NULL DROP TABLE #Products_Possible_To_Include
   CREATE TABLE #Products_Possible_To_Include (udkey_1_sid int ,udkey_1_id nvarchar(30),  descr nvarchar(60) )   
   SET @sql =
   '
   INSERT INTO  #Products_Possible_To_Include(udkey_1_sid  ,udkey_1_id ,  descr )
   select distinct cu1.udkey_1_sid, LEFT(cu1.udkey_1_id,30), LEFT(cu1.descr , 60)
   from   '+@CRA_Server+'.'+@CRA_Database+'.dbo.x_posted_history xph
   INNER JOIN  '+@CRA_Server+'.'+@CRA_Database+'.dbo.c_udkey_1   cu1 on cu1.udkey_1_sid = xph.udkey_1_sid
   where xph.modified_datetime > (GETDATE() - 90) and xph.udkey_4_sid = (select udkey_4_sid from '+@CRA_Server+'.'+@CRA_Database+'.dbo.c_udkey_4  cu4 where cu4.udkey_4_id IN ('''+@StoreSalesType+'''))
  -- and xph.udkey_7_sid =(select udkey_7_sid from '+@CRA_Server+'.'+@CRA_Database+'.dbo.c_udkey_7  cu7 where cu7.udkey_7_id IN ('''+@StoreMedia+'''))
   '
   exec (@sql)

   /*********************************************************************************************/
   /*********************************************************************************************/
   /************************ Get IPA Products ***************************************************/
   /*********************************************************************************************/
   /*********************************************************************************************/

   IF OBJECT_ID('tempdb..#Products') IS NOT NULL DROP TABLE #Products
   CREATE TABLE #Products (udkey_1_id nvarchar(30))
   SET @sql =
   '
   INSERT INTO  #Products(udkey_1_id )
   select distinct LEFT(cu1.udkey_1_id,30) as udkey_1_id
   From  '+@IPA_Server+'.'+@IPA_Database+'.dbo.c_udkey_1   cu1 
   '
   exec (@sql)
    

   /*********************************************************************************************/
   /*********************************************************************************************/
   /************************ New Product IDs ****************************************************/
   /*********************************************************************************************/
   /*********************************************************************************************/
    
   IF OBJECT_ID('IPA.Product_ID') IS NOT NULL BEGIN TRUNCATE TABLE [IPA].[Product_ID] END
    INSERT INTO [IPA].[Product_ID] (Product_ID, [Product_Description])
    select   i.udkey_1_id as [Product_ID], REPLACE(LEFT(descr,60),',','') as  [Product_Description]
    from   #Products_Possible_To_Include i
    LEFT JOIN  #Products      p on p.udkey_1_id = i.udkey_1_id
    where p.udkey_1_id IS NULL
    
	
  
   /*********************************************************************************************/
   /*********************************************************************************************/
   /************************ New Product Details ************************************************/
   /*********************************************************************************************/
   /*********************************************************************************************/


   IF OBJECT_ID('IPA.Product_Detail') IS NOT NULL TRUNCATE TABLE IPA.Product_Detail
    SET @sql =
   '
   INSERT INTO IPA.Product_Detail (Product_ID, UDF_Name,UDF_Value)
   select  cu1.udkey_1_id AS Product_ID,/* cu1.udkey_1_sid, cu1u.udf_sid,*/ cu.name AS UDF_Name, cu7.udkey_7_id AS UDF_Value
   from   '+@CRA_Server+'.'+@CRA_Database+'.dbo.c_udkey_1    cu1
   LEFT JOIN  '+@CRA_Server+'.'+@CRA_Database+'.dbo.c_udkey_1_udf   cu1u  on cu1.udkey_1_sid = cu1u.udkey_1_sid
   LEFT JOIN  '+@CRA_Server+'.'+@CRA_Database+'.dbo.c_udf     cu   ON cu.udf_sid = cu1u.udf_sid 
   LEFT JOIN  '+@CRA_Server+'.'+@CRA_Database+'.dbo.c_udkey_7    cu7   on cu7.udkey_7_sid = cu1u.udf_value
   where  UDF_Value IS NOT NULL
     AND cu1.udkey_1_id IN (select product_id COLLATE DATABASE_DEFAULT from [IPA].[Product_ID])
     AND cu.name IN (''ProductMediaFormat'')
   '
   exec (@sql)

	--select * from IPA.Product_ID
	--select * from IPA.Product_Detail




GO
/****** Object:  StoredProcedure [IPA].[usp_Transformer_Validations]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [IPA].[usp_Transformer_Validations]
	
AS 


/********************************************************************************************/
/********************************************************************************************/
/************************* Testing Parameters  **********************************************/
/********************************************************************************************/
/********************************************************************************************/

-- Change this if testing as this removes errors from output
DECLARE @Test				nvarchar(3)			SET @Test = 'NO' --  NO


/********************************************************************************************/
/********************************************************************************************/
/************************* Base Parameters  *************************************************/
/********************************************************************************************/
/********************************************************************************************/

		--	EXEC  [Product_Transformer].[usp_START] @Layer_name = 'CRA Store 6.2'
			SET XACT_ABORT ON;
			SET IMPLICIT_TRANSACTIONS OFF; -- Do not change this
			--SET NOCOUNT OFF;
			SET LANGUAGE English;
			SET DATEFORMAT DMY;

			DECLARE @Caspar_Layer		nvarchar(3)			SET @Caspar_Layer =		(	select [Caspar_Layer_Type] from [SSIS].[Configurations_IPA] where Turn_On = 1)
			DECLARE @Caspar_Server		nvarchar(20)		SET @Caspar_Server =	(   select [Caspar_Layer_Server] from [SSIS].[Configurations_IPA] where Turn_On = 1)
			DECLARE @Caspar_Database	nvarchar(20)		SET @Caspar_Database =	(	select [Caspar_Layer_Database] from [SSIS].[Configurations_IPA] where Turn_On = 1)
			DECLARE @UDFs_Required		nvarchar(2000)		SET @UDFs_Required = '''Product_ID'',''Parent_ID'',''Product_Description'',''Product_Media_Format'''
			DECLARE @sql				nvarchar(4000)
			DECLARE @UDFs_To_Keep		nvarchar(2000) 
		

			IF( @Caspar_Layer = 'IPA') BEGIN SET DATEFORMAT YMD; END
			IF (@Caspar_Layer = 'CRA') 
					BEGIN 
							SET @UDFs_To_Keep = '''BBCProductionGenre'',''ProductMediaFormat'',''SubGenreCode'',''CoreNumber'',''BrandID'',''JVStatus'',''Duration'',''FirstTransmissionDate'',''xx'',''xx'',''xx'''
							DECLARE @dateconversion_checker nvarchar(20)	SET @dateconversion_checker = (select TOP 1 RIGHT(UDF_Value,4)	from IPA.Product_Detail where UDF_Name = 'FirstTransmissionDate' ORDER BY UDF_Value desc)
							DECLARE @dateconversion int
							BEGIN TRY		SET @dateconversion = ISNUMERIC(CAST(@dateconversion_checker AS int)) 					END TRY
							BEGIN CATCH		SET @dateconversion = 0																	END CATCH
					END	
								
			IF (@Caspar_Layer = 'IPA') 
					BEGIN 
							SET @UDFs_To_Keep = '''ReleaseDate'',''ProductMediaFormat'',''ProductType'',''TPPPFLAG'',''RightsArchiveRate'',''WWGenre'',''BBCGenre'',''WWSubGenre'',''BBCGenreBoard'',''CommissioningDepartment'',''CoreNumber'',''ContractType'',''FPINo'',''CILSID'''
					END

			UPDATE IPA.Product_Detail 			SET UDF_Value = LTRIM(UDF_Value)
			IF OBJECT_ID('IPA.Product_Detail_Errors')	IS NOT NULL TRUNCATE TABLE IPA.Product_Detail_Errors
			
	
			
/********************************************************************************************/
/********************************************************************************************/
/************************* Column Order Review **********************************************/
/********************************************************************************************/
/********************************************************************************************/


			/********************************************************************************************/
			/************************* Get Actual Columns ***********************************************/
			/********************************************************************************************/
			IF OBJECT_ID('tempdb..#Actual_Table_Columns') IS NOT NULL DROP TABLE #Actual_Table_Columns
					
					/* Validation Test 2 */
					select name,column_id
					INTO #Actual_Table_Columns
					from sys.columns
					where object_id IN (

										select object_id 
										from sys.tables  t
										where t.name = 'Product_Detail_Raw'
											and t.schema_id IN (select schema_id from sys.schemas s where s.name LIKE 'Product_Transformer')

										)
					order by column_id					

					DECLARE @Actual_Column_names nVARCHAR(2000) SET @Actual_Column_names = ''  
					DECLARE @Column_name nVARCHAR(50) 
					DECLARE db_cursor CURSOR FOR  
							SELECT name
							FROM #Actual_Table_Columns

					OPEN db_cursor   
					FETCH NEXT FROM db_cursor INTO @Column_name   

					WHILE @@FETCH_STATUS = 0   
					BEGIN   
							
							If @Actual_Column_names = '' BEGIN		SET @Actual_Column_names = ''''+@Column_name								END 
							else If @Actual_Column_names <> '' BEGIN		SET @Actual_Column_names = @Actual_Column_names +''',''' +@Column_name		END 
						   FETCH NEXT FROM db_cursor INTO @Column_name   
					END   

					CLOSE db_cursor   
					DEALLOCATE db_cursor
					SET @Actual_Column_names = @Actual_Column_names + ''''
					
	
	
/********************************************************************************************/
/********************************************************************************************/
/************************* (1) Source General Format Review *********************************/
/********************************************************************************************/
/********************************************************************************************/			
			
					;WITH CTE_General_Format_Validations AS
					(
								
								/* Validation Test 3 */
								select Product_ID, UDF_Name ,UDF_Value, 'Realease/Transmission Date Format incorrect YYYY/MM/DD' AS Validation_Reason
								from IPA.Product_Detail
								where UDF_Name = 'ReleaseDate'			  AND ISDATE(UDF_Value) = 0
								UNION ALL
								SELECT Product_ID, UDF_Name ,UDF_Value,  'Realease/Transmission Date Format incorrect YYYY/MM/DD' AS Validation_Reason
								from IPA.Product_Detail
								WHERE UDF_Name = 'FirstTransmissionDate' AND  ISDATE(UDF_Value) = 0  
								UNION ALL
								
								/* Validation Test 4 */
								SELECT  Product_ID, UDF_Name ,UDF_Value, 'Rate is not numeric' AS Validation_Reason
  								FROM IPA.Product_Detail
								where UDF_Name IN ('RightsArchiveRate','Duration')		AND ISNUMERIC(UDF_Value) = 0 
								UNION ALL 
								
								/* Validation Test 5 */
								SELECT DISTINCT Product_ID, 'Product_ID' AS UDF_Name ,Product_ID AS UDF_Value, 'Commas Not Allowed' AS Validation_Reason
								from IPA.Product_Detail
								where Product_ID LIKE '%,%' 
								UNION ALL
								SELECT  Product_ID, UDF_Name ,UDF_Value, 'Commas Not Allowed' AS Validation_Reason
								from IPA.Product_Detail
								where UDF_Value LIKE '%,%' AND @Caspar_Layer = 'IPA'
								UNION ALL
								SELECT  Product_ID, 'Parent_ID' AS UDF_Name ,Parent_ID AS UDF_Value, 'Commas Not Allowed' AS Validation_Reason
								from IPA.Product_ID
								where Parent_ID LIKE '%,%'
								UNION ALL
								SELECT  Product_ID, 'Product_Description' AS UDF_Name ,Product_Description AS UDF_Value, 'Commas Not Allowed' AS Validation_Reason
								from IPA.Product_ID
								where Product_Description LIKE '%,%' AND @Caspar_Layer = 'IPA'
								UNION ALL
								SELECT DISTINCT Product_ID, 'Product_ID' AS UDF_Name ,Product_ID AS UDF_Value, 'Commas Not Allowed' AS Validation_Reason
								from IPA.Product_Detail
								where Product_ID LIKE '%#%'
								UNION ALL
								SELECT  Product_ID, UDF_Name ,UDF_Value, 'Commas Not Allowed' AS Validation_Reason
								from IPA.Product_Detail
								where UDF_Value LIKE '%#%' AND @Caspar_Layer = 'IPA'
								UNION ALL
								SELECT  Product_ID, 'Parent_ID' AS UDF_Name ,Parent_ID AS UDF_Value, 'Commas Not Allowed' AS Validation_Reason
								from IPA.Product_ID
								where Parent_ID LIKE '%#%'
								UNION ALL
								SELECT  Product_ID, 'Product_Description' AS UDF_Name ,Product_Description AS UDF_Value, 'Commas Not Allowed' AS Validation_Reason
								from IPA.Product_ID
								where Product_Description LIKE '%#%' AND @Caspar_Layer = 'IPA'
								UNION ALL							
	
								/* Validation Test 6 */
								select  'None' AS Product_ID, 'Product_ID' AS UDF_Name ,'Product_ID Blank Refer to: ' +ISNULL(Product_ID,Product_Description) AS UDF_Value,'Blank Product/Description' AS Validation_Reason
								from  IPA.Product_Detail_Raw
								where Product_ID IS NULL
								UNION ALL 
								select  distinct Product_ID,'Product_ID' AS  UDF_Name ,'Product_ID cannot be #N/A' AS UDF_Value,'Blank Product/Description' AS Validation_Reason
								from  IPA.Product_Detail
								where Product_ID = '#N/A'
								UNION ALL
								select Product_ID, 'Product_Description' AS UDF_Name ,'Product_Description Blank' AS UDF_Value,  'Blank Product/Description' AS Validation_Reason
								from IPA.Product_ID o
								where Product_Description IS NULL	
								UNION ALL
								select Product_ID, 'Product_Description' AS UDF_Name ,'Product_Description cannot be #N/A'  AS UDF_Value, 'Blank Product/Description' AS Validation_Reason
								from IPA.Product_ID o
								where Product_Description = '#N/A'
								UNION ALL
								
								/* Validation Test 7 */
								SELECT Product_ID, UDF_Name ,UDF_Value,  'Investment blank' AS Validation_Reason
								from IPA.Product_Detail
								WHERE UDF_Name IN ('Investment','FPINo','CILSID') AND UDF_Value IS NULL AND @Caspar_Layer = 'IPA'
								UNION ALL
								
								/* Validation Test 8 */
								select  Product_ID,'Product_ID' UDF_Name ,Product_ID AS UDF_Value, 'Duplicate_Product/Description_ID in file/caspar combination' AS Validation_Reason
 								FROM IPA.Product_Detail_Raw   
								GROUP BY Product_ID
								HAVING COUNT([Product_ID]) > 1
								UNION ALL
								select  'Many' AS Product_ID,'Product_Description' UDF_Name ,Product_Description AS UDF_Value, 'Duplicate_Product/Description_ID in file/caspar combination' AS Validation_Reason
 								FROM IPA.Product_Detail_Raw   
								where Product_ID NOT IN ('Product_Description')
								GROUP BY Product_Description
								HAVING COUNT(Product_Description) > 1
								UNION ALL
								SELECT distinct Product_ID, 'Product_ID' AS UDF_Name ,Product_ID AS UDF_Value,  'Single Quote Not Allowed' AS Validation_Reason
								from IPA.Product_Detail
								where Product_ID LIKE '%''%'  AND @Caspar_Layer = 'IPA'
								UNION ALL	
								SELECT  Product_ID, 'Parent_ID' AS UDF_Name ,Parent_ID AS UDF_Value, 'Single Quote Not Allowed' AS Validation_Reason
								from IPA.Product_ID
								where Parent_ID LIKE '%''%' AND @Caspar_Layer = 'IPA'
								UNION ALL
								SELECT  Product_ID, 'Product_Description' AS UDF_Name ,Product_Description AS UDF_Value, 'Single Quote Not Allowed' AS Validation_Reason
								from IPA.Product_ID
								where Product_Description LIKE '%''%' AND @Caspar_Layer = 'IPA'
								UNION ALL
								
								/* Validation Test 11 */
								select Product_ID, 'Product' AS UDF_Name ,Product_ID AS UDF_Value, 'Length Over 30 charcaters' AS Validation_Reason
								from IPA.Product_ID  WITH (NOLOCK)
								where  LEN(Product_ID) > 30
								UNION ALL
								select Product_ID, 'Product_Description' AS UDF_Name ,Product_Description AS UDF_Value, 'Length Over 60 charcaters' AS Validation_Reason
								from IPA.Product_ID  WITH (NOLOCK)
								where  LEN(Product_Description) > 60
								UNION ALL
								select Product_ID, UDF_Name AS UDF_Name ,UDF_Value AS UDF_Value, 'Length Over 30 charcaters' AS Validation_Reason
								from IPA.Product_Detail  WITH (NOLOCK)
								where  LEN(UDF_Value) > 30
								UNION ALL	
								select Product_ID	, UDF_Name AS UDF_Name ,'None' AS UDF_Value, 'Entry must have value' AS Validation_Reason 
								from IPA.Product_Detail
								where UDF_Name IN ('FPINo','CILSID','ProductMediaFormat','ProductType') AND UDF_Value IS NULL
					)

			INSERT INTO 	IPA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
			select  'Source General Format Review' as Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason
			from  CTE_General_Format_Validations 
			ORDER BY UDF_Name

				/* Validation Test 8 */
				IF OBJECT_ID('tempdb..#Duplicate_Descriptions') IS NOT NULL DROP TABLE #Duplicate_Descriptions
				select Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason 
				INTO #Duplicate_Descriptions
				from IPA.Product_Detail_Errors
				where Validation_Reason = 'Duplicate_Product/Description_ID in file/caspar combination' AND Product_ID = 'Many'

				INSERT INTO 	IPA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
				select 	temp.Error_Type,p.Product_ID AS Product_ID, temp.UDF_Name,p.Product_Description AS UDF_Value,temp.Validation_Reason 
				from			#Duplicate_Descriptions				temp
				INNER JOIN		IPA.Product_ID	p ON p.Product_Description = temp.UDF_Value
				ORDER BY UDF_Value

				DELETE 
				from IPA.Product_Detail_Errors
				where Validation_Reason = 'Duplicate_Product/Description_ID in file/caspar combination' AND Product_ID = 'Many' 
	


/********************************************************************************************/
/********************************************************************************************/
/************************* (2) Source Unique Layer Format Review ****************************/
/********************************************************************************************/
/********************************************************************************************/	
	
	If (@Caspar_Layer = 'CRA')
		BEGIN
			INSERT INTO 	IPA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )		
			select  'Source Unique Layer Format Review' as Error_Type, Product_ID	, UDF_Name AS UDF_Name ,'None' AS UDF_Value, 'Null Entry not allowed' AS Validation_Reason 
			from IPA.Product_Detail	
			where UDF_Value IS NULL
			UNION ALL
			select  'Source Unique Layer Format Review' as Error_Type,Product_ID	,'Core_Number' UDF_Name ,UDF_Value AS UDF_Value, 'Length not 8' AS Validation_Reason  
			FROM IPA.Product_Detail 
			where   UDF_Name IN ('CoreNumber')	AND LEN(UDF_Value) <> 8 
		END



/********************************************************************************************/
/********************************************************************************************/
/************************* (3) Destination Layer Format Review ******************************/
/********************************************************************************************/
/********************************************************************************************/	

	
			IF OBJECT_ID('tempdb..#Products_n_UDF') IS NOT NULL DROP TABLE #Products_n_UDF
			CREATE TABLE #Products_n_UDF 
			(
			[Type] nvarchar(30) ,
			[Product_ID] nvarchar(30), 
			[Product_Descrip] nvarchar(255), 
			[UDF_Name] nvarchar(60), 
			[UDF_Value] nvarchar(60)
			)
			
			SET @sql = 
			'	
				/**** Product Data ***/
				INSERT INTO #Products_n_UDF  (Type,Product_ID,Product_Descrip,UDF_Name,UDF_Value )
				select ''Product_ID'' AS Type, LEFT(udkey_1_id,30) AS Product_ID, LEFT(descr,60) AS Product_Descrip, NULL AS UDF_Name, NULL AS UDF_Value
				from			'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_udkey_1
				UNION ALL
				
				/**** UDF Data ***/
				select ''UDfs'' AS Type, NULL AS Product_ID, NULL AS Product_Descrip, cu.name AS UDF_Name, cdev.enumerated_id AS UDF_Value
				from			'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_udf							cu
				LEFT JOIN		'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_datatype						cd		ON cd.datatype_sid = cu.datatype_sid
				LEFT JOIN		'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_datatype_enumerated_value		cdev	ON cd.datatype_sid = cdev.datatype_sid
				where 	cdev.enumerated_id IS NOT NULL
				UNION ALL
				select ''UDfs'' AS Type, NULL AS Product_ID, NULL AS Product_Descrip, udkey_7_id collate DATABASE_DEFAULT AS UDF_Name,  udkey_7_id collate DATABASE_DEFAULT AS UDF_Value
				from			'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_udkey_7
				UNION ALL
				select ''UDfs'' AS Type, NULL AS Product_ID, NULL AS Product_Descrip, udkey_17_id collate DATABASE_DEFAULT AS UDF_Name,  udkey_17_id collate DATABASE_DEFAULT AS UDF_Value
				from			'+@Caspar_Server+'.'+@Caspar_Database+'.dbo.c_udkey_17
			'
			exec (@sql)
			



			/* Validation Test 08a */
			INSERT INTO 	IPA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
			select   'Destination Layer Format Review' as Error_Type , p.Product_ID as Product_ID, 'Product_ID' as UDF_Name,p.Product_ID as UDF_Value,'Duplicate_Product/Description_ID in file/caspar combination'	 AS Validation_Reason
			from		IPA.Product_ID  p
			LEFT JOIN	#Products_n_UDF		pu on pu.Product_ID = p.Product_ID
			where  pu.Product_ID IS NOT NULL
			UNION ALL			
			select   'Destination Layer Format Review' as Error_Type , p.Product_ID as Product_ID, 'Product_Description' as UDF_Name,p.Product_Description as UDF_Value,'Duplicate_Product/Description_ID in file/caspar combination'	 AS Validation_Reason
			from		IPA.Product_ID  p
			LEFT JOIN	#Products_n_UDF		pu on pu.Product_Descrip = p.Product_Description
			where  pu.Product_Descrip IS NOT NULL
	
			/* Validation Test 15 */
			INSERT INTO 	IPA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
			select  'Destination Layer Format Review' as Error_Type , ISNULL(pd.Product_ID,'None') as Product_ID, pd.udf_name as UDF_Name,pd.UDF_value as UDF_Value,'UDF Value doesnt exist in caspar' AS Validation_Reason
			from 			IPA.Product_Detail	pd
			LEFT JOIN		#Products_n_UDF				pu  on pd.UDF_Value = pu.UDF_Value
			where 	pd.UDF_Name IN ('FPINo', 'CILSID', 'ProductMediaFormat','BBCGenre_code','ContractType','BBCGenre_code','WWSubGenre_code','WWGenre','ProductType','ProductMediaFormat','BBCGenre_codeBoard','CommissioningDepartment')	
					and pu.UDF_Value IS NULL AND @Caspar_Layer = 'IPA'
				
			/* Validation Test 16a - Parent NOT in File */	
			/* Parent to be created in the same file */
			IF OBJECT_ID('tempdb..#Parents_To_Be_Created_In_Same_File') IS NOT NULL DROP TABLE #Parents_To_Be_Created_In_Same_File
			SELECT		 pd1.Product_ID, pd1.Parent_ID
			INTO #Parents_To_Be_Created_In_Same_File
			FROM		IPA.Product_ID pd1
			LEFT JOIN	IPA.Product_ID pd2 on pd1.Parent_ID = pd2.Product_ID	
			where pd2.Product_ID IS NOT NULL AND @Caspar_Layer = 'IPA'
			
			/* Delete Parent IDs to be created in file*/
			DELETE IPA.Product_Detail_Errors
			from		IPA.Product_Detail_Errors pde
			LEFT JOIN	#Parents_To_Be_Created_In_Same_File			p ON pde.Product_Id = p.Product_ID --AND pde.UDF_Value = p.Parent_ID
			where pde.UDF_Name = 'Parent_ID' AND pde.Validation_Reason = 'Parent_ID doesnt exist yet in Caspar' --AND  pde.Product_Id = 'ST0000000601'
			AND  p.Parent_ID IS NOT NULL AND @Caspar_Layer = 'IPA'
		
			/* Validation Test 18 */
			INSERT INTO 	IPA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
			select 'Destination Layer Format Review' as Error_Type, Product_ID, UDF_Name AS UDF_Name,UDF_Value,'z One of '+ REPLACE(@UDFs_Required,'''','')+' fail therefore all entries fail' AS Validation_Reason
			from IPA.Product_Detail
			where Product_ID 
						 IN
									(
									select distinct Product_Id
									from IPA.Product_Detail_Errors
									where UDF_Name IN ('Product_Description','Product_ID','Parent_ID')	
									)
							AND UDF_Name NOT IN ('Product_Description','Product_ID')
									

/********************************************************************************************/
/********************************************************************************************/
/************************* Ouputs ***********************************************************/
/********************************************************************************************/
/********************************************************************************************/
			
			IF OBJECT_ID('tempdb..#Product_Detail_Errors') IS NOT NULL DROP TABLE #Product_Detail_Errors
			IF OBJECT_ID('tempdb..#Product_ID') IS NOT NULL DROP TABLE #Product_ID
			IF OBJECT_ID('tempdb..#Product_Detail') IS NOT NULL DROP TABLE #Product_Detail

			/* Validation Test 18 */
			SET @sql = 
			'
			INSERT INTO 	IPA.Product_Detail_Errors (Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason )
			SELECT ''Output Layer Format Review'' as Error_Type, Product_ID, UDF_Name AS UDF_Name ,ISNULL(UDF_Value,''None'') AS UDF_Value,  ''zz Remove line where Product ID/Description/Parent error'' AS Validation_Reason
			from IPA.Product_Detail
			where Product_ID IN (select distinct Product_Id from IPA.Product_Detail_Errors where UDF_Name IN ('+@UDFs_Required+'))
			'	
			exec (@sql)

			/********************************************************************************************/
			/************************* PRODUCT ERRORS ***************************************************/
			/********************************************************************************************/

			/* Keep Only Single Error Per Entry */
			CREATE TABLE #Product_Detail_Errors([Error_Date] datetime NULL,[Error_Type] [nvarchar](100) NULL,[Product_Id] [nvarchar](100) NULL,[UDF_Name] [nvarchar](100) NULL,	[UDF_Value] [nvarchar](100) NULL,	[Validation_Reason] [nvarchar](400) NULL) 
	
			SET @sql =
			'
			WITH CTE_Only_Keep_Orginal_Errors_If_also_ProductParentDescr_error AS
			(		
			select Error_Type, Product_ID, UDF_Name,UDF_Value,Validation_Reason, ROW_NUMBER() OVER (PARTITION BY Product_ID, UDF_Name ORDER BY Product_ID, UDF_Name,Validation_Reason ) AS Duplicate_Roww_Error
			from IPA.Product_Detail_Errors	
			)
			INSERT INTO #Product_Detail_Errors (Error_Date,Error_Type,Product_ID ,UDF_Name,UDF_Value, Validation_Reason)
			select GETDATE() AS Error_Date, Error_Type, Product_ID, UDF_Name,UDF_Value
						, CASE	WHEN LEFT(Validation_Reason,2) = ''z '' THEN REPLACE(Validation_Reason,''z '','''')
								WHEN LEFT(Validation_Reason,3) = ''zz '' THEN REPLACE(Validation_Reason,''zz '','''')
								ELSE Validation_Reason
			END AS Validation_Reason
			from CTE_Only_Keep_Orginal_Errors_If_also_ProductParentDescr_error
			where Duplicate_Roww_Error = 1 AND UDF_Name IN ('+@UDFs_To_Keep+','+@UDFs_Required+')
			ORDER BY Product_ID, UDF_Name,Validation_Reason
			'
			exec (@sql)
			
			/********************************************************************************************/
			/************************* PRODUCT ID *******************************************************/
			/********************************************************************************************/

			/* Create Product ID */
			IF OBJECT_ID('tempdb..#Product_ID') IS NOT NULL DROP TABLE #Product_ID
			CREATE TABLE #Product_ID(	[Product_ID] [nvarchar](400) NULL,	[Parent_ID] [nvarchar](400) NULL,	[Product_Description] [nvarchar](400) NULL)
			
			SET @sql =
			'
			INSERT INTO #Product_ID (Product_ID, Parent_ID, Product_Description)
			select pd.Product_ID, pd.Parent_ID, pd.Product_Description
			from			IPA.Product_ID				pd
			LEFT JOIN		IPA.Product_Detail_Raw		rw ON rw.Product_ID = pd.Product_ID
			where pd.Product_ID NOT IN 
										(
										select distinct Product_Id 
										from #Product_Detail_Errors 
										where UDF_Name IN ('+@UDFs_Required+')
										)
			ORDER BY rw.Parent_ID
			'
			exec (@sql)

			
			/********************************************************************************************/
			/************************* PRODUCT DETAIL ***************************************************/
			/********************************************************************************************/
	
			/* Create Product Detail */
			IF OBJECT_ID('tempdb..#Product_Detail') IS NOT NULL DROP TABLE #Product_Detail
			CREATE TABLE #Product_Detail(	[Product_ID] [nvarchar](400) NULL,	[UDF_Name] [varchar](39) NULL,	[UDF_Value] [nvarchar](400) NULL)


			SET @sql =
			'		
			INSERT INTO #Product_Detail (Product_ID, UDF_Name, UDF_Value)
			select pd.Product_ID, pd.UDF_Name, pd.UDF_Value
			from			IPA.Product_Detail			pd
			LEFT JOIN		#Product_Detail_Errors						pde ON pd.Product_ID = pde.Product_Id AND ISNULL(pd.UDF_Value,''None'') = pde.UDF_Value
			where pd.udf_name IN ('+@UDFs_To_Keep+')
			and pde.Validation_Reason IS NULL
			ORDER BY pd.UDF_Name
			'
			exec (@sql)

		

			/********************************************************************************************/
			/************************* Move Parent ID from PRODUCT_ID to PRODUCT_DETAIL *****************/
			/********************************************************************************************/
			-- --This is needed here as the SSIS loop is used by IPA & CRA. IPA requires Parent
			
					IF (@Caspar_Layer = 'IPA')
					BEGIN
					TRUNCATE TABLE IPA.Investment_Reference
					INSERT INTO IPA.Investment_Reference
					select distinct UDF_Value, UDF_Value
					from #Product_Detail_Errors
					where Validation_Reason IN ('UDF Value doesnt exist in caspar') AND UDF_Name IN ('CILSID','FPINo')
					DELETE
					from #Product_Detail_Errors
					where Validation_Reason IN ('UDF Value doesnt exist in caspar') AND UDF_Name IN ('CILSID','FPINo')
					END
--IF (@Test = 'YES')
--BEGIN
--			UPDATE #Product_Detail_Errors
--			SET Product_ID = NULL
--			where  Validation_Reason  IN ('UDF Value doesnt exist in caspar') AND UDF_Name IN ('ContractType','CommissioningDepartment')

	
--			IF OBJECT_ID('IPA.Product_ID') IS NOT NULL
--			BEGIN
										
	
--					select Product_ID, Parent_ID, Product_Description
--					from #Product_ID
--					ORDER BY Product_ID
--			 END


--			IF OBJECT_ID('IPA.Product_Detail') IS NOT NULL
--			BEGIN
--					IF (@Caspar_Layer = 'IPA')
--					BEGIN			
--					print 'Removed date conversion'

--					END

--					select Product_ID, UDF_Name, UDF_Value	
--					from #Product_Detail
--					ORDER BY Product_ID
--			END


--			IF OBJECT_ID('IPA.Product_Detail_Errors') IS NOT NULL
--			BEGIN
--					select distinct Error_Date,	Error_Type,	Product_Id,	UDF_Name	,UDF_Value	,Validation_Reason 
--					from 	#Product_Detail_Errors
--					ORDER BY Product_ID
--			END
--END


--IF (@Test = 'NO')
--BEGIN
--			-- Remove product_IDs where UDF_Value needs adding
--			UPDATE #Product_Detail_Errors
--			SET Product_ID = NULL
--			where  Validation_Reason  IN ('UDF Value doesnt exist in caspar') AND UDF_Name IN ('ContractType','CommissioningDepartment')

--			IF OBJECT_ID('IPA.Product_ID') IS NOT NULL
--			BEGIN
										
--					TRUNCATE TABLE IPA.Product_ID
-- 					INSERT INTO IPA.Product_ID (Product_ID, Parent_ID, Product_Description)
--					select Product_ID, Parent_ID, Product_Description
--					from #Product_ID
--					ORDER BY Product_ID
--			 END

--			IF OBJECT_ID('IPA.Product_Detail') IS NOT NULL
--			BEGIN
--					TRUNCATE TABLE IPA.Product_Detail
--					IF (@Caspar_Layer = 'IPA')
--					BEGIN
--					print 'date not converted'
--					END

-- 					INSERT INTO IPA.Product_Detail (Product_ID, UDF_Name, UDF_Value)
--					select Product_ID, UDF_Name, UDF_Value	
--					from #Product_Detail
--					ORDER BY Product_ID
--					TRUNCATE TABLE #Product_ID
			
--			END


--			IF OBJECT_ID('IPA.Product_Detail_Errors') IS NOT NULL
--			BEGIN
--					TRUNCATE TABLE IPA.Product_Detail_Errors
-- 					INSERT INTO IPA.Product_Detail_Errors (Error_Date,Error_Type,Product_Id,	UDF_Name	,UDF_Value	,Validation_Reason)
--					select distinct Error_Date,	Error_Type,	Product_Id,	UDF_Name	,UDF_Value	,Validation_Reason 
--					from 	#Product_Detail_Errors
--					where Validation_Reason <> 'One of Product_ID,Parent_ID,Product_Description,Product_Media_Format fail therefore all entries fail'
--					ORDER BY Product_ID
--			END

		
--					-- If standard IPA file & errors occur then fail all files
--					DECLARE @Error_Count int SET @Error_Count = (select count(*) from IPA.Product_Detail_Errors)
--					IF( @Error_Count <> 0 AND @Caspar_Layer = 'IPA' )
--					BEGIN
--					TRUNCATE TABLE IPA.Product_Detail
--					TRUNCATE TABLE IPA.Product_ID
--					TRUNCATE TABLE IPA.[Investment_Reference]
--					END
		
--END


			

SET QUOTED_IDENTIFIER ON

GO
/****** Object:  StoredProcedure [IPA].[usp_Transformer_Validations_Removal]    Script Date: 28/04/2016 08:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [IPA].[usp_Transformer_Validations_Removal] AS 
--   exec IPA.[usp_Transformer_Validations_Removal]

	
		/********************************************************************************************/
		/********************************************************************************************/
		/************************* Update Raw Sheet with Validation *********************************/
		/********************************************************************************************/
		/********************************************************************************************/
		UPDATE IPA.[Product_Detail_Raw]  		SET [Validation_Failed] = 0, [Validation_Reason] = NULL	

			
			IF( (select count(*) from IPA.Product_Detail_Errors) > 0)
			BEGIN
			UPDATE IPA.[Product_Detail_Raw]  		SET [Validation_Failed] = 1, [Validation_Reason] = 'If Error Complete File Fails'						
			DELETE FROM [IPA].[Product_Detail]
			DELETE FROM [IPA].[Product_ID]
			DELETE FROM [IPA].[Investment_Reference]
			END
			

GO
USE [master]
GO
ALTER DATABASE [Caspar_Warehouse] SET  READ_WRITE 
GO
