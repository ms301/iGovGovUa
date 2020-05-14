unit iGov.Client;

interface

uses
  CloudAPI.Client.Sync,
  iGov.Types.Response,
  iGov.Types.Request;

type
  TiGovApiClient = class
  private
    FAPI: TCloudApiClient;
  protected
    function InternalExec<TRequest: record; TResponse>(ARequest: TRequest): TResponse;
  public
    constructor Create;
    destructor Destroy; override;
    function Catalog(ACatalogRequest: TigovCatalogRequest): TArray<TigovCategory>;
    function Regions(ARegionRequest: TigovRegionsRequest): TArray<TigovRegion>;
    function getCatalogTree(ACatalogTreeRequest: TigovCatalogTreeRequest): TigovCatalogTree;
  end;

implementation

uses
  CloudAPI.Request,
  CloudAPI.RequestArgument,
  CloudAPI.Response,
  CloudAPI.Types;

{ TiGovApiClient }

function TiGovApiClient.Catalog(ACatalogRequest: TigovCatalogRequest): TArray<TigovCategory>;
begin
  Result := InternalExec < TigovCatalogRequest, TArray < TigovCategory >> (ACatalogRequest);
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

function TiGovApiClient.getCatalogTree(ACatalogTreeRequest: TigovCatalogTreeRequest): TigovCatalogTree;
begin
  Result := InternalExec<TigovCatalogTreeRequest, TigovCatalogTree>(ACatalogTreeRequest);
end;

function TiGovApiClient.InternalExec<TRequest, TResponse>(ARequest: TRequest): TResponse;
var
  LReq: IcaRequest;
begin
  LReq := TcaRequestArgument.ObjToRequest<TRequest>(ARequest);
  Result := FAPI.Execute<TResponse>(LReq).Data;
end;

function TiGovApiClient.Regions(ARegionRequest: TigovRegionsRequest): TArray<TigovRegion>;
begin
  Result := InternalExec < TigovRegionsRequest, TArray < TigovRegion >> (ARegionRequest);
end;

end.
