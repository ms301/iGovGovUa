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
    function Regions: TArray<TigoRegions>;
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

function TiGovApiClient.Regions: TArray<TigoRegions>;
var
  LRequest: IcaRequest;
  LResponse: IcaResponse<TArray<TigoRegions>>;
begin
  LRequest := TcaRequest.Create;
  LRequest.Resource := 'places/regions';
  LResponse := FAPI.Execute < TArray < TigoRegions >> (LRequest);
  Result := LResponse.Data;
end;

end.
