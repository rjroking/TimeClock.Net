USE [timeclock]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[PayPeriodSeed] [datetime] NOT NULL,
	[PayPeriodInterval] [int] NOT NULL,
	[Company_CompanyID] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Terminated] [bit] NOT NULL,
	[Pin] [nvarchar](max) NULL,
	[DepartmentID] [int] NOT NULL,
	[ManagerID] [nvarchar](max) NULL,
	[Manager_EmployeeID] [nvarchar](128) NULL,
	[Message_MessageID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageViewed]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageViewed](
	[EmployeeID] [int] NOT NULL,
	[MessageID] [int] NOT NULL,
	[DateViewed] [datetime] NOT NULL,
	[Employee_EmployeeID] [nvarchar](128) NULL,
 CONSTRAINT [PK_MessageViewed] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NULL,
	[ManagerID] [nvarchar](max) NULL,
	[Manager_EmployeeID] [nvarchar](128) NULL,
	[Employee_EmployeeID] [nvarchar](128) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timecard]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timecard](
	[TimecardID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PayPeriod] [datetime] NOT NULL,
	[Employee_EmployeeID] [nvarchar](128) NULL,
 CONSTRAINT [PK_Timecard] PRIMARY KEY CLUSTERED 
(
	[TimecardID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PunchType]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PunchType](
	[PunchTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[PunchInOption] [nvarchar](max) NULL,
 CONSTRAINT [PK_PunchType] PRIMARY KEY CLUSTERED 
(
	[PunchTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayType]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayType](
	[PayTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DailyMax] [int] NOT NULL,
	[WeeklyMax] [int] NOT NULL,
	[NextPayType_PayTypeID] [int] NULL,
 CONSTRAINT [PK_PayType] PRIMARY KEY CLUSTERED 
(
	[PayTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Punch]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Punch](
	[PunchID] [int] IDENTITY(1,1) NOT NULL,
	[InTime] [datetime] NOT NULL,
	[OutTime] [datetime] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[EmployeeID] [nvarchar](128) NULL,
	[PunchTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Punch] PRIMARY KEY CLUSTERED 
(
	[PunchID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Line]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Line](
	[LineID] [int] IDENTITY(1,1) NOT NULL,
	[PunchID] [int] NOT NULL,
	[TimecardID] [int] NOT NULL,
	[PayTypeID] [int] NOT NULL,
	[SplitStart] [datetime] NOT NULL,
	[SplitEnd] [datetime] NOT NULL,
 CONSTRAINT [PK_Line] PRIMARY KEY CLUSTERED 
(
	[LineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday](
	[HolidayID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Repeats] [int] NOT NULL,
 CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED 
(
	[HolidayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HolidayDepartment]    Script Date: 05/07/2012 23:19:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HolidayDepartment](
	[Holiday_HolidayID] [int] NOT NULL,
	[Department_DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_HolidayDepartment] PRIMARY KEY CLUSTERED 
(
	[Holiday_HolidayID] ASC,
	[Department_DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Department_Company_Company_CompanyID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Company_Company_CompanyID] FOREIGN KEY([Company_CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Company_Company_CompanyID]
GO
/****** Object:  ForeignKey [FK_Employee_Department_DepartmentID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department_DepartmentID]
GO
/****** Object:  ForeignKey [FK_Employee_Employee_Manager_EmployeeID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee_Manager_EmployeeID] FOREIGN KEY([Manager_EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee_Manager_EmployeeID]
GO
/****** Object:  ForeignKey [FK_Employee_Message_Message_MessageID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Message_Message_MessageID] FOREIGN KEY([Message_MessageID])
REFERENCES [dbo].[Message] ([MessageID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Message_Message_MessageID]
GO
/****** Object:  ForeignKey [FK_HolidayDepartment_Department_Department_DepartmentID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[HolidayDepartment]  WITH CHECK ADD  CONSTRAINT [FK_HolidayDepartment_Department_Department_DepartmentID] FOREIGN KEY([Department_DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HolidayDepartment] CHECK CONSTRAINT [FK_HolidayDepartment_Department_Department_DepartmentID]
GO
/****** Object:  ForeignKey [FK_HolidayDepartment_Holiday_Holiday_HolidayID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[HolidayDepartment]  WITH CHECK ADD  CONSTRAINT [FK_HolidayDepartment_Holiday_Holiday_HolidayID] FOREIGN KEY([Holiday_HolidayID])
REFERENCES [dbo].[Holiday] ([HolidayID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HolidayDepartment] CHECK CONSTRAINT [FK_HolidayDepartment_Holiday_Holiday_HolidayID]
GO
/****** Object:  ForeignKey [FK_Line_PayType_PayTypeID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Line]  WITH CHECK ADD  CONSTRAINT [FK_Line_PayType_PayTypeID] FOREIGN KEY([PayTypeID])
REFERENCES [dbo].[PayType] ([PayTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Line] CHECK CONSTRAINT [FK_Line_PayType_PayTypeID]
GO
/****** Object:  ForeignKey [FK_Line_Punch_PunchID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Line]  WITH CHECK ADD  CONSTRAINT [FK_Line_Punch_PunchID] FOREIGN KEY([PunchID])
REFERENCES [dbo].[Punch] ([PunchID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Line] CHECK CONSTRAINT [FK_Line_Punch_PunchID]
GO
/****** Object:  ForeignKey [FK_Line_Timecard_TimecardID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Line]  WITH CHECK ADD  CONSTRAINT [FK_Line_Timecard_TimecardID] FOREIGN KEY([TimecardID])
REFERENCES [dbo].[Timecard] ([TimecardID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Line] CHECK CONSTRAINT [FK_Line_Timecard_TimecardID]
GO
/****** Object:  ForeignKey [FK_Message_Employee_Employee_EmployeeID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Employee_Employee_EmployeeID] FOREIGN KEY([Employee_EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Employee_Employee_EmployeeID]
GO
/****** Object:  ForeignKey [FK_Message_Employee_Manager_EmployeeID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Employee_Manager_EmployeeID] FOREIGN KEY([Manager_EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Employee_Manager_EmployeeID]
GO
/****** Object:  ForeignKey [FK_MessageViewed_Employee_Employee_EmployeeID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[MessageViewed]  WITH CHECK ADD  CONSTRAINT [FK_MessageViewed_Employee_Employee_EmployeeID] FOREIGN KEY([Employee_EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[MessageViewed] CHECK CONSTRAINT [FK_MessageViewed_Employee_Employee_EmployeeID]
GO
/****** Object:  ForeignKey [FK_PayType_PayType_NextPayType_PayTypeID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[PayType]  WITH CHECK ADD  CONSTRAINT [FK_PayType_PayType_NextPayType_PayTypeID] FOREIGN KEY([NextPayType_PayTypeID])
REFERENCES [dbo].[PayType] ([PayTypeID])
GO
ALTER TABLE [dbo].[PayType] CHECK CONSTRAINT [FK_PayType_PayType_NextPayType_PayTypeID]
GO
/****** Object:  ForeignKey [FK_Punch_Department_DepartmentID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Punch]  WITH CHECK ADD  CONSTRAINT [FK_Punch_Department_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Punch] CHECK CONSTRAINT [FK_Punch_Department_DepartmentID]
GO
/****** Object:  ForeignKey [FK_Punch_Employee_EmployeeID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Punch]  WITH CHECK ADD  CONSTRAINT [FK_Punch_Employee_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Punch] CHECK CONSTRAINT [FK_Punch_Employee_EmployeeID]
GO
/****** Object:  ForeignKey [FK_Punch_PunchType_PunchTypeID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Punch]  WITH CHECK ADD  CONSTRAINT [FK_Punch_PunchType_PunchTypeID] FOREIGN KEY([PunchTypeID])
REFERENCES [dbo].[PunchType] ([PunchTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Punch] CHECK CONSTRAINT [FK_Punch_PunchType_PunchTypeID]
GO
/****** Object:  ForeignKey [FK_Timecard_Employee_Employee_EmployeeID]    Script Date: 05/07/2012 23:19:42 ******/
ALTER TABLE [dbo].[Timecard]  WITH CHECK ADD  CONSTRAINT [FK_Timecard_Employee_Employee_EmployeeID] FOREIGN KEY([Employee_EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Timecard] CHECK CONSTRAINT [FK_Timecard_Employee_Employee_EmployeeID]
GO
