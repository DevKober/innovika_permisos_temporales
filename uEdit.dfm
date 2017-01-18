object formEdit: TformEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Editar'
  ClientHeight = 290
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 82
    Height = 13
    Caption = 'Fecha Caducidad'
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 25
    Height = 13
    Caption = 'Linea'
  end
  object Label3: TLabel
    Left = 208
    Top = 80
    Width = 23
    Height = 13
    Caption = 'Base'
  end
  object Label4: TLabel
    Left = 8
    Top = 136
    Width = 25
    Height = 13
    Caption = 'Color'
  end
  object Label5: TLabel
    Left = 208
    Top = 136
    Width = 56
    Height = 13
    Caption = 'Cubrecanto'
  end
  object Label6: TLabel
    Left = 8
    Top = 192
    Width = 41
    Height = 13
    Caption = 'Jaladera'
  end
  object datePicker: TDateTimePicker
    Left = 8
    Top = 35
    Width = 223
    Height = 21
    Date = 42740.500931145830000000
    Format = 'dd/MM/yyyy hh:mm:ss tt'
    Time = 42740.500931145830000000
    TabOrder = 0
  end
  object txtLine: TEdit
    Left = 8
    Top = 99
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object txtBases: TEdit
    Left = 208
    Top = 99
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object txtColor: TEdit
    Left = 8
    Top = 155
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object txtCover: TEdit
    Left = 208
    Top = 155
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object txtHandle: TEdit
    Left = 8
    Top = 211
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object Button1: TButton
    Left = 206
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Guardar'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 287
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 7
    OnClick = Button2Click
  end
  object vLine: TButton
    Left = 135
    Top = 97
    Width = 26
    Height = 25
    Caption = '>'
    TabOrder = 8
    OnClick = vLineClick
  end
  object vColor: TButton
    Left = 135
    Top = 153
    Width = 26
    Height = 25
    Caption = '>'
    TabOrder = 9
    OnClick = vColorClick
  end
  object vHandle: TButton
    Left = 135
    Top = 209
    Width = 26
    Height = 25
    Caption = '>'
    TabOrder = 10
    OnClick = vHandleClick
  end
  object vBase: TButton
    Left = 335
    Top = 97
    Width = 26
    Height = 25
    Caption = '>'
    TabOrder = 11
    OnClick = vBaseClick
  end
  object vCover: TButton
    Left = 335
    Top = 153
    Width = 26
    Height = 25
    Caption = '>'
    TabOrder = 12
    OnClick = vCoverClick
  end
end
