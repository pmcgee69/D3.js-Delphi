unit D3_Test_procs;

interface

function  D3_html_string    (const vals : string)   : string;
function  D3_array_to_script(const vals : array of integer) : string;

//  ------------------
implementation
uses System.SysUtils, System.Classes;

//  ------------------
function D3_html_string (const vals:string): string;
var
    htmlbody    : string;
begin
    htmlbody    :=
      '<!DOCTYPE html>' +
      '<meta http-equiv="X-UA-Compatible" content="IE=edge">' +
      '<html lang="en">' +
      '<head>' +
      '<script src = "https://d3js.org/d3.v3.min.js"></script>' +
      '</head>' +
      '<body>' +
      '<script>' +
      'var data_values = [' + vals + '];' +
      'var max         	 =  d3.max(data_values);' +
      'var min         	 =  d3.min(data_values);' +
      '' +
      'var svg  = d3.select("body").append("svg").attr({"width":450,"height":400});' +
      '' +
      'var bars = svg.selectAll("rect").data(data_values).enter().append("rect").attr("width","25px");' +
      '' +
      'bars.attr("height", function(d)  { return d*5    ; })' +
      '    .attr("x",      function(d,i){ return i*30   ; })' +
      '    .attr("y",      function(d)  { return 400-d*5; }).attr("fill", "steelblue");' +
      '' +
      'bars.filter(        function(d)  { return d==max ; }).attr("fill", "red");' +
      'bars.filter(        function(d)  { return d==min ; }).attr("fill", "green");' +
      '</script>' +
      '</body>' +
      '</html>' ;
    result := htmlbody;
end;

//  ------------------
function  D3_array_to_script(const vals : array of integer) : string;
var
    scriptbody : string;
    sl         : tstringlist;
    a          : integer;
begin
    sl := tstringlist.create;
    for a in vals do  sl.Add(a.tostring);

    scriptbody :=
      'var max         	 =  d3.max(data_values);' +
      'var min         	 =  d3.min(data_values);' +
      '' +
      'var svg  = d3.select("body").append("svg").attr({"width":450,"height":400});' +
      '' +
      'var bars = svg.selectAll("rect").data(data_values).enter().append("rect").attr("width","25px");' +
      '' +
      'bars.attr("height", function(d)  { return d*5    ; })' +
      '    .attr("x",      function(d,i){ return i*30   ; })' +
      '    .attr("y",      function(d)  { return 400-d*5; }).attr("fill", "steelblue");' +
      '' +
      'bars.filter(        function(d)  { return d==max ; }).attr("fill", "red");' +
      'bars.filter(        function(d)  { return d==min ; }).attr("fill", "green");' ;

    result := 'var data_values = [' + sl.CommaText + '];' + scriptbody;
    sl.Free;
end;
//  ------------------

end.
