unit iGov.Client.ASync;

interface

uses
  CloudAPI.Client.ASync,
  iGov.Types.Response,
  iGov.Types.Request, System.SysUtils;

type
  TiGovApiClient = class
  private
    FAPI: TCloudApiClient;
  protected
    procedure InternalExec<TRequest: record; TResponse>(ARequest: TRequest; OnResponse: TProc<TResponse>);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Catalog(ACatalogRequest: TigovCatalogRequest; OnResponse: TProc < TArray < TigovCategory >> );
    procedure Regions(ARegionRequest: TigovRegionsRequest; OnResponse: TProc < TArray < TigovRegion >> );
    procedure getCatalogTree(ACatalogTreeRequest: TigovCatalogTreeRequest; OnResponse: TProc<TigovCatalogTree>);
  end;

implementation

uses
  CloudAPI.Request,
  CloudAPI.RequestArgument,
  CloudAPI.Response,
  CloudAPI.Types;

{ TiGovApiClient }

procedure TiGovApiClient.Catalog(ACatalogRequest: TigovCatalogRequest; OnResponse: TProc < TArray < TigovCategory >> );
begin
  InternalExec < TigovCatalogRequest, TArray < TigovCategory >> (ACatalogRequest, OnResponse);
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

procedure TiGovApiClient.getCatalogTree(ACatalogTreeRequest: TigovCatalogTreeRequest;
  OnResponse: TProc<TigovCatalogTree>);
begin
  InternalExec<TigovCatalogTreeRequest, TigovCatalogTree>(ACatalogTreeRequest, OnResponse);
end;

procedure TiGovApiClient.InternalExec<TRequest, TResponse>(ARequest: TRequest; OnResponse: TProc<TResponse>);
var
  LReq: IcaRequest;
begin
  LReq := TcaRequestArgument.ObjToRequest<TRequest>(ARequest);
  FAPI.Execute<TResponse>(LReq,
    procedure(FOnResponse: IcaResponse<TResponse>)
    begin
      if Assigned(OnResponse) then
        OnResponse(FOnResponse.Data);
    end);
end;

procedure TiGovApiClient.Regions(ARegionRequest: TigovRegionsRequest; OnResponse: TProc < TArray < TigovRegion >> );
begin
  InternalExec < TigovRegionsRequest, TArray < TigovRegion >> (ARegionRequest, OnResponse);
end;

end.
