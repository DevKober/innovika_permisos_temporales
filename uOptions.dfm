object formOptions: TformOptions
  Left = 0
  Top = 0
  Caption = 'formOptions'
  ClientHeight = 276
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    480
    276)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object DBGridOptions: TDBGrid
    Left = 8
    Top = 24
    Width = 464
    Height = 213
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.DSGetArt_x_
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridOptionsDblClick
  end
  object Button1: TButton
    Left = 397
    Top = 243
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 316
    Top = 243
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Aceptar'
    TabOrder = 2
    OnClick = Button2Click
  end
end
