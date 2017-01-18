unit uEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uPermisos, StrUtils;

type
  TformEdit = class(TForm)

    txtLine: TEdit;
    txtBases: TEdit;
    txtColor: TEdit;
    txtCover: TEdit;
    txtHandle: TEdit;
    datePicker: TDateTimePicker;

    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;

    Button1: TButton;
    Button2: TButton;

    vLine: TButton;
    vColor: TButton;
    vHandle: TButton;
    vBase: TButton;
    vCover: TButton;

    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure vLineClick(Sender: TObject);
    procedure vColorClick(Sender: TObject);
    procedure vHandleClick(Sender: TObject);
    procedure vBaseClick(Sender: TObject);
    procedure vCoverClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    idOportunidad : integer;
    action : string;
    usuario : string;
  end;

var
  formEdit: TformEdit;

implementation

uses uOptions;

{$R *.dfm}

function OpenOptions(table : string) : string;
var
  fOptions : TformOptions;
begin
  fOptions := TformOptions.Create(nil);
  fOptions.table := table;

  if fOptions.ShowModal = mrOK
  then
    begin
      Result := fOptions.myOption;
    end

end;

procedure TformEdit.Button1Click(Sender: TObject);
var
  Dialog : TTaskDialog;
  DButton : TTaskDialogBaseButtonItem;
  rQuery : string;
begin
  Dialog := TTaskDialog.Create(self);
  Dialog.Caption := 'Advertencia';
  Dialog.MainIcon := tdiWarning;
  Dialog.Text := '¿Esta seguro que desea guardar los cambios?';
  Dialog.CommonButtons := [];

  DButton := Dialog.Buttons.Add;
  DButton.Caption := 'Guardar';
  DButton.ModalResult := 1;

  DButton := Dialog.Buttons.Add;
  DButton.Caption := 'Cancelar';
  DButton.ModalResult := 0;

  Dialog.Execute;

  if Dialog.ModalResult = 1
  then
    begin
      DM.qUpdateOportunidades.Close;
      DM.qUpdateOportunidades.SQL.Clear;

      if action = 'update' then
        begin
          DM.qUpdateOportunidades.SQL.Add('UPDATE Oportunidades SET'+
            ' Caducidad = :caducidad,' +
            ' LineaAbierta = :line, ' +
            ' BaseAbierta = :base,' +
            ' ColorAbierto = :color,' +
            ' CubrecantoAbierto = :cover,' +
            ' JaladeraAbierta = :handle' +
            ' WHERE IdOportunidad = :id;');
          DM.qUpdateOportunidades.ParamByName('caducidad').AsString := FormatDateTime('yyyy-MM-dd hh:mm:ss',datePicker.DateTime);
          DM.qUpdateOportunidades.ParamByName('id').AsInteger := idOportunidad;
        end;

      if action = 'insert' then
        begin
          DM.qUpdateOportunidades.SQL.Add('INSERT INTO Oportunidades'+
            ' (Caducidad,Usuario,LineaAbierta,BaseAbierta,ColorAbierto,CubrecantoAbierto,JaladeraAbierta)' +
            ' VALUES (:caducidad,:usuario,:line,:base,:color,:cover,:handle);');
            DM.qUpdateOportunidades.SQL.Add(rQuery);
            DM.qUpdateOportunidades.ParamByName('caducidad').AsString := FormatDateTime('yyyy-MM-dd hh:mm:ss',datePicker.DateTime);
            DM.qUpdateOportunidades.ParamByName('usuario').AsString := usuario;
        end;

      if txtLine.GetTextLen > 0
        then DM.qUpdateOportunidades.ParamByName('line').AsString := txtLine.Text
        else DM.qUpdateOportunidades.ParamByName('line').Clear;
      if txtBases.GetTextLen > 0
        then DM.qUpdateOportunidades.ParamByName('base').AsString := txtBases.Text
        else DM.qUpdateOportunidades.ParamByName('base').Clear;
      if txtColor.GetTextLen > 0
        then DM.qUpdateOportunidades.ParamByName('color').AsString := txtColor.Text
        else DM.qUpdateOportunidades.ParamByName('color').Clear;
      if txtCover.GetTextLen > 0
        then DM.qUpdateOportunidades.ParamByName('cover').AsString := txtCover.Text
        else DM.qUpdateOportunidades.ParamByName('cover').Clear;
      if txtHandle.GetTextLen > 0
        then DM.qUpdateOportunidades.ParamByName('handle').AsString := txtHandle.Text
        else DM.qUpdateOportunidades.ParamByName('handle').Clear;

      DM.qUpdateOportunidades.Execute;
      modalResult := mrOk;
    end
  else if Dialog.ModalResult = 0
    then
      begin
        ShowMessage('Cierra');
      end;

end;

procedure TformEdit.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TformEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TformEdit.vBaseClick(Sender: TObject);
var
  resp : string;
begin
  resp := OpenOptions('Bases');
  if length(resp) > 0 then txtBases.Text := resp;
end;

procedure TformEdit.vColorClick(Sender: TObject);
var
  resp : string;
begin
  resp := OpenOptions('Colores');
  if length(resp) > 0 then txtcolor.Text := resp;
end;

procedure TformEdit.vCoverClick(Sender: TObject);
var
  resp : string;
begin
  resp := OpenOptions('Cubrecantos');
  if length(resp) > 0 then txtCover.Text := resp;
end;

procedure TformEdit.vHandleClick(Sender: TObject);
var
  resp : string;
begin
  resp := OpenOptions('Jaladeras');
  if length(resp) > 0 then txtHandle.Text := resp;
end;

procedure TformEdit.vLineClick(Sender: TObject);
var
  resp : string;
begin
  resp := OpenOptions('Lineas');
  if length(resp) > 0 then txtLine.Text := resp;
end;

end.
