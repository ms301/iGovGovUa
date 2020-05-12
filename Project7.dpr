program Project7;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  iGov.Client,
  iGov.Types,
  System.SysUtils;

procedure test;
var
  LiGov: TiGovApiClient;
  LCat: TArray<TCategory>;
begin
  LiGov := TiGovApiClient.Create;
  try
    LCat := LiGov.Catalog;
  finally
    LiGov.Free;
  end;
end;

procedure GetRegions;
var
  LiGov: TiGovApiClient;
  LCat: TArray<TigoRegions>;
begin
  LiGov := TiGovApiClient.Create;
  try
    LCat := LiGov.Regions;
  finally
    LiGov.Free;
  end;
end;

begin
  try
    GetRegions;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
