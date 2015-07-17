object F_ShowRadek: TF_ShowRadek
  Left = 403
  Top = 514
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Radek [radek]'
  ClientHeight = 202
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 24
    Height = 13
    Caption = #268'as :'
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 49
    Height = 13
    Caption = 'ID Chyby :'
  end
  object Label4: TLabel
    Left = 8
    Top = 32
    Width = 43
    Height = 13
    Caption = 'V'#253'znam :'
  end
  object Label5: TLabel
    Left = 9
    Top = 85
    Width = 37
    Height = 13
    Caption = 'Zpr'#225'va:'
  end
  object L_Cas: TLabel
    Left = 144
    Top = 8
    Width = 30
    Height = 13
    Caption = 'L_Cas'
  end
  object L_Vyznam: TLabel
    Left = 144
    Top = 32
    Width = 49
    Height = 13
    Caption = 'L_Vyznam'
  end
  object L_ErrorID: TLabel
    Left = 144
    Top = 56
    Width = 45
    Height = 13
    Caption = 'L_ErrorID'
  end
  object M_Message: TMemo
    Left = 8
    Top = 104
    Width = 601
    Height = 89
    Lines.Strings = (
      'M_Message')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
