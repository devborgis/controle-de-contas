unit uControleDeContas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TfrmLogin }

  TfrmLogin = class(TForm)
    btnLogin: TButton;
    btnCancel: TButton;
    editLogin: TEdit;
    editPassaword: TEdit;
    Image1: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure editLoginChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private

  public

  end;

var
  frmLogin: TfrmLogin;

implementation
  uses DMDB;
{$R *.lfm}

{ TfrmLogin }

procedure TfrmLogin.editLoginChange(Sender: TObject);
begin

end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  frmLogin.Close;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  dm.qryUserLogin.Close;
  dm.qryUserLogin.SQL.Clear;
  dm.qryUserLogin.SQL.Add('SELECT login, password FROM tb_users WHERE login = :login AND password = :password');
  dm.qryUserLogin.ParamByName('login').AsString := editLogin.Text;
  dm.qryUserLogin.ParamByName('password').AsString := editPassaword.Text;
  dm.qryUserLogin.Open;

  if (dm.qryUserLogin.RecordCount > 0) then
  begin
    ShowMessage('Sucesso');
  end
  else
  begin
    // Usuário ou senha incorretos
    editLogin.Clear;
    editPassaword.Clear;
    editLogin.SetFocus;
    ShowMessage('Usuário ou senha incorretos, verifique!');
  end;
end;


procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  Image1.ImageIndex := 1;
end;

procedure TfrmLogin.Image1Click(Sender: TObject);
begin
  if (editPassaword.PasswordChar = '*') AND (Image1.ImageIndex = 1) then
  begin
    Image1.ImageIndex := 0;
    editPassaword.PasswordChar := #0;
  end
  else
  begin
    Image1.ImageIndex := 1;
    editPassaword.PasswordChar := '*';
  end;
end;

end.

