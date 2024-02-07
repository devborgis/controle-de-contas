unit unitTelaLogin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, IniFiles;

type

  { TfrmLogin }

  TfrmLogin = class(TForm)
    btnLogin: TButton;
    btnCancel: TButton;
    editLogin: TEdit;
    editPassword: TEdit;
    Image1: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnConf: TSpeedButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnConfClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public
    procedure lerINI;
  end;

var
  frmLogin: TfrmLogin;
  NomeBD , HostBD, PortaBD, SenhaBD : string;

implementation
  uses DMDB, unitTelaSistema, unitConfINI;
{$R *.lfm}

{ TfrmLogin }

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  frmLogin.Close;
end;

procedure TfrmLogin.btnConfClick(Sender: TObject);
begin
  frmConfINI.ShowModal;
  frmLogin.ModalResult:= mrClose;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  dm.qryUserLogin.Close;
  dm.qryUserLogin.SQL.Clear;
  dm.qryUserLogin.SQL.Add('SELECT login, password FROM tb_users WHERE login = :login AND password = :password');
  dm.qryUserLogin.ParamByName('login').AsString := editLogin.Text;
  dm.qryUserLogin.ParamByName('password').AsString := editPassword.Text;
  dm.qryUserLogin.Open;

  if (dm.qryUserLogin.RecordCount = 1) then
  begin
    editLogin.Clear;
    editPassword.Clear;
    frmLogado.ShowModal;
    frmLogin.close;
  end
  else
  begin
    // Usuário ou senha incorretos
    editLogin.Clear;
    editPassword.Clear;
    editLogin.SetFocus;
    ShowMessage('Usuário ou senha incorretos, verifique!');
  end;
end;


procedure TfrmLogin.FormShow(Sender: TObject);
begin
   Image1.ImageIndex := 1;
   if FileExists(ExtractFilePath(ParamStr(0)) + 'CONFIG.INI') then
      lerINI
   else
     ShowMessage('Arquivo INI não criado, configure os paramêtros para conexão com o banco de dados');
     frmConfINI.ShowModal;
end;

procedure TfrmLogin.Image1Click(Sender: TObject);
begin
  if (editPassword.PasswordChar = '*') AND (Image1.ImageIndex = 1) then
  begin
    Image1.ImageIndex := 0;
    editPassword.PasswordChar := #0;
  end
  else
  begin
    Image1.ImageIndex := 1;
    editPassword.PasswordChar := '*';
  end;

end;

procedure TfrmLogin.lerINI;
var
  Ini: TIniFile;
  IniFile: string;
begin
  IniFile := ExtractFilePath(ParamStr(0)) + 'CONFIG.INI';

  Ini := TIniFile.Create(IniFile);

  try
    NomeBD  := Ini.ReadString('CONEXAO', 'NOME_BD', '');
    HostBD  := Ini.ReadString('CONEXAO', 'HOST', '');
    PortaBD := Ini.ReadString('CONEXAO', 'PORTA', '');
    SenhaBD := Ini.ReadString('CONEXAO', 'SENHA', '');
  finally
    Ini.Free;
  end;
end;

end.

