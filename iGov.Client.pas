unit iGov.Client;

interface

uses
  CloudAPI.Client.Sync;

type
  TiGovApiClient = class
    FAPI: TCloudApiClient;
  public
    constructor Create;
    destructor Destroy; override;
    function Catalog: string;
  end;

implementation

{ TiGovApiClient }

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
