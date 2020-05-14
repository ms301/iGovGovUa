unit iGov.Types.Request;

interface

uses
  CloudAPI.Attributes,
  CloudAPI.Types;

type

  [caName('catalog')]
  [caParameterType(TcaParameterType.GetOrPost)]
  TigovCatalogRequest = record
  private
    [caName('bShowEmptyFolders')]
    [caDefaultValueBoolean(False)]
    FShowEmptyFolders: Boolean;
  public
    class function Default: TigovCatalogRequest; static;
    property ShowEmptyFolders: Boolean read FShowEmptyFolders write FShowEmptyFolders;
  end;

  [caName('places/regions')]
  [caParameterType(TcaParameterType.QueryString)]
  TigovRegionsRequest = record
  public
    class function Default: TigovRegionsRequest; static;
  end;

  [caName('catalog/getCatalogTree')]
  [caParameterType(TcaParameterType.QueryString)]
  TigovCatalogTreeRequest = record
  private
    [caIsRequaired]
    [caDefaultValueInt64(-1)]
    [caName('nID_Category')]
    FID_Category: Integer;
    [caName('ShowEmptyFolders')]
    FShowEmptyFolders: Boolean;
    [caName('bNew')]
    FNew: Boolean;
    [caName('asIDPlaceUA')]
    FasIDPlaceUA: string;
    [caName('sFind')]
    [caDefaultValueString('')]
    FFind: string;
  public
    class function Default: TigovCatalogTreeRequest; static;
    property ID_Category: Integer read FID_Category write FID_Category;
    property ShowEmptyFolders: Boolean read FShowEmptyFolders write FShowEmptyFolders;
    property New: Boolean read FNew write FNew;
    property IDPlaceUA: string read FasIDPlaceUA write FasIDPlaceUA;
    property Find: string read FFind write FFind;
  end;

implementation

{ TigovCatalogRequest }

class function TigovCatalogRequest.Default: TigovCatalogRequest;
begin
  Result.FShowEmptyFolders := False;
end;

{ TigovRegionsRequest }

class function TigovRegionsRequest.Default: TigovRegionsRequest;
begin
end;

{ TigovCatalogTreeRequest }

class function TigovCatalogTreeRequest.Default: TigovCatalogTreeRequest;
begin
  Result.ID_Category := -1;
  Result.ShowEmptyFolders := False;
  Result.New := True;
  Result.IDPlaceUA := '';
  Result.Find := '';
end;

end.
