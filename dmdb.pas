unit DMDB;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset, unitTelaLogin;

type

  { TDM }

  TDM = class(TDataModule)
    cMariaDB: TZConnection;
    qryUserLogin: TZQuery;
    procedure cMariaDBBeforeConnect(Sender: TObject);
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

{ TDM }

procedure TDM.cMariaDBBeforeConnect(Sender: TObject);
begin
  cMariaDB.Database:=NomeBD;
  cMariaDB.HostName:=HostBD;
  cMariaDB.Password:=SenhaBD;
  cMariaDB.Port := StrToInt(PortaBD);
end;

end.

