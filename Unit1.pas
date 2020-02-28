unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw, IOUtils, ComObj, WinInet, ShLwApi;

type
  TForm1 = class(TForm)
    WebBrowser1 : TWebBrowser;
    Button1     : TButton;
    Button2     : TButton;
    Button3     : TButton;
    Button4     : TButton;
    procedure FormCreate  (Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  end;

var
  Form1 : TForm1;
  wd    : string;

implementation
{$R *.dfm}

// StackOverflow:  TLama  13/12/11
// https://stackoverflow.com/questions/8497895/how-to-get-the-file-url-from-absolute-path-in-delphi
function FilePathToURL(const FilePath: string): string;
var
  BufferLen: DWORD;
begin
  BufferLen := INTERNET_MAX_URL_LENGTH;
  SetLength(Result, BufferLen);
  OleCheck(UrlCreateFromPath(PChar(FilePath), PChar(Result), @BufferLen, 0));
  SetLength(Result, BufferLen);
end;
//  ------------------

procedure TForm1.FormCreate(Sender: TObject);
begin
    wd := GetCurrentDir;
    //wd := TDirectory.GetParent(wd);    //  Delphi / C++Builder IDE specific.  
    //wd := TDirectory.GetParent(wd);    //  .exe is 2 directories down from the source files.
    wd := FilePathToURL(wd)+'/';         //  Uncomment to run in IDE, or place html files with .exe 
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    WebBrowser1.Navigate(wd+'d3test2.html');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    WebBrowser1.Navigate(wd+'d3test4.html');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    WebBrowser1.Navigate(wd+'d3test5.html');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
    WebBrowser1.Navigate(wd+'d3test0.html');
end;

end.
