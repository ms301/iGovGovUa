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
  LCat: TArray<TigovCategory>;
begin
  LiGov := TiGovApiClient.Create;
  try
    LCat := LiGov.Catalog(TigovCatalogRequest.Default);
  finally
    LiGov.Free;
  end;
end;

procedure GetRegions;
var
  LiGov: TiGovApiClient;
  LCat: TArray<TigovRegion>;
begin
  LiGov := TiGovApiClient.Create;
  try
    LCat := LiGov.Regions(TigovRegionsRequest.Default);
  finally
    LiGov.Free;
  end;
end;

procedure GetCatalogTree;
var
  LiGov: TiGovApiClient;
  LCat: TArray<TigovRegion>;
  LTree: TigovCatalogTree;
begin
  LiGov := TiGovApiClient.Create;
  try
    LCat := LiGov.Regions(TigovRegionsRequest.Default);
    // LTree := LiGov.GetCatalogTree(LiGov.Regions[6].City[16]);
  finally
    LiGov.Free;
  end;
end;

begin
  try
    test;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
