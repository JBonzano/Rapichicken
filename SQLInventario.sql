USE [rapichicken]
GO

/****** Object:  Table [dbo].[Inventario]    Script Date: 5/10/2022 01:01:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create TABLE [dbo].[Inventario](
	[Inventario_id] [int] IDENTITY(1,1) NOT NULL,
	[n_producto] [varchar](250) NOT NULL,
	[descripcion] [varchar](500) NULL,
	[tipo_producto] [varchar](50) NOT NULL,
	[estado_producto] [varchar](50) NOT NULL,
	[stock] [int] NOT NULL,
	[detalle_unidad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[Inventario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Pedidos]    Script Date: 6/10/2022 17:59:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pedidos](
	[Pedidos_id] [int] IDENTITY(1,1) NOT NULL,
	[N_Pedido] [varchar](250) NOT NULL,
	[D_Pedido] [varchar](500) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[NP_C] [varchar](50) NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[Pedidos_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****sp****/
create procedure sp_ListarInventario
as
begin
	select * from Inventario
end
go

create procedure sp_ListarNInventario(
@NombreP varchar(250)
)
as
begin
	select * from Inventario where @NombreP=n_producto
end
go

create procedure sp_GuardarInventario(
@NombreP varchar(250),
@I_D varchar(500),
@T_P varchar(50),
@E_P varchar(50),
@I_Stock int,
@I_D_Unidad varchar(50)
)
as
begin
	insert into Inventario(n_producto,descripcion,tipo_producto,estado_producto,stock,detalle_unidad) 
	values(@NombreP,@I_D,@T_P,@E_P,@I_Stock,@I_D_Unidad)
end
go

use rapichicken 
go
create procedure sp_EditarInventario(
@I_Id int,
@NombreP varchar(250),
@I_D varchar(500),
@T_P varchar(50),
@E_P varchar(50),
@I_Stock int,
@I_D_Unidad varchar(50)
)
as
begin
	update Inventario set n_producto = @NombreP,descripcion = @I_D,tipo_producto = @T_P,
	estado_producto = @E_P,stock = @I_Stock,detalle_unidad = @I_D_Unidad 
	where Inventario_id = @I_Id
end
go

create procedure sp_EliminarInventario(@I_Id int)
as
begin
	delete from Inventario where Inventario_id = @I_Id
end
go

create procedure sp_ObtenerIdInventario(
@I_ID int
)
as
begin
	select * from Inventario where @I_ID=Inventario_id
end
go
