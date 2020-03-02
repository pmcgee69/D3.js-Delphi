program Project3;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form1},
  MSHTML_TLB in 'MSHTML_TLB.pas',
  UWebBrowserWrapper in 'UWebBrowserWrapper.pas',
  D3_Test_procs in 'D3_Test_procs.pas',
  WebUtils in 'WebUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
