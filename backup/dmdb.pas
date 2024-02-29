unit DMDB;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset, IniFiles;

type

  { TDM }

  TDM = class(TDataModule)
    cMariaDB: TZConnection;
    qryUserLogin: TZQuery;
    procedure cMariaDBBeforeConnect(Sender: TObject);
    procedure ConfigurarConexao;
  private

  public

  end;

var
  DM: TDM;

implementation

uses
  Forms;

{$R *.lfm}

{ TDM }

procedure TDM.cMariaDBBeforeConnect(Sender: TObject);
begin
  ConfigurarConexao;
end;

procedure TDM.ConfigurarConexao;
var
  Ini: TIniFile;
  IniFile: string;
begin
  IniFile := ExtractFilePath(Application.ExeName) + 'config.ini';
  Ini := TIniFile.Create(IniFile);

  try
    cMariaDB.HostName := Ini.ReadString('CONEXAO', 'HOST', '');
    cMariaDB.Port := Ini.ReadInteger('CONEXAO', 'PORTA', 0);
    cMariaDB.Database := Ini.ReadString('CONEXAO', 'NOME_BD', '');
    // Removendo a configuração do usuário
    cMariaDB.Password := Ini.ReadString('CONEXAO', 'SENHA', '');
  finally
    Ini.Free;
  end;
end;

end.

