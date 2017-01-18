program PermisosTemporales;

uses
  Forms,
  uMain in 'uMain.pas' {formMain},
  uPermisos in 'uPermisos.pas' {DM: TDataModule},
  uNew in 'uNew.pas' {formNew},
  uEdit in 'uEdit.pas' {formEdit},
  uOptions in 'uOptions.pas' {formOptions};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.
