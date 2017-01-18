object formMain: TformMain
  Left = 0
  Top = 0
  Caption = 'Permisos Temporales'
  ClientHeight = 402
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  DesignSize = (
    689
    402)
  PixelsPerInch = 96
  TextHeight = 13
  object tSearch: TLabel
    Left = 232
    Top = 27
    Width = 3
    Height = 13
  end
  object txtUser: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnKeyPress = txtUserKeyPress
  end
  object btnSearch: TButton
    Left = 135
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnSearchClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 673
    Height = 299
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.DSGetOportunidades
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object btnNew: TButton
    Left = 8
    Top = 371
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Nuevo'
    TabOrder = 3
    OnClick = btnNewClick
    ExplicitTop = 410
  end
  object btnDelete: TButton
    Left = 89
    Top = 371
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Borrar'
    TabOrder = 4
    OnClick = btnDeleteClick
    ExplicitTop = 410
  end
  object btnEdit: TButton
    Left = 170
    Top = 371
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Editar'
    TabOrder = 5
    Visible = False
    OnClick = btnEditClick
    ExplicitTop = 410
  end
  object btnClose: TButton
    Left = 607
    Top = 371
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cerrar'
    TabOrder = 6
    OnClick = btnCloseClick
    ExplicitLeft = 631
    ExplicitTop = 410
  end
end
