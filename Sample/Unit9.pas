unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, iGov.Client, iGov.Types;

type
  TForm9 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FiGov: TiGovApiClient;
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.FormShow(Sender: TObject);

var
  LRegions: TArray<TigovRegion>;
  LRegion: TigovRegion;
  LCity: TigovCity;
  I, J, LCounter: Integer;
  Catalog: TigoCatalogTree;
const
  fn = 'C:\Users\Maxim\Desktop\1.csv';
var
  csv: tstringlist;
  row, col: Integer;
  s: string;
begin
  FiGov := TiGovApiClient.Create;
  StringGrid1.RowCount := 5000;
  LRegions := FiGov.Regions;
  LCounter := 0;
  for LRegion in LRegions do
    Inc(LCounter, Length(LRegion.City));
  StringGrid1.ColCount := LCounter;
  for LRegion in LRegions do
  begin
    for J := Low(LRegion.City) to High(LRegion.City) do
    begin
      StringGrid1.Cells[J + 1, 0] := LRegion.City[J].Name;
      Catalog := FiGov.getCatalogTree(LRegion.City[J]);
      for I := Low(Catalog.Service) to High(Catalog.Service) do
      begin
        StringGrid1.Cells[0, Catalog.Service[I].ID] := Catalog.Service[I].Name;
        StringGrid1.Cells[J + 1, Catalog.Service[I].ID] := '+';
      end;
    end;
  end;

  csv := TStringList.Create;
  for row := 1 to StringGrid1.RowCount do
  begin
    s := '';
    for col := 0 to StringGrid1.ColCount - 1 do
      s := s + StringGrid1.Cells[col, row - 1] + chr(9);
    csv.add(s)
  end;

  csv.savetofile(fn);
  csv.free;

end;

end.
