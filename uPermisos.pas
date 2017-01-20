unit uPermisos;

interface

uses
  SysUtils, Classes, DB, DBAccess, MSAccess, MemDS;

type
  TDM = class(TDataModule)
    SQLConnect: TMSConnection;
    qGetUserId: TMSQuery;
    qGetOportunidades: TMSQuery;
    qGetUserIdUserId: TIntegerField;
    qGetOportunidadesIdOportunidad: TLargeintField;
    qGetOportunidadesUsuario: TIntegerField;
    qGetOportunidadesCaducidad: TDateTimeField;
    qGetOportunidadesLineaAbierta: TWideStringField;
    qGetOportunidadesBaseAbierta: TStringField;
    qGetOportunidadesCubrecantoAbierto: TStringField;
    qGetOportunidadesJaladeraAbierta: TStringField;
    DSGetOportunidades: TMSDataSource;
    qGetArt_x_: TMSQuery;
    DSGetArt_x_: TMSDataSource;
    qUpdateOportunidades: TMSQuery;
    qGetUserIdNombreCompleto: TStringField;
    qGetOportunidadesNombre: TWideStringField;
    qGetOportunidadesColorAbierto: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
