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
  LCat: TArray<TigovRegions>;
begin
  LiGov := TiGovApiClient.Create;
  try
    LCat := LiGov.Regions;
  finally
    LiGov.Free;
  end;
end;

procedure GetCatalogTree;
var
  LiGov: TiGovApiClient;
  LCat: TArray<TigovRegions>;
  LTree:TigoCatalogTree;
begin
  LiGov := TiGovApiClient.Create;
  try
    LCat := LiGov.Regions;
    LTree := LiGov.GetCatalogTree(LiGov.Regions[6].City[16]);
  finally
    LiGov.Free;
  end;
end;

begin
  try
    GetCatalogTree;
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
