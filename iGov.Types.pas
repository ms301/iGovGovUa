unit iGov.Types;

interface

uses
  iGov.Types.Request,
  iGov.Types.Response;

type
{$REGION 'Request'}
  TigovCatalogRequest = iGov.Types.Request.TigovCatalogRequest;
  TigovRegionsRequest = iGov.Types.Request.TigovRegionsRequest;
{$ENDREGION}
{$REGION 'Response'}
  TigovService = iGov.Types.Response.TigovService;
  TigovCategory = iGov.Types.Response.TigovCategory;
  TigovRegion = iGov.Types.Response.TigovRegion;
  TigovCity = iGov.Types.Response.TigovCity;
  TigovCatalogTree = iGov.Types.Response.TigovCatalogTree;
{$ENDREGION}

implementation

end.
