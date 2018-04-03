object Form1: TForm1
  Left = 622
  Top = 416
  Width = 709
  Height = 543
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #24494#36719#38597#40657
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    693
    505)
  PixelsPerInch = 96
  TextHeight = 17
  object Edit1: TEdit
    Left = 16
    Top = 40
    Width = 658
    Height = 25
    Hint = #36755#20837#25480#26435#30721#21518#28857#20987#24212#29992#33719#21462'Access Token'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = #36755#20837#25480#26435#30721#21518#28857#20987#24212#29992#33719#21462'Access Token'
  end
  object Button1: TButton
    Left = 16
    Top = 7
    Width = 97
    Height = 25
    Caption = #33719#21462#25480#26435#30721
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 8
    Width = 217
    Height = 25
    Caption = #24212#29992#65292#33719#21462'Access Token'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 16
    Top = 72
    Width = 658
    Height = 25
    Hint = 'Access Token'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Text = 'Access Token'
  end
  object Button3: TButton
    Left = 16
    Top = 112
    Width = 137
    Height = 25
    Caption = #26597#30475#32593#30424#37197#39069
    TabOrder = 4
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 184
    Width = 665
    Height = 305
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocket1
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 424
    Top = 16
  end
  object IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvTLSv1
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 424
    Top = 48
  end
end
