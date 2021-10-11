object Form1: TForm1
  Left = 229
  Top = 127
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Windows Desktops'
  ClientHeight = 250
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 40
    Height = 16
    Caption = 'Name:'
  end
  object Edit1: TEdit
    Left = 56
    Top = 8
    Width = 209
    Height = 24
    TabOrder = 0
  end
  object Button1: TButton
    Left = 168
    Top = 40
    Width = 97
    Height = 25
    Caption = 'Create'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 72
    Width = 97
    Height = 25
    Caption = 'Switch'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ListBox1: TListBox
    Left = 272
    Top = 40
    Width = 153
    Height = 169
    ItemHeight = 16
    TabOrder = 3
    OnClick = ListBox1Click
  end
  object Button3: TButton
    Left = 272
    Top = 8
    Width = 153
    Height = 25
    Caption = 'Enumerate'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 40
    Top = 128
    Width = 97
    Height = 25
    Caption = 'Go default'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 168
    Top = 184
    Width = 97
    Height = 25
    Caption = 'Run'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 168
    Top = 104
    Width = 97
    Height = 25
    Caption = 'Close'
    TabOrder = 7
    OnClick = Button6Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 216
    Width = 417
    Height = 24
    TabOrder = 8
    Text = 'runas /profile /user:WORKSTATION\Administrator "explorer.exe"'
  end
  object Button7: TButton
    Left = 40
    Top = 160
    Width = 97
    Height = 25
    Caption = 'Delayed sw'
    TabOrder = 9
    OnClick = Button7Click
  end
  object XPManifest1: TXPManifest
    Left = 392
    Top = 144
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 16
    Top = 40
  end
end
