CREATE TABLE [dbo].[Robot](
	[Id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[photo] [varbinary](max) NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tache]    Script Date: 4/7/2020 11:05:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tache](
	[code] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[duree] [float] NOT NULL,
	[etat] [nvarchar](50) NULL,
	[description] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TachesRobots]    Script Date: 4/7/2020 11:05:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TachesRobots](
	[IdRobot] [int] NOT NULL,
	[CodeTask] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRobot] ASC,
	[CodeTask] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 4/7/2020 11:05:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[code] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[duree] [float] NOT NULL,
	[etat] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK__tache__357D4CF8AAF1D19F] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TachesRobots]  WITH CHECK ADD  CONSTRAINT [FK_TachesRobot_ToRobot] FOREIGN KEY([IdRobot])
REFERENCES [dbo].[Robot] ([Id])
GO
ALTER TABLE [dbo].[TachesRobots] CHECK CONSTRAINT [FK_TachesRobot_ToRobot]
GO
ALTER TABLE [dbo].[TachesRobots]  WITH CHECK ADD  CONSTRAINT [FK_TachesRobot_ToTache] FOREIGN KEY([CodeTask])
REFERENCES [dbo].[Task] ([code])
GO
ALTER TABLE [dbo].[TachesRobots] CHECK CONSTRAINT [FK_TachesRobot_ToTache]
GO
ALTER TABLE [dbo].[Robot]  WITH CHECK ADD  CONSTRAINT [status_check] CHECK  (([status]='other' OR [status]='running' OR [status]='waiting'))
GO
ALTER TABLE [dbo].[Robot] CHECK CONSTRAINT [status_check]
GO