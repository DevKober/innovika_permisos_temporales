unit uOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, uPermisos;

type
  TformOptions = class(TForm)
    DBGridOptions: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBGridOptionsDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    table : string;
    myOption: string;
  end;

var
  formOptions: TformOptions;

implementation

{$R *.dfm}


procedure TformOptions.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TformOptions.Button2Click(Sender: TObject);
begin
  myOption := DBGridOptions.DataSource.DataSet.FieldByName('Codigo').AsString;
  modalResult := mrOk;
end;

procedure TformOptions.DBGridOptionsDblClick(Sender: TObject);
begin
  myOption := DBGridOptions.DataSource.DataSet.FieldByName('Codigo').AsString;
  modalResult := mrOk;
end;

procedure TformOptions.FormShow(Sender: TObject);
begin
  // Where Estatus = ''A''

  Label1.Caption := table;

  DM.qGetArt_x_.Close;
  DM.qGetArt_x_.SQL.Clear;
  DM.qGetArt_x_.SQL.Add('Select * From Art'+ table +';');
  DM.qGetArt_x_.Open;
end;

end.
