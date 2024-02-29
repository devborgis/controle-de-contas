unit uUtil;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, IniFiles;

type
  TINIClass = class
    NomeDB , HostDB, PortaDB, SenhaDB : string;
  private
    //
  public
    procedure pLerINI;
    procedure pGravaINI;
  end;

implementation

procedure TINIClass.pGravaINI;
var
  Ini: TIniFile;
  IniFile: string;
begin
  IniFile := ExtractFilePath(ParamStr(0)) + 'CONFIG.INI';

  Ini := TIniFile.Create(IniFile);

  try
    NomeDB  := Ini.WriteString('CONEXAO', 'NOME_BD', '');
    HostDB  := Ini.WriteString('CONEXAO', 'HOST', '');
    PortaDB := Ini.WriteString('CONEXAO', 'PORTA', '');
    SenhaDB := Ini.WriteString('CONEXAO', 'SENHA', '');
  finally
    Ini.Free;
  end;
end;

procedure TINIClass.pLerINI;
var
  Ini: TIniFile;
  IniFile: string;
begin
  IniFile := ExtractFilePath(ParamStr(0)) + 'CONFIG.INI';

  Ini := TIniFile.Create(IniFile);

  try
    NomeDB  := Ini.ReadString('CONEXAO', 'NOME_BD', '');
    HostDB  := Ini.ReadString('CONEXAO', 'HOST', '');
    PortaDB := Ini.ReadString('CONEXAO', 'PORTA', '');
    SenhaDB := Ini.ReadString('CONEXAO', 'SENHA', '');
  finally
    Ini.Free;
  end;
end;

end.

