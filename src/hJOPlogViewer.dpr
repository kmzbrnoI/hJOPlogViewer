program hJOPlogViewer;

{
 Tento program je jednoduchy zobrazovac primarnich logu hJOPserveru.
}

uses
  Forms,
  LOGCtrl in 'LOGCtrl.pas' {Form1},
  ShowRadek in 'ShowRadek.pas' {F_ShowRadek};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'hJOPlogViewer';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TF_ShowRadek, F_ShowRadek);
  Application.Run;
end.
