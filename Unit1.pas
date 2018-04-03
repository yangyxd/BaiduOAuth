unit Unit1;

interface

uses
  ShellAPI, YxdJson,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdServerIOHandler,
  IdSSLOpenSSL, IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler,
  IdIOHandlerSocket;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    Edit2: TEdit;
    Button3: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  App_Name = 'YunMgrTest';
  App_ID = '11039345';
  App_Key = 'VeH1j2CFv1W9R0rsdQLLRjUG';
  App_SecretKey = 'QcImjSqnH7kM6hYnx0pjyNO7YtsTs5fB';
  App_RedirectUri = 'oob';

var
  App_ToKen: string = '';
  App_Refresh_ToKen: string = '';
  App_SessionKey: string = '';
  App_SessionSecret: string = '';

function OpenURL(const URL: string): Boolean;
begin
  Result := ShellExecute(0, 'OPEN', PChar(URL), nil, nil, SW_SHOWMAXIMIZED) > 32;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  OpenURL(Format('http://openapi.baidu.com/oauth/2.0/authorize?client_id=%s&response_type=%s&redirect_uri=%s&confirm_login=%s',
    [App_Key, 'code', App_RedirectUri, '1']));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Data: string;
  Json: JSONObject;
begin
  if Edit1.Text = '' then Exit;
  if Edit1.Text = Edit1.Hint then Exit;

  try
    Data := Utf8ToAnsi(IdHTTP1.Get(
      Format('https://openapi.baidu.com/oauth/2.0/token?grant_type=%s&code=%s&client_id=%s&client_secret=%s&redirect_uri=%s',
      ['authorization_code', Trim(Edit1.Text), App_Key, App_SecretKey, App_RedirectUri])
    ));
    if Data <> '' then begin
      Json := nil;
      try
        Json := JSONObject.ParseObject(Data);
        Edit2.Text := Json.S['access_token'];
        if Edit2.Text = '' then begin
          ShowMessage('操作失败！' + Json.S['error_description']);
        end else begin
          App_ToKen := Edit2.Text;
          App_Refresh_ToKen := Json.S['refresh_token'];
          App_SessionKey := Json.S['session_key'];
          App_SessionSecret := Json.S['session_secret'];
          
          Button1.Enabled := False;
          Button2.Enabled := False;

          Button2.Caption := '已成功获取Access Token';
        end;
      finally
        FreeAndNil(Json);
      end;
    end else 
      ShowMessage('操作失败!');
  except
    ShowMessage(Exception(ExceptObject).Message);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  IdSSLIOHandlerSocket1.Open;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Data: string;
  Json: JSONObject;
begin
  if App_ToKen = '' then Exit;

  try
    Data := Utf8ToAnsi(IdHTTP1.Get(
      Format('https://pcs.baidu.com/rest/2.0/pcs/quota?method=info&access_token=%s',
      [App_ToKen])
    ));
    if Data <> '' then begin
      Json := nil;
      try
        Json := JSONObject.ParseObject(Data);
        Memo1.Lines.Add(Json.ToString(4));
      finally
        FreeAndNil(Json);
      end;
    end else 
      ShowMessage('操作失败!');
  except
    ShowMessage(Exception(ExceptObject).Message);
  end;
end;

end.
