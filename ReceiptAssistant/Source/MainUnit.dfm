object MainForm: TMainForm
  Left = 256
  Top = 111
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20184#20020#38376#25910#21333#21161#25163
  ClientHeight = 509
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grpRegInfo: TGroupBox
    Left = 24
    Top = 24
    Width = 377
    Height = 473
    Caption = #21830#25143#27880#20876#20449#24687
    TabOrder = 0
  end
  object grpContractNo: TGroupBox
    Left = 536
    Top = 24
    Width = 185
    Height = 105
    Caption = #21512#21516#32534#21495
    TabOrder = 1
  end
  object grpLicense: TGroupBox
    Left = 536
    Top = 144
    Width = 185
    Height = 105
    Caption = #33829#19994#25191#29031
    TabOrder = 2
  end
  object grpPhoto: TGroupBox
    Left = 536
    Top = 296
    Width = 185
    Height = 105
    Caption = #35777#20214#29031
    TabOrder = 3
  end
  object btnImport: TButton
    Left = 464
    Top = 456
    Width = 75
    Height = 25
    Caption = #23548#20837
    TabOrder = 4
    OnClick = btnImportClick
  end
  object btnLog: TButton
    Left = 564
    Top = 456
    Width = 75
    Height = 25
    Caption = #24405#20837
    TabOrder = 5
  end
  object btnSave: TButton
    Left = 664
    Top = 456
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 6
  end
  object mmMain: TMainMenu
    Left = 128
    Top = 40
    object N1: TMenuItem
      Caption = #35774#32622'(&S)'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #24110#21161'(&H)'
    end
  end
  object dlgOpen1: TOpenDialog
    Filter = #25991#26412#25991#26723'(*.txt)|*.txt|'#25152#26377#25991#20214'(*.*)|*.*'
    Left = 440
    Top = 344
  end
end
