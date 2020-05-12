unit iGov.Client;

interface

uses
  iGov.Types,
  CloudAPI.Client.Sync;

type
  TiGovApiClient = class
    FAPI: TCloudApiClient;
  public
    constructor Create;
    destructor Destroy; override;
    function Catalog: TArray<TCategory>;
    function Regions: TArray<TigovRegion>;
    function getCatalogTree(ACity: TigovCity): TigoCatalogTree;
  end;

implementation

uses
  CloudAPI.Request, CloudAPI.Types, CloudAPI.Response;

{ TiGovApiClient }

function TiGovApiClient.Catalog: TArray<TCategory>;
var
  LRequest: IcaRequest;
  LResponse: IcaResponse<TArray<TCategory>>;
begin
  LRequest := TcaRequest.Create;
  LRequest.Resource := 'catalog';
  LRequest.AddParam('bShowEmptyFolders', False, TcaParameterType.GetOrPost);
  LResponse := FAPI.Execute < TArray < TCategory >> (LRequest);
  Result := LResponse.Data;
end;

constructor TiGovApiClient.Create;
begin
  FAPI := TCloudApiClient.Create;
  FAPI.BaseUrl := 'https://igov.gov.ua/api';
end;

destructor TiGovApiClient.Destroy;
begin
  FAPI.Free;
  inherited;
end;

function TiGovApiClient.getCatalogTree(ACity: TigovCity): TigoCatalogTree;
var
  LRequest: IcaRequest;
  LResponse: IcaResponse<TigoCatalogTree>;
begin
  LRequest := TcaRequest.Create;
  LRequest.Resource := 'catalog/getCatalogTree';
  if Assigned(ACity) then
    LRequest.AddQueryParameter('asIDPlaceUA', 'undefined,' + ACity.IDText);
  LRequest.AddQueryParameter('bNew', 'true');
  LRequest.AddQueryParameter('ShowEmptyFolders', 'false');
  LRequest.AddQueryParameter('nID_Category', '1');
  LResponse := FAPI.Execute<TigoCatalogTree>(LRequest);
  Result := LResponse.Data;
end;

function TiGovApiClient.Regions: TArray<TigovRegion>;
var
  LRequest: IcaRequest;
  LResponse: IcaResponse<TArray<TigovRegion>>;
begin
  LRequest := TcaRequest.Create;
  LRequest.Resource := 'places/regions';
  LResponse := FAPI.Execute < TArray < TigovRegion >> (LRequest);
  Result := LResponse.Data;
end;

end.
