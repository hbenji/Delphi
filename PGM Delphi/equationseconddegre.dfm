object Form1: TForm1
  Left = 315
  Top = 280
  Width = 428
  Height = 390
  Caption = 'Form1'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 200
    Width = 161
    Height = 25
    Caption = 'Label1'
    Color = clMedGray
    ParentColor = False
  end
  object Label2: TLabel
    Left = 48
    Top = 72
    Width = 41
    Height = 25
    Caption = '     A'
    Color = clMedGray
    ParentColor = False
  end
  object Label3: TLabel
    Left = 48
    Top = 112
    Width = 41
    Height = 25
    Caption = '      B'
    Color = clGrayText
    ParentColor = False
  end
  object Label4: TLabel
    Left = 48
    Top = 152
    Width = 41
    Height = 25
    Caption = '      C'
    Color = clGrayText
    ParentColor = False
  end
  object Label5: TLabel
    Left = 48
    Top = 200
    Width = 41
    Height = 25
    Caption = '   Delta'
    Color = clGrayText
    ParentColor = False
  end
  object Label6: TLabel
    Left = 88
    Top = 240
    Width = 161
    Height = 25
    Caption = 'Label6'
    Color = clGrayText
    ParentColor = False
  end
  object Edit1: TEdit
    Left = 104
    Top = 72
    Width = 153
    Height = 21
    Color = clGrayText
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 104
    Top = 112
    Width = 153
    Height = 21
    Color = clGrayText
    TabOrder = 1
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 104
    Top = 152
    Width = 153
    Height = 21
    Color = clGrayText
    TabOrder = 2
    Text = 'Edit3'
  end
  object Button1: TButton
    Left = 272
    Top = 72
    Width = 89
    Height = 49
    Caption = 'Calcul'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 128
    Width = 89
    Height = 49
    Caption = 'OK'
    TabOrder = 4
  end
end
