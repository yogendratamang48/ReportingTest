USE [ShangrilaReports]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 1/22/2017 5:10:22 PM ******/
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
/****** Object:  Table [dbo].[Home]    Script Date: 1/22/2017 5:10:22 PM ******/
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
/****** Object:  Table [dbo].[Land]    Script Date: 1/22/2017 5:10:22 PM ******/
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
/****** Object:  Table [dbo].[Property]    Script Date: 1/22/2017 5:10:22 PM ******/
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

GO
INSERT [dbo].[Application] ([ApplicationId], [ApplicantName], [Accepters]) VALUES (1, N'Yogendra Tamang', N'Prabhu Finance')
GO
SET IDENTITY_INSERT [dbo].[Application] OFF
GO
SET IDENTITY_INSERT [dbo].[Home] ON 

GO
INSERT [dbo].[Home] ([HomeID], [Address], [Storied], [Area], [NakshapasDate], [NirmanSampannaDate], [Remarks], [Notes]) VALUES (1, N'Pokhara', N'3', N'3', N'45', N'45', N'45', N'45')
GO
SET IDENTITY_INSERT [dbo].[Home] OFF
GO
SET IDENTITY_INSERT [dbo].[Land] ON 

GO
INSERT [dbo].[Land] ([LandId], [District], [MunicipalityOrVdc], [WardNumber], [SheetNumber], [KittaNumber], [Area], [Type], [Note]) VALUES (1, N'Kaski', N'Lekhnath', 5, N'5', N'5', N'5', N'5', N'5')
GO
SET IDENTITY_INSERT [dbo].[Land] OFF
GO
SET IDENTITY_INSERT [dbo].[Property] ON 

GO
INSERT [dbo].[Property] ([PropertyID], [Owner], [FatherName], [GrandFatherName], [Address], [RelationWithLoanSeeker], [IsOrganized], [RegistrationNumber], [RegisteredDate], [AuthorizedPerson], [RegisteredAt], [PAN]) VALUES (1, N'Yogendra Tamang', N'Dil Bahadur Tamang', N'Chhring Tamang', N'Pokhara', N'Father and Son', 0, N'123456', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Property] OFF
GO
