unit unitConfINI;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, IniFiles;

type

  { TfrmConfINI }

  TfrmConfINI = class(TForm)
    btnSalvaINI: TButton;
    bntCancelaINI: TButton;
    editNomeBD: TEdit;
    editHostBD: TEdit;
    editPortaBD: TEdit;
    editSenhaBD: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnl_ConfINI: TPanel;
    procedure bntCancelaINIClick(Sender: TObject);
    procedure btnSalvaINIClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmConfINI: TfrmConfINI;

implementation
uses unitTelaLogin;
{$R *.lfm}

{ TfrmConfINI }

procedure TfrmConfINI.bntCancelaINIClick(Sender: TObject);
begin
     frmConfINI.close;
end;

procedure TfrmConfINI.btnSalvaINIClick(Sender: TObject);
var
  Ini: TIniFile;
  IniFile: string;
begin
  // Define o caminho completo para o arquivo CONFIG.INI na pasta do executável
  IniFile := ExtractFilePath(ParamStr(0)) + 'CONFIG.INI';

  Ini := TIniFile.Create(IniFile);

  try
    Ini.WriteString('CONEXAO', 'NOME_BD', editNomeBD.Text);
    Ini.WriteString('CONEXAO', 'HOST', editHostBD.Text);
    Ini.WriteString('CONEXAO', 'PORTA', editPortaBD.Text);
    Ini.WriteString('CONEXAO', 'SENHA', editSenhaBD.Text);

    Ini.UpdateFile;
  finally
    Ini.Free;
  end;
end;

procedure TfrmConfINI.FormShow(Sender: TObject);
var
  Ini: TIniFile;
  IniFile: string;
begin
  IniFile := ExtractFilePath(ParamStr(0)) + 'CONFIG.INI';

  Ini := TIniFile.Create(IniFile);

  try
    editNomeBD.Text := Ini.ReadString('CONEXAO', 'NOME_BD', '');
    editHostBD.Text := Ini.ReadString('CONEXAO', 'HOST', '');
    editPortaBD.Text := Ini.ReadString('CONEXAO', 'PORTA', '');
    editSenhaBD.Text := Ini.ReadString('CONEXAO', 'SENHA', '');
  finally
    Ini.Free;
  end;
end;


end.

