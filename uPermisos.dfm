object DM: TDM
  OldCreateOrder = False
  Height = 370
  Width = 611
  object SQLConnect: TMSConnection
    Database = 'InnovikaCom'
    Username = 'sa'
    Password = 'Inn0v1k4'
    Server = '192.168.65.7'
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object qGetUserId: TMSQuery
    Connection = SQLConnect
    SQL.Strings = (
      
        'Select UserId, NombreCompleto From Users Where ClienteERP = :cli' +
        'ente;')
    Left = 216
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptInput
      end>
    object qGetUserIdUserId: TIntegerField
      FieldName = 'UserId'
      ReadOnly = True
    end
    object qGetUserIdNombreCompleto: TStringField
      FieldName = 'NombreCompleto'
      Size = 200
    end
  end
  object qGetOportunidades: TMSQuery
    Connection = SQLConnect
    SQL.Strings = (
      
        'Select Op.*, Ac.Nombre from Oportunidades Op LEFT JOIN ArtColore' +
        's Ac ON Op.ColorAbierto = Ac.Codigo Where Op.Usuario = :usuario ' +
        'ORDER BY Op.Caducidad DESC;')
    Left = 88
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'usuario'
        ParamType = ptInput
      end>
    object qGetOportunidadesIdOportunidad: TLargeintField
      FieldName = 'IdOportunidad'
      ReadOnly = True
      Visible = False
    end
    object qGetOportunidadesUsuario: TIntegerField
      FieldName = 'Usuario'
      Visible = False
    end
    object qGetOportunidadesCaducidad: TDateTimeField
      FieldName = 'Caducidad'
    end
    object qGetOportunidadesLineaAbierta: TWideStringField
      DisplayLabel = 'Linea'
      FieldName = 'LineaAbierta'
      Size = 10
    end
    object qGetOportunidadesBaseAbierta: TStringField
      DisplayLabel = 'Base'
      FieldName = 'BaseAbierta'
      FixedChar = True
      Size = 2
    end
    object qGetOportunidadesNombre: TWideStringField
      DisplayLabel = 'Color'
      FieldName = 'Nombre'
      ReadOnly = True
      Size = 50
    end
    object qGetOportunidadesCubrecantoAbierto: TStringField
      DisplayLabel = 'Cubrecanto'
      FieldName = 'CubrecantoAbierto'
      FixedChar = True
      Size = 2
    end
    object qGetOportunidadesJaladeraAbierta: TStringField
      DisplayLabel = 'Jaladera'
      FieldName = 'JaladeraAbierta'
      FixedChar = True
      Size = 2
    end
    object qGetOportunidadesColorAbierto: TStringField
      FieldName = 'ColorAbierto'
      Visible = False
      FixedChar = True
      Size = 2
    end
  end
  object DSGetOportunidades: TMSDataSource
    DataSet = qGetOportunidades
    Left = 128
    Top = 80
  end
  object qGetArt_x_: TMSQuery
    Connection = SQLConnect
    Left = 72
    Top = 144
  end
  object DSGetArt_x_: TMSDataSource
    DataSet = qGetArt_x_
    Left = 112
    Top = 168
  end
  object qUpdateOportunidades: TMSQuery
    Connection = SQLConnect
    Left = 320
    Top = 56
  end
end
