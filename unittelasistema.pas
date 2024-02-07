unit unitTelaSistema;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, DBGrids, ZDataset;

type

  { TfrmLogado }

  TfrmLogado = class(TForm)
    btnMenu: TSpeedButton;
    btnPagar: TSpeedButton;
    btnReceber: TSpeedButton;
    btnUser: TSpeedButton;
    ImageList1: TImageList;
    pnl_menu: TPanel;
    pnl_visualizacao: TPanel;
    procedure btnMenuClick(Sender: TObject);
  private

  public

  end;

var
  frmLogado: TfrmLogado;

implementation

{$R *.lfm}

{ TfrmLogado }

procedure TfrmLogado.btnMenuClick(Sender: TObject);
begin
     if pnl_menu.width = 210 then
        begin pnl_menu.width := 50;
              btnMenu.caption := '';
              btnPagar.caption := '';
              btnReceber.caption := '';
              btnUser.caption := '';
        end else
            begin
              pnl_menu.width := 210;
              btnMenu.caption := 'MENU';
              btnPagar.caption := 'PAGAR';
              btnReceber.caption := 'RECEBER';
              btnUser.caption := 'USUÁRIOS';
        end;
end;

end.

