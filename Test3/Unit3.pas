unit Unit3;

interface
uses
  Winapi.Windows,  Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,    Vcl.Controls,    Vcl.Forms,      Vcl.Dialogs,
  Vcl.StdCtrls,    Vcl.OleCtrls,    ShDocVw,        IOUtils,
  Generics.Collections,             D3_Test_procs,  WebUtils,
  UWebBrowserWrapper;

type
  TForm1 = class(TForm)
    WebBrowser1 : TWebBrowser;
    Button1     : TButton;
    Button2     : TButton;
    Button3     : TButton;
    Button4     : TButton;
    Button5     : TButton;
    procedure     Button1Click(Sender: TObject);
    procedure     Button2Click(Sender: TObject);
    procedure     Button3Click(Sender: TObject);
    procedure     Button4Click(Sender: TObject);
    procedure     Button5Click(Sender: TObject);
    procedure     FormCreate(Sender: TObject);
    procedure     FormDestroy(Sender: TObject);
  private
    fWBW        : TWebBrowserWrapper;
  end;

var
  Form1: TForm1;
  wd   : string;

//  ------------------
implementation
{$R *.dfm}

//  ------------------
procedure TForm1.Button1Click(Sender: TObject);
begin
    //WebBrowser1.Navigate(wd+'d3test-03a.html');
    fWBW.LoadFromFile(wd+'d3test-03a.html');
end;

//  ------------------
procedure TForm1.Button2Click(Sender: TObject);
begin
    //WebBrowser1.Navigate(wd+'d3test2.html');
    fWBW.NavigateToLocalFile(wd+'d3test2.html')
end;

//  ------------------
procedure TForm1.Button3Click(Sender: TObject);
var vals : string;
begin
    vals := '15,10,30,08,45,24,06,45,60,45,32,18,11,03';
    fWBW.LoadFromString(D3_html_string(vals));
end;

//  ------------------
procedure TForm1.Button4Click(Sender: TObject);
var
    arr    : array of integer;
begin
    fWBW.NavigateToLocalFile(wd+'d3test-02.html');      // works, because blocking call.

    arr    := [ 5,10,30, 8,45,24,16,55,60,45,32,18,11, 3];
    ExecuteJScript(WebBrowser1, D3_array_to_script(arr));

    TArray.Sort<Integer>(arr);
    ExecuteJScript(WebBrowser1, D3_array_to_script(arr));
end;

//  ------------------
procedure TForm1.Button5Click(Sender: TObject);
begin
    WebBrowser1.Navigate('about:blank');
end;

//  ------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
    fWBW := TWebBrowserWrapper.Create(WebBrowser1);
    wd   := GetCurrentDir;
    wd   := TDirectory.GetParent(wd);                   //
    wd   := TDirectory.GetParent(wd);                   // up two directories running in the IDE
    wd   := TDirectory.GetParent(wd);                   // up one directory   from Test3 to D3Delphi base
    wd   := wd+'/d3samples/'; {FilePathToURL(wd)+'/';}  // WBW auto adds 'FILE://'
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
    fWBW.Free;
end;
//  ------------------

end.
