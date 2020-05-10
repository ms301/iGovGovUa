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
  FAPI.BaseUrl := 'https://igov.gov.ua/api/catalog?bShowEmptyFolders=false';
end;

destructor TiGovApiClient.Destroy;
begin
  FAPI.Free;
  inherited;
end;

end.
