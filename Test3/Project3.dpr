program Project3;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form1},
  D3_Test_procs in 'D3_Test_procs.pas',
  WebUtils           in '..\Common\WebUtils.pas',
  UWebBrowserWrapper in '..\Common\UWebBrowserWrapper.pas',
  MSHTML_TLB         in '..\Common\MSHTML_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
