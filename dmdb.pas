unit DMDB;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset;

type

  { TDM }

  TDM = class(TDataModule)
    cMariaDB: TZConnection;
    qryUserLogin: TZQuery;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.

