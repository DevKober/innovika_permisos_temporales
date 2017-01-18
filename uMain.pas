unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, uNew, uEdit;

type
  TformMain = class(TForm)
    txtUser: TEdit;
    btnSearch: TButton;
    DBGrid1: TDBGrid;
    btnNew: TButton;
    btnDelete: TButton;
    btnEdit: TButton;
    btnClose: TButton;
    tSearch: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure txtUserKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

uses uPermisos;

{$R *.dfm}

procedure Search(Sender: TObject);
begin
  DM.qGetUserId.Close;
  DM.qGetOportunidades.Close;

  DM.qGetUserId.ParamByName('cliente').AsString := formMain.txtUser.Text;
  DM.qGetUserId.Open;

  DM.qGetOportunidades.ParamByName('usuario').AsInteger := DM.qGetUserIdUserId.AsInteger;
  DM.qGetOportunidades.Open;

  formMain.tSearch.Caption := DM.qGetUserIdNombreCompleto.AsString;
end;

procedure TformMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TformMain.btnSearchClick(Sender: TObject);
begin
  Search(self);
end;

procedure TformMain.btnDeleteClick(Sender: TObject);
var
  Dialog : TTaskDialog;
  DButton : TTaskDialogBaseButtonItem;
begin
  if DM.qGetUserIdUserId.AsInteger > 0 then
    begin
      Dialog := TTaskDialog.Create(self);
      Dialog.Caption := 'Advertencia';
      Dialog.MainIcon := tdiWarning;
      Dialog.Text := '¿Esta seguro que desea eliminiar este registro?';
      Dialog.CommonButtons := [];

      DButton := Dialog.Buttons.Add;
      DButton.Caption := 'Eliminar';
      DButton.ModalResult := 1;

      DButton := Dialog.Buttons.Add;
      DButton.Caption := 'Cancelar';
      DButton.ModalResult := 0;

      Dialog.Execute;

      if Dialog.ModalResult = 1 then
        begin
          DM.qUpdateOportunidades.Close;
          DM.qUpdateOportunidades.SQL.Clear;
          DM.qUpdateOportunidades.SQL.
            Add('DELETE FROM Oportunidades WHERE IdOportunidad='''+ DBGrid1.DataSource.DataSet.FieldByName('IdOportunidad').AsString +''';');
          DM.qUpdateOportunidades.Execute;
          Search(self);
        end
      else if Dialog.ModalResult = 0 then
        // exit

    end;

end;

procedure TformMain.btnEditClick(Sender: TObject);
var
  fEdit : TformEdit;
begin
  fEdit := TformEdit.Create(self);
  fEdit.ShowModal;
end;

procedure TformMain.btnNewClick(Sender: TObject);
var
  fNew : TformEdit;
begin
  if DM.qGetUserIdUserId.AsInteger > 0 then
    begin
      fNew := TformEdit.Create(self);
      fNew.action := 'insert';
      fNew.usuario := DM.qGetUserIdUserId.AsString;
      fNew.datePicker.DateTime := Now;

      if fNew.ShowModal = mrOK
      then Search(self)
    end;
end;

procedure TformMain.DBGrid1DblClick(Sender: TObject);
var
  fEdit : TformEdit;
begin
  fEdit := TformEdit.Create(self);
  fEdit.action := 'update';
  fEdit.datePicker.DateTime := DBGrid1.DataSource.DataSet.FieldByName('Caducidad').AsDateTime;
  fEdit.txtLine.Text := DBGrid1.DataSource.DataSet.FieldByName('LineaAbierta').AsString;
  fEdit.txtBases.Text := DBGrid1.DataSource.DataSet.FieldByName('BaseAbierta').AsString;
  fEdit.txtColor.Text := DBGrid1.DataSource.DataSet.FieldByName('ColorAbierto').AsString;
  fEdit.txtCover.Text  := DBGrid1.DataSource.DataSet.FieldByName('CubrecantoAbierto').AsString;
  fEdit.txtHandle.Text := DBGrid1.DataSource.DataSet.FieldByName('JaladeraAbierta').AsString;
  fEdit.idOportunidad := DBGrid1.DataSource.DataSet.FieldByName('IdOportunidad').AsInteger;

  if fEdit.ShowModal = mrOK
  then Search(self);

end;

procedure TformMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TformMain.txtUserKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN then
  begin
    Search(self);
  end;
end;

end.
