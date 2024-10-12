USE [master]
GO
/****** Object:  Database [SWP_PROJECT]    Script Date: 10/3/2024 11:27:04 PM ******/
CREATE DATABASE [SWP_PROJECT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP_PROJECT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP_PROJECT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP_PROJECT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP_PROJECT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP_PROJECT] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP_PROJECT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP_PROJECT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP_PROJECT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP_PROJECT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP_PROJECT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP_PROJECT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP_PROJECT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP_PROJECT] SET  MULTI_USER 
GO
ALTER DATABASE [SWP_PROJECT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP_PROJECT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP_PROJECT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP_PROJECT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP_PROJECT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP_PROJECT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP_PROJECT] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP_PROJECT] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP_PROJECT]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[role_id] [int] NULL,
	[status_id] [int] NULL,
 CONSTRAINT [PK__Accounts__46A222CDDBBE39FC] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStatus]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStatus](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](max) NULL,
 CONSTRAINT [PK__AccountS__3683B531839DF43D] PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[coupon_id] [int] IDENTITY(1,1) NOT NULL,
	[coupon_code] [nvarchar](50) NULL,
	[discount_amount] [decimal](10, 2) NULL,
	[coupon_start_date] [date] NULL,
	[coupon_end_date] [date] NULL,
	[coupon_status] [nvarchar](50) NULL,
 CONSTRAINT [PK__Coupons__58CF6389247B125E] PRIMARY KEY CLUSTERED 
(
	[coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerCoupon]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCoupon](
	[customer_coupon_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[coupon_id] [int] NULL,
 CONSTRAINT [PK__Customer__8A50B4DB8C43565F] PRIMARY KEY CLUSTERED 
(
	[customer_coupon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](255) NULL,
	[customer_phone] [nvarchar](15) NULL,
	[point] [int] NULL,
	[customer_type_id] [int] NULL,
 CONSTRAINT [PK__Customer__CD65CB8535B377B9] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerTypes]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerTypes](
	[customer_type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](255) NULL,
 CONSTRAINT [PK__Customer__3320C939714E60F1] PRIMARY KEY CLUSTERED 
(
	[customer_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailSettings]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailSettings](
	[email_setting_id] [int] IDENTITY(1,1) NOT NULL,
	[smtp_server] [nvarchar](255) NOT NULL,
	[smtp_port] [int] NOT NULL,
	[encryption_type] [nvarchar](50) NOT NULL,
	[auth_username] [nvarchar](255) NULL,
	[auth_password] [nvarchar](255) NULL,
	[from_email] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email_setting_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplates](
	[template_id] [int] IDENTITY(1,1) NOT NULL,
	[template_name] [nvarchar](255) NOT NULL,
	[subject] [nvarchar](255) NOT NULL,
	[content] [nvarchar](255) NOT NULL,
	[variables] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_name] [nvarchar](255) NULL,
	[employee_phone] [nvarchar](15) NULL,
	[employee_address] [nvarchar](max) NULL,
	[account_id] [int] NULL,
 CONSTRAINT [PK__Employee__C52E0BA878A15DBC] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryPrice]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryPrice](
	[history_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[price] [decimal](10, 2) NULL,
	[price_before] [decimal](10, 2) NULL,
	[updated_at] [datetime] NULL,
	[status] [nvarchar](255) NULL,
 CONSTRAINT [PK__HistoryP__096AA2E9B644F4BF] PRIMARY KEY CLUSTERED 
(
	[history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[inventory_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[current_stock] [int] NULL,
	[inventory_status] [nvarchar](50) NULL,
	[last_restock_date] [datetime] NULL,
	[alert] [nvarchar](50) NULL,
 CONSTRAINT [PK__Inventor__B59ACC49A10C0AD9] PRIMARY KEY CLUSTERED 
(
	[inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryDetails]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryDetails](
	[inventory_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[inventory_id] [int] NULL,
	[received_quantity] [int] NULL,
	[import_date] [datetime] NULL,
	[export_date] [datetime] NULL,
 CONSTRAINT [PK__Inventor__33942D4A042B10A6] PRIMARY KEY CLUSTERED 
(
	[inventory_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[invoice_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[invoice_date] [datetime] NULL,
	[invoice_total_amount] [decimal](10, 2) NULL,
	[invoice_status] [nvarchar](50) NULL,
	[shift_manager_id] [int] NOT NULL,
	[employee_id] [int] NULL,
	[payment_method_id] [int] NOT NULL,
 CONSTRAINT [PK__Invoices__F58DFD495EA1F139] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mailog]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mailog](
	[mailog_id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[mail_subject] [nvarchar](255) NULL,
	[mail_content] [nvarchar](255) NULL,
	[mail_sent_date] [datetime] NULL,
 CONSTRAINT [PK__Mailog__3393531483046800] PRIMARY KEY CLUSTERED 
(
	[mailog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[store_stock_id] [int] NULL,
	[customer_id] [int] NULL,
	[order_date] [datetime] NULL,
	[order_total_amount] [decimal](10, 2) NULL,
	[order_status] [nvarchar](50) NULL CHECK (order_status IN ('paid', 'unpaid')) DEFAULT 'unpaid',
	[customer_coupon_id] [int] NULL,
 CONSTRAINT [PK__Orders__46596229403BE2FE] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[payment_method_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_method_name] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK__PaymentM__8A3EA9EBFB6EE760] PRIMARY KEY CLUSTERED 
(
	[payment_method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Categories]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NULL,
 CONSTRAINT [PK__Product___D54EE9B45014E258] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[barcode] [nvarchar](255) NULL,
	[product_name] [nvarchar](255) NULL,
	[product_price] [decimal](10, 2) NULL,
	[product_weight] [decimal](10, 2) NULL,
	[weight_unit_id] [int] NULL,
	[supplier_id] [int] NULL,
	[product_image] [nvarchar](255) NULL,
 CONSTRAINT [PK__Products__47027DF57F017F60] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportInventory]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportInventory](
	[report_inventory_id] [int] IDENTITY(1,1) NOT NULL,
	[report_date] [datetime] NULL,
	[total_quantity_reported] [int] NULL,
	[report_inventory_detail_id] [int] NULL,
 CONSTRAINT [PK__ReportIn__139C51F47FFC6EF9] PRIMARY KEY CLUSTERED 
(
	[report_inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportInventoryDetails]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportInventoryDetails](
	[report_inventory_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[reported_quantity] [int] NULL,
	[report_date] [datetime] NULL,
	[order_id] [int] NULL,
 CONSTRAINT [PK__ReportIn__39F18DF08D01FAFA] PRIMARY KEY CLUSTERED 
(
	[report_inventory_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportRevenue]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportRevenue](
	[report_revenue_id] [int] IDENTITY(1,1) NOT NULL,
	[report_date] [datetime] NULL,
	[report_revenue_detail_id] [int] NULL,
	[total_revenue] [decimal](10, 2) NULL,
 CONSTRAINT [PK__ReportRe__E12199CFB8AF2C86] PRIMARY KEY CLUSTERED 
(
	[report_revenue_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportRevenueDetails]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportRevenueDetails](
	[report_revenue_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[revenue_amount] [decimal](10, 2) NULL,
	[report_date] [datetime] NULL,
	[invoice_id] [int] NULL,
 CONSTRAINT [PK__ReportRe__C46CC2233294F4BE] PRIMARY KEY CLUSTERED 
(
	[report_revenue_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK__Roles__760965CCB73E985D] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiftManagers]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftManagers](
	[shift_manager_id] [int] IDENTITY(1,1) NOT NULL,
	[shift_start_time] [time](7) NULL,
	[shift_end_time] [time](7) NULL,
	[cash_start] [decimal](10, 2) NULL,
	[cash_end] [decimal](10, 2) NULL,
	[total_revenue] [decimal](10, 2) NULL,
	[total_hours] [decimal](10, 2) NULL,
	[notes] [nvarchar](255) NULL,
	[employee_id] [int] NULL,
 CONSTRAINT [PK__ShiftMan__6D04D7571C9E3BD7] PRIMARY KEY CLUSTERED 
(
	[shift_manager_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopDetails]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopDetails](
	[shop_id] [int] IDENTITY(1,1) NOT NULL,
	[shop_name] [nvarchar](255) NULL,
	[shop_address] [nvarchar](255) NULL,
	[shop_phone] [nvarchar](15) NULL,
	[shop_email] [nvarchar](255) NULL,
	[shop_opening_hours] [nvarchar](100) NULL,
	[shop_logo] [nvarchar](255) NULL,
 CONSTRAINT [PK__ShopDeta__AD0817860C416DF4] PRIMARY KEY CLUSTERED 
(
	[shop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreStock]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreStock](
	[store_stock_id] [int] IDENTITY(1,1) NOT NULL,
	[inventory_id] [int] NULL,
	[quantity_in_stock] [int] NULL,
	[last_stock_check_date] [datetime] NULL,
 CONSTRAINT [PK__StoreSto__88BF60C2B219FD3C] PRIMARY KEY CLUSTERED 
(
	[store_stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[supplier_id] [int] IDENTITY(1,1) NOT NULL,
	[supplier_name] [nvarchar](255) NULL,
	[supplier_address] [nvarchar](255) NULL,
	[supplier_phone] [nvarchar](15) NULL,
	[supplier_email] [nvarchar](255) NULL,
	[supplier_contact_person] [nvarchar](255) NULL,
 CONSTRAINT [PK__Supplier__6EE594E849EDB9E0] PRIMARY KEY CLUSTERED 
(
	[supplier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weight_unit]    Script Date: 10/3/2024 11:27:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weight_unit](
	[weight_unit_id] [int] IDENTITY(1,1) NOT NULL,
	[unit_name] [nvarchar](50) NULL,
 CONSTRAINT [PK__Weight_u__BFDA59EF7097AB48] PRIMARY KEY CLUSTERED 
(
	[weight_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([account_id], [email], [password], [role_id], [status_id]) VALUES (1, N'abc@gmail.com', N'123', 1, 1)
INSERT [dbo].[Accounts] ([account_id], [email], [password], [role_id], [status_id]) VALUES (2, N'staff@gmail.com', N'123456', 2, 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountStatus] ON 

INSERT [dbo].[AccountStatus] ([status_id], [status_name]) VALUES (1, N'ACTIVE')
INSERT [dbo].[AccountStatus] ([status_id], [status_name]) VALUES (2, N'INACTIVE')
SET IDENTITY_INSERT [dbo].[AccountStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([employee_id], [employee_name], [employee_phone], [employee_address], [account_id]) VALUES (2, N'Nguyễn Văn A', N'1234567890', N'Hà Nội', 1)
INSERT [dbo].[Employees] ([employee_id], [employee_name], [employee_phone], [employee_address], [account_id]) VALUES (3, N'Nguyễn Văn B', N'0123456789', N'Hà Nội', 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Categories] ON 

INSERT [dbo].[Product_Categories] ([category_id], [category_name]) VALUES (1, N'Nước giải khát')
INSERT [dbo].[Product_Categories] ([category_id], [category_name]) VALUES (2, N'Thực phẩm khô')
INSERT [dbo].[Product_Categories] ([category_id], [category_name]) VALUES (3, N'Thực phẩm tươi')
INSERT [dbo].[Product_Categories] ([category_id], [category_name]) VALUES (4, N'Đồ hộp')
INSERT [dbo].[Product_Categories] ([category_id], [category_name]) VALUES (5, N'Sản phẩm sữa')
INSERT [dbo].[Product_Categories] ([category_id], [category_name]) VALUES (6, N'Gia vị')
INSERT [dbo].[Product_Categories] ([category_id], [category_name]) VALUES (7, N'Thức ăn nhẹ')
INSERT [dbo].[Product_Categories] ([category_id], [category_name]) VALUES (8, N'Đồ uống có cồn')
INSERT [dbo].[Product_Categories] ([category_id], [category_name]) VALUES (9, N'Thực phẩm đông lạnh')
INSERT [dbo].[Product_Categories] ([category_id], [category_name]) VALUES (10, N'Thực phẩm chức năng')
SET IDENTITY_INSERT [dbo].[Product_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [category_id], [barcode], [product_name], [product_price], [product_weight], [weight_unit_id], [supplier_id], [product_image]) VALUES (1, 1, N'1112223334441', N'Nước ngọt Coca-Cola', CAST(10000.00 AS Decimal(10, 2)), CAST(0.33 AS Decimal(10, 2)), 1, 1, N'coca.jpg')
INSERT [dbo].[Products] ([product_id], [category_id], [barcode], [product_name], [product_price], [product_weight], [weight_unit_id], [supplier_id], [product_image]) VALUES (2, 2, N'1112223334442', N'Nước cam ép Twister', CAST(15000.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), 1, 2, N'twister.jpg')
INSERT [dbo].[Products] ([product_id], [category_id], [barcode], [product_name], [product_price], [product_weight], [weight_unit_id], [supplier_id], [product_image]) VALUES (3, 3, N'1112223334443', N'Trà xanh 0 độ', CAST(12000.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), 1, 1, N'0do.jpg')
INSERT [dbo].[Products] ([product_id], [category_id], [barcode], [product_name], [product_price], [product_weight], [weight_unit_id], [supplier_id], [product_image]) VALUES (4, 4, N'1112223334444', N'Mì gói Hảo Hảo', CAST(4000.00 AS Decimal(10, 2)), CAST(0.08 AS Decimal(10, 2)), 1, 3, N'haohao.jpg')
INSERT [dbo].[Products] ([product_id], [category_id], [barcode], [product_name], [product_price], [product_weight], [weight_unit_id], [supplier_id], [product_image]) VALUES (5, 5, N'1112223334445', N'Gạo tám thơm', CAST(18000.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), 1, 4, N'gaotamthom.jpg')
INSERT [dbo].[Products] ([product_id], [category_id], [barcode], [product_name], [product_price], [product_weight], [weight_unit_id], [supplier_id], [product_image]) VALUES (6, 6, N'1112223334446', N'Rau cải xanh tươi', CAST(20000.00 AS Decimal(10, 2)), CAST(0.50 AS Decimal(10, 2)), 1, 5, N'raucai.jpg')
INSERT [dbo].[Products] ([product_id], [category_id], [barcode], [product_name], [product_price], [product_weight], [weight_unit_id], [supplier_id], [product_image]) VALUES (7, 7, N'1112223334447', N'Cá hộp 3 Cô Gái', CAST(25000.00 AS Decimal(10, 2)), CAST(0.30 AS Decimal(10, 2)), 1, 6, N'cahop.jpg')
INSERT [dbo].[Products] ([product_id], [category_id], [barcode], [product_name], [product_price], [product_weight], [weight_unit_id], [supplier_id], [product_image]) VALUES (8, 8, N'1112223334448', N'Sữa tươi Vinamilk', CAST(12000.00 AS Decimal(10, 2)), CAST(0.18 AS Decimal(10, 2)), 1, 1, N'suatuoi.jpg')
INSERT [dbo].[Products] ([product_id], [category_id], [barcode], [product_name], [product_price], [product_weight], [weight_unit_id], [supplier_id], [product_image]) VALUES (9, 9, N'1112223334449', N'Bánh Oreo', CAST(15000.00 AS Decimal(10, 2)), CAST(0.10 AS Decimal(10, 2)), 1, 7, N'oreo.jpg')
INSERT [dbo].[Products] ([product_id], [category_id], [barcode], [product_name], [product_price], [product_weight], [weight_unit_id], [supplier_id], [product_image]) VALUES (10, 10, N'1112223334450', N'Bia Heineken', CAST(18000.00 AS Decimal(10, 2)), CAST(0.33 AS Decimal(10, 2)), 1, 8, N'heineken.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'Quản Lý')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'Nhân Viên')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([supplier_id], [supplier_name], [supplier_address], [supplier_phone], [supplier_email], [supplier_contact_person]) VALUES (1, N'Công ty TNHH Coca-Cola', N'123 Đường A, Quận 1, TP. HCM', N'0123456789', N'info@coca-cola.com', N'Nguyễn Văn A')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_name], [supplier_address], [supplier_phone], [supplier_email], [supplier_contact_person]) VALUES (2, N'Công ty PepsiCo Việt Nam', N'456 Đường B, Quận 3, TP. HCM', N'0987654321', N'contact@pepsico.com', N'Trần Thị B')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_name], [supplier_address], [supplier_phone], [supplier_email], [supplier_contact_person]) VALUES (3, N'Công ty Acecook Việt Nam', N'789 Đường C, TP. Đà Nẵng', N'0912345678', N'support@acecook.com', N'Phạm Văn C')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_name], [supplier_address], [supplier_phone], [supplier_email], [supplier_contact_person]) VALUES (4, N'Công ty Gạo Việt', N'321 Đường D, TP. Hà Nội', N'0909876543', N'gaoviet@gmail.com', N'Lê Văn D')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_name], [supplier_address], [supplier_phone], [supplier_email], [supplier_contact_person]) VALUES (5, N'Công ty Rau Xanh', N'234 Đường E, TP. Đà Lạt', N'0934567890', N'info@rauxanh.vn', N'Bùi Thị E')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_name], [supplier_address], [supplier_phone], [supplier_email], [supplier_contact_person]) VALUES (6, N'Công ty Thực Phẩm 3 Cô Gái', N'567 Đường F, TP. HCM', N'0967890123', N'support@3cogai.com', N'Đinh Văn F')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_name], [supplier_address], [supplier_phone], [supplier_email], [supplier_contact_person]) VALUES (7, N'Công ty Mondelez Kinh Đô', N'890 Đường G, TP. HCM', N'0945678901', N'info@mondelez.com', N'Phạm Thị G')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_name], [supplier_address], [supplier_phone], [supplier_email], [supplier_contact_person]) VALUES (8, N'Công ty Bia Heineken', N'123 Đường H, TP. HCM', N'0971234567', N'heineken@heineken.com', N'Trần Văn H')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_name], [supplier_address], [supplier_phone], [supplier_email], [supplier_contact_person]) VALUES (9, N'Công ty Vinamilk', N'456 Đường I, TP. HCM', N'0912345679', N'info@vinamilk.com.vn', N'Nguyễn Thị I')
INSERT [dbo].[Suppliers] ([supplier_id], [supplier_name], [supplier_address], [supplier_phone], [supplier_email], [supplier_contact_person]) VALUES (10, N'Công ty Unilever Việt Nam', N'678 Đường K, TP. HCM', N'0923456781', N'support@unilever.com', N'Lê Văn K')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Weight_unit] ON 

INSERT [dbo].[Weight_unit] ([weight_unit_id], [unit_name]) VALUES (1, N'Gói')
INSERT [dbo].[Weight_unit] ([weight_unit_id], [unit_name]) VALUES (2, N'Thùng')
INSERT [dbo].[Weight_unit] ([weight_unit_id], [unit_name]) VALUES (3, N'Hộp')
INSERT [dbo].[Weight_unit] ([weight_unit_id], [unit_name]) VALUES (4, N'Lốc')
INSERT [dbo].[Weight_unit] ([weight_unit_id], [unit_name]) VALUES (5, N'Lon')
INSERT [dbo].[Weight_unit] ([weight_unit_id], [unit_name]) VALUES (6, N'Chai')
INSERT [dbo].[Weight_unit] ([weight_unit_id], [unit_name]) VALUES (7, N'Túi')
INSERT [dbo].[Weight_unit] ([weight_unit_id], [unit_name]) VALUES (8, N'Kg')
INSERT [dbo].[Weight_unit] ([weight_unit_id], [unit_name]) VALUES (9, N'Gram')
INSERT [dbo].[Weight_unit] ([weight_unit_id], [unit_name]) VALUES (10, N'Lít')
SET IDENTITY_INSERT [dbo].[Weight_unit] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__EmailSet__F8D5F6527C37BDED]    Script Date: 10/3/2024 11:27:04 PM ******/
ALTER TABLE [dbo].[EmailSettings] ADD UNIQUE NONCLUSTERED 
(
	[from_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__EmailTem__BB707B4E7697E120]    Script Date: 10/3/2024 11:27:04 PM ******/
ALTER TABLE [dbo].[EmailTemplates] ADD UNIQUE NONCLUSTERED 
(
	[template_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Status] FOREIGN KEY([status_id])
REFERENCES [dbo].[AccountStatus] ([status_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Status]
GO
ALTER TABLE [dbo].[CustomerCoupon]  WITH CHECK ADD  CONSTRAINT [FK__CustomerC__coupo__571DF1D5] FOREIGN KEY([coupon_id])
REFERENCES [dbo].[Coupons] ([coupon_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CustomerCoupon] CHECK CONSTRAINT [FK__CustomerC__coupo__571DF1D5]
GO
ALTER TABLE [dbo].[CustomerCoupon]  WITH CHECK ADD  CONSTRAINT [FK__CustomerC__custo__5629CD9C] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CustomerCoupon] CHECK CONSTRAINT [FK__CustomerC__custo__5629CD9C]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK__Customers__custo__5165187F] FOREIGN KEY([customer_type_id])
REFERENCES [dbo].[CustomerTypes] ([customer_type_id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK__Customers__custo__5165187F]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK__Employees__accou__6383C8BA] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK__Employees__accou__6383C8BA]
GO
ALTER TABLE [dbo].[HistoryPrice]  WITH CHECK ADD  CONSTRAINT [FK__HistoryPr__produ__440B1D61] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HistoryPrice] CHECK CONSTRAINT [FK__HistoryPr__produ__440B1D61]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK__Inventory__produ__46E78A0C] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK__Inventory__produ__46E78A0C]
GO
ALTER TABLE [dbo].[InventoryDetails]  WITH CHECK ADD  CONSTRAINT [FK__Inventory__inven__49C3F6B7] FOREIGN KEY([inventory_id])
REFERENCES [dbo].[Inventory] ([inventory_id])
GO
ALTER TABLE [dbo].[InventoryDetails] CHECK CONSTRAINT [FK__Inventory__inven__49C3F6B7]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK__Invoices__employ__6C190EBB] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK__Invoices__employ__6C190EBB]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK__Invoices__order___6B24EA82] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK__Invoices__order___6B24EA82]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK__Invoices__paymen__6D0D32F4] FOREIGN KEY([payment_method_id])
REFERENCES [dbo].[PaymentMethod] ([payment_method_id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK__Invoices__paymen__6D0D32F4]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK__Invoices__shift___6E01572D] FOREIGN KEY([shift_manager_id])
REFERENCES [dbo].[ShiftManagers] ([shift_manager_id])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK__Invoices__shift___6E01572D]
GO
ALTER TABLE [dbo].[Mailog]  WITH CHECK ADD  CONSTRAINT [FK__Mailog__employee__70DDC3D8] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
GO
ALTER TABLE [dbo].[Mailog] CHECK CONSTRAINT [FK__Mailog__employee__70DDC3D8]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__customer__5AEE82B9] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__customer__5AEE82B9]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__customer__5BE2A6F2] FOREIGN KEY([customer_coupon_id])
REFERENCES [dbo].[CustomerCoupon] ([customer_coupon_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__customer__5BE2A6F2]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__store_st__59FA5E80] FOREIGN KEY([store_stock_id])
REFERENCES [dbo].[StoreStock] ([store_stock_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__store_st__59FA5E80]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__catego__3F466844] FOREIGN KEY([category_id])
REFERENCES [dbo].[Product_Categories] ([category_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__catego__3F466844]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__suppli__412EB0B6] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([supplier_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__suppli__412EB0B6]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__weight__403A8C7D] FOREIGN KEY([weight_unit_id])
REFERENCES [dbo].[Weight_unit] ([weight_unit_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__weight__403A8C7D]
GO
ALTER TABLE [dbo].[ReportInventory]  WITH CHECK ADD  CONSTRAINT [FK__ReportInv__repor__76969D2E] FOREIGN KEY([report_inventory_detail_id])
REFERENCES [dbo].[ReportInventoryDetails] ([report_inventory_detail_id])
GO
ALTER TABLE [dbo].[ReportInventory] CHECK CONSTRAINT [FK__ReportInv__repor__76969D2E]
GO
ALTER TABLE [dbo].[ReportInventoryDetails]  WITH CHECK ADD  CONSTRAINT [FK__ReportInv__order__73BA3083] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[ReportInventoryDetails] CHECK CONSTRAINT [FK__ReportInv__order__73BA3083]
GO
ALTER TABLE [dbo].[ReportRevenue]  WITH CHECK ADD  CONSTRAINT [FK__ReportRev__repor__7C4F7684] FOREIGN KEY([report_revenue_detail_id])
REFERENCES [dbo].[ReportRevenueDetails] ([report_revenue_detail_id])
GO
ALTER TABLE [dbo].[ReportRevenue] CHECK CONSTRAINT [FK__ReportRev__repor__7C4F7684]
GO
ALTER TABLE [dbo].[ReportRevenueDetails]  WITH CHECK ADD  CONSTRAINT [FK__ReportRev__invoi__797309D9] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[Invoices] ([invoice_id])
GO
ALTER TABLE [dbo].[ReportRevenueDetails] CHECK CONSTRAINT [FK__ReportRev__invoi__797309D9]
GO
ALTER TABLE [dbo].[ShiftManagers]  WITH CHECK ADD  CONSTRAINT [FK__ShiftMana__emplo__68487DD7] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([employee_id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ShiftManagers] CHECK CONSTRAINT [FK__ShiftMana__emplo__68487DD7]
GO
ALTER TABLE [dbo].[StoreStock]  WITH CHECK ADD  CONSTRAINT [FK__StoreStoc__inven__4CA06362] FOREIGN KEY([inventory_id])
REFERENCES [dbo].[Inventory] ([inventory_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreStock] CHECK CONSTRAINT [FK__StoreStoc__inven__4CA06362]
GO
USE [master]
GO
ALTER DATABASE [SWP_PROJECT] SET  READ_WRITE 
GO
