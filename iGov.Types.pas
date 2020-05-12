unit iGov.Types;

interface

uses
  System.JSON.Serializers;

type
  TIgoCity = class
  private
    [JsonName('nID')]
    FID: integer;
    [JsonName('sID_UA')]
    FIDText: string;
    [JsonName('sName')]
    FName: string;
  public
    property ID: integer read FID write FID;
    property IDText: string read FIDText write FIDText;
    property Name: string read FName write FName;
  end;

  TigoRegions = class
  private
    [JsonName('nID')]
    FID: integer;
    [JsonName('sID_UA')]
    FIDText: string;
    [JsonName('sName')]
    FName: string;
    [JsonName('aCity')]
    FCity: TArray<TIgoCity>;
  public
    property ID: integer read FID write FID;
    property IDText: string read FIDText write FIDText;
    property Name: string read FName write FName;
    property City: TArray<TIgoCity> read FCity write FCity;
  end;

  TService = class
  private
    FOpenedLimit: integer;
    FSubjectOperatorName: string;
    FKeyword: string;
  public
    property OpenedLimit: integer read FOpenedLimit write FOpenedLimit;
    property SubjectOperatorName: string read FSubjectOperatorName write FSubjectOperatorName;
    property Keyword: string read FKeyword write FKeyword;
  end;

  TSubCategory = class
  private
    [JsonName('aSubcategory')]
    FService: TArray<TSubCategory>;
  public
    property Service: TArray<TSubCategory> read FService write FService;
  end;

  TCategory = class
  private
    [JsonName('aSubcategory')]
    FSubcategory: TArray<TSubCategory>;
    [JsonName('nID')]
    FID: integer;
    [JsonName('nOrder')]
    FOrder: integer;
    [JsonName('sID')]
    FIDText: string;
    [JsonName('sName')]
    FName: string;
  public
    property Subcategory: TArray<TSubCategory> read FSubcategory write FSubcategory;
    property ID: integer read FID write FID;
    property Order: integer read FOrder write FOrder;
    property IDText: string read FIDText write FIDText;
    property Name: string read FName write FName;
  end;

implementation

end.
