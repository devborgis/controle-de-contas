program Controle_de_contas;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, unitTelaLogin, DMDB, zcomponent, unitTelaSistema, unitConfINI, uUtil
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmLogado, frmLogado);
  Application.CreateForm(TfrmConfINI, frmConfINI);
  Application.Run;
end.

