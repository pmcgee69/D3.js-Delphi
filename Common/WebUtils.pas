unit WebUtils;

interface
uses ShDocVw;

   function  FilePathToURL (const FilePath: string)   : string;
   procedure ExecuteJScript(WB : TWebBrowser; jscript : string);

//  ------------------
implementation
uses
     Winapi.Windows, ComObj, WinInet, ShLwApi, MSHTML_TLB;

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

// previous usage ...
// procedure ExecuteScript(doc: IHTMLDocument2; script: string; language: string) ;
// ExecuteScript( WebBrowser1.Document as IHTMLDocument2, script , 'javascript');

procedure ExecuteJScript(WB : TWebBrowser; jscript : string);
var  doc : IHTMLDocument2;
begin
     doc := WB.Document as IHTMLDocument2;
     if doc <> nil then
       if doc.parentWindow <> nil then
          doc.parentWindow.ExecScript(jscript, Olevariant('javascript')) ;
end;
//  ------------------

end.
