USE [ShangrilaReports]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 1/26/2017 4:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicantName] [nvarchar](200) NULL,
	[Accepters] [nvarchar](200) NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BankAccountInfo]    Script Date: 1/26/2017 4:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccountInfo](
	[BankAccountInfoID] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [nvarchar](200) NULL,
	[AccountNumber] [nvarchar](200) NULL,
	[TypeOfAccount] [nvarchar](200) NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_BankAccountInfo] PRIMARY KEY CLUSTERED 
(
	[BankAccountInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Home]    Script Date: 1/26/2017 4:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Home](
	[HomeID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Storied] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[NakshapasDate] [nvarchar](50) NULL,
	[NirmanSampannaDate] [nvarchar](50) NULL,
	[Remarks] [nvarchar](50) NULL,
	[Notes] [nvarchar](50) NULL,
 CONSTRAINT [PK_Home] PRIMARY KEY CLUSTERED 
(
	[HomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Land]    Script Date: 1/26/2017 4:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Land](
	[LandId] [int] IDENTITY(1,1) NOT NULL,
	[District] [nvarchar](50) NULL,
	[MunicipalityOrVdc] [nvarchar](200) NULL,
	[WardNumber] [int] NULL,
	[SheetNumber] [nvarchar](50) NULL,
	[KittaNumber] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Note] [nvarchar](50) NULL,
 CONSTRAINT [PK_Land] PRIMARY KEY CLUSTERED 
(
	[LandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LastPagePara]    Script Date: 1/26/2017 4:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LastPagePara](
	[LastPageParaID] [int] IDENTITY(1,1) NOT NULL,
	[FirstPara] [nvarchar](2000) NULL,
	[SecondPara] [nvarchar](2000) NULL,
	[FormType] [nvarchar](50) NULL,
 CONSTRAINT [PK_LastPagePara] PRIMARY KEY CLUSTERED 
(
	[LastPageParaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoanBasedOnFund]    Script Date: 1/26/2017 4:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanBasedOnFund](
	[LoanBasedonFundID] [int] IDENTITY(1,1) NOT NULL,
	[ResidentialLoan] [decimal](18, 2) NULL,
	[RealStateLoan] [decimal](18, 2) NULL,
	[PersonalLoan] [decimal](18, 2) NULL,
	[ShareDepositLoan] [decimal](18, 2) NULL,
	[ESFULoan] [decimal](18, 2) NULL,
	[PoorAgriLoan] [decimal](18, 2) NULL,
	[VehicleloanWheels] [nchar](10) NULL,
	[VehicleLoan] [decimal](18, 2) NULL,
	[RentVehicleType] [nvarchar](50) NULL,
	[RentVehicleLoan] [decimal](18, 2) NULL,
	[OtherOneLoan] [decimal](18, 2) NULL,
	[OtherTwoLoan] [decimal](18, 2) NULL,
 CONSTRAINT [PK_LoanBasedOnFund] PRIMARY KEY CLUSTERED 
(
	[LoanBasedonFundID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoanBasedOnNonFund]    Script Date: 1/26/2017 4:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanBasedOnNonFund](
	[NonFundID] [int] IDENTITY(1,1) NOT NULL,
	[NonFundItem] [nvarchar](200) NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_LoanBasedOnNonFund] PRIMARY KEY CLUSTERED 
(
	[NonFundID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Objective]    Script Date: 1/26/2017 4:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objective](
	[LoanObjectiveID] [int] IDENTITY(1,1) NOT NULL,
	[LoanObjective] [nvarchar](200) NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_Objective] PRIMARY KEY CLUSTERED 
(
	[LoanObjectiveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectInvestment]    Script Date: 1/26/2017 4:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectInvestment](
	[ProjectInvestmentID] [int] IDENTITY(1,1) NOT NULL,
	[TotalInverstment] [decimal](18, 2) NULL,
	[ApplicantInvestment] [decimal](18, 2) NULL,
	[LoanInvestment] [decimal](18, 2) NULL,
	[LoanPercentage] [decimal](18, 2) NULL,
	[Notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_ProjectInvestment] PRIMARY KEY CLUSTERED 
(
	[ProjectInvestmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property]    Script Date: 1/26/2017 4:33:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[PropertyID] [int] IDENTITY(1,1) NOT NULL,
	[Owner] [nvarchar](200) NULL,
	[FatherName] [nvarchar](200) NULL,
	[GrandFatherName] [nvarchar](200) NULL,
	[Address] [nvarchar](200) NULL,
	[RelationWithLoanSeeker] [nvarchar](50) NULL,
	[IsOrganized] [bit] NULL,
	[RegistrationNumber] [nvarchar](50) NULL,
	[RegisteredDate] [date] NULL,
	[AuthorizedPerson] [nvarchar](200) NULL,
	[RegisteredAt] [nvarchar](200) NULL,
	[PAN] [nvarchar](30) NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Application] ON 

INSERT [dbo].[Application] ([ApplicationId], [ApplicantName], [Accepters]) VALUES (1, N'Yogendra Tamang', N'Prabhu Finance')
SET IDENTITY_INSERT [dbo].[Application] OFF
SET IDENTITY_INSERT [dbo].[BankAccountInfo] ON 

INSERT [dbo].[BankAccountInfo] ([BankAccountInfoID], [BankName], [AccountNumber], [TypeOfAccount], [Amount]) VALUES (1, N'सिद्धार्थ बैंक लिमिटेड, पाटन', N'123456', N'सेभिङ', CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[BankAccountInfo] ([BankAccountInfoID], [BankName], [AccountNumber], [TypeOfAccount], [Amount]) VALUES (2, N'साँग्रिला बैंक', N'512364', N'चल्ती', CAST(80000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[BankAccountInfo] OFF
SET IDENTITY_INSERT [dbo].[Home] ON 

INSERT [dbo].[Home] ([HomeID], [Address], [Storied], [Area], [NakshapasDate], [NirmanSampannaDate], [Remarks], [Notes]) VALUES (1, N'Pokhara', N'3', N'3', N'2071-09-08', N'2072-09-08', N'45', N'45')
INSERT [dbo].[Home] ([HomeID], [Address], [Storied], [Area], [NakshapasDate], [NirmanSampannaDate], [Remarks], [Notes]) VALUES (2, N'Kathmandu', N'4', N'6', N'2070-12-3', N'2072-08-08', N'At Chawahil', N'For Rent')
INSERT [dbo].[Home] ([HomeID], [Address], [Storied], [Area], [NakshapasDate], [NirmanSampannaDate], [Remarks], [Notes]) VALUES (3, N'Butawal', N'5', N'5', N'2068-12-04', N'2070-09-01', N'Near Buspark', NULL)
SET IDENTITY_INSERT [dbo].[Home] OFF
SET IDENTITY_INSERT [dbo].[Land] ON 

INSERT [dbo].[Land] ([LandId], [District], [MunicipalityOrVdc], [WardNumber], [SheetNumber], [KittaNumber], [Area], [Type], [Note]) VALUES (1, N'Kaski', N'Lekhnath', 5, N'5', N'5', N'5', N'5', N'5')
SET IDENTITY_INSERT [dbo].[Land] OFF
SET IDENTITY_INSERT [dbo].[LastPagePara] ON 

INSERT [dbo].[LastPagePara] ([LastPageParaID], [FirstPara], [SecondPara], [FormType]) VALUES (1, N'म/हामीलाई, नेपाल राष्ट्र बैंकद्वारा बैंक/वित्तीय संस्थाहरुलाई जारी गरिएको कर्जा सूचना तथा कालो सूची व्यवस्था सम्बन्धमा पूर्ण जानकारी छ । हालको सो व्यवस्था र त्यसमा हुने संशोधन अनुसार म/हामीलाई कारवाही गर्नुपर्ने अवस्था आउनेछैन । बैंक/वित्तीय संस्थाको नियम तथा शर्तहरुको पालना नगरेमा र लिएको कर्जा तोकिएको कार्यमा खर्च नगरेमा वा तिर्नुपर्ने साँवा, ब्याज, हर्जना, बीमा प्रिमियम र अन्य शुल्क समयमा नतिरे नबुझाएमा वा बेइमानी गरेमा बैंक/वित्तीय संस्थाको नियम तथा प्रचलित कानुन बमोजिम मेरो/हाम्रो चल अचल जायजेथाबाट समेत असुल उपर गरी लिएमा म/हामीलाई मञ्जुर छ पछि कुनै कुराको उजुर बाजुर गर्ने छैन । यस सम्बन्धमा बेकले सूचना दिई वा नदिई हाल भैरहेको नियम/शर्त/ब्याज दर/अन्य शुल्क तथा हर्जानामा गरिने संशोधन समेत म/हामीलाई मान्य हुनेछ ।', N'माथि उल्लेखित म/हामीले दिएको जानकारी हरेक दृष्टिकोणले ठीक साँचो हो । सांग्रिला डेभलपमेन्ट बैंक लाई उचित लागेको आवश्यक विवरण अन्य कुनै स्रोतबाट प्राप्त गर्न सक्ने अधिकार दिईएको छ । मेरो हाम्रो उपलब्ध विवरण झुठा ठहरेमा बैंकको नियम तथा प्रचलित कानुन बमोजिम बैंकले कारवाही गर्न सक्नेछ । म/हामीलाई माथि उल्लेख गरे बमोजिमको कर्जा स्वीकृत गरी पाउन सविनय अनुरोध गर्दछु /गर्दछौं । 
', NULL)
SET IDENTITY_INSERT [dbo].[LastPagePara] OFF
SET IDENTITY_INSERT [dbo].[LoanBasedOnFund] ON 

INSERT [dbo].[LoanBasedOnFund] ([LoanBasedonFundID], [ResidentialLoan], [RealStateLoan], [PersonalLoan], [ShareDepositLoan], [ESFULoan], [PoorAgriLoan], [VehicleloanWheels], [VehicleLoan], [RentVehicleType], [RentVehicleLoan], [OtherOneLoan], [OtherTwoLoan]) VALUES (1, CAST(23000.00 AS Decimal(18, 2)), CAST(45000.00 AS Decimal(18, 2)), CAST(45000.00 AS Decimal(18, 2)), CAST(45466.00 AS Decimal(18, 2)), CAST(12340.00 AS Decimal(18, 2)), CAST(12345.00 AS Decimal(18, 2)), N'4         ', CAST(45000.00 AS Decimal(18, 2)), N'MotorBike ', CAST(5600.00 AS Decimal(18, 2)), CAST(122345.00 AS Decimal(18, 2)), CAST(12345.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[LoanBasedOnFund] OFF
SET IDENTITY_INSERT [dbo].[LoanBasedOnNonFund] ON 

INSERT [dbo].[LoanBasedOnNonFund] ([NonFundID], [NonFundItem], [Amount]) VALUES (1, N'आँखाको बीमा गरेको', CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[LoanBasedOnNonFund] ([NonFundID], [NonFundItem], [Amount]) VALUES (2, N'अस्पतालमा गएको खबर', CAST(400000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[LoanBasedOnNonFund] OFF
SET IDENTITY_INSERT [dbo].[Objective] ON 

INSERT [dbo].[Objective] ([LoanObjectiveID], [LoanObjective], [Notes]) VALUES (1, N'भाईको शिक्षाका लागि', NULL)
INSERT [dbo].[Objective] ([LoanObjectiveID], [LoanObjective], [Notes]) VALUES (2, N'बहिनीको बिहेका लागि', NULL)
INSERT [dbo].[Objective] ([LoanObjectiveID], [LoanObjective], [Notes]) VALUES (3, N'विदेश जानका लागि', NULL)
INSERT [dbo].[Objective] ([LoanObjectiveID], [LoanObjective], [Notes]) VALUES (4, N'घर बनाउनका लागि', NULL)
SET IDENTITY_INSERT [dbo].[Objective] OFF
SET IDENTITY_INSERT [dbo].[ProjectInvestment] ON 

INSERT [dbo].[ProjectInvestment] ([ProjectInvestmentID], [TotalInverstment], [ApplicantInvestment], [LoanInvestment], [LoanPercentage], [Notes]) VALUES (1, CAST(1000000.00 AS Decimal(18, 2)), CAST(600000.00 AS Decimal(18, 2)), CAST(400000.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[ProjectInvestment] OFF
SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([PropertyID], [Owner], [FatherName], [GrandFatherName], [Address], [RelationWithLoanSeeker], [IsOrganized], [RegistrationNumber], [RegisteredDate], [AuthorizedPerson], [RegisteredAt], [PAN]) VALUES (1, N'Yogendra Tamang', N'Dil Bahadur Tamang', N'Chhring Tamang', N'Pokhara', N'Father and Son', 0, N'123456', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Property] OFF
