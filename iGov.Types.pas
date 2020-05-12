unit iGov.Types;

interface

uses
  System.JSON.Serializers;

type
  TigovService = class
  private
    [JsonName('aServiceData')]
    FServiceData: TArray<string>;
    [JsonName('nID')]
    FID: Integer;
    [JsonName('nID_Status')]
    FID_Status: Integer;
    [JsonName('nOpenedLimit')]
    FOpenedLimit: Integer;
    [JsonName('nOrder')]
    FOrder: Integer;
    [JsonName('nStatus')]
    FStatus: Integer;
    [JsonName('nSub')]
    FSub: Integer;
    [JsonName('sFAQ')]
    FFAQ: string;
    [JsonName('sInfo')]
    FInfo: string;
    [JsonName('sLaw')]
    FLaw: string;
    [JsonName('sName')]
    FName: string;
    [JsonName('sSubjectOperatorName')]
    FSubjectOperatorName: string;
    [JsonName('saKeyword')]
    FKeyword: string;
  public
    property ServiceData: TArray<string> read FServiceData write FServiceData;
    property ID: Integer read FID write FID;
    property IDStatus: Integer read FID_Status write FID_Status;
    property OpenedLimit: Integer read FOpenedLimit write FOpenedLimit;
    property Order: Integer read FOrder write FOrder;
    property Status: Integer read FStatus write FStatus;
    property Sub: Integer read FSub write FSub;
    property FAQ: string read FFAQ write FFAQ;
    property Info: string read FInfo write FInfo;
    property Law: string read FLaw write FLaw;
    property Name: string read FName write FName;
    property SubjectOperatorName: string read FSubjectOperatorName write FSubjectOperatorName;
    property Keyword: string read FKeyword write FKeyword;
  end;

  TigoCatalogTree = class
  private
    [JsonName('aService')]
    FService: TArray<TigovService>;
  public
    property Service: TArray<TigovService> read FService write FService;

  end;

  TigovCity = class
  private
    [JsonName('nID')]
    FID: Integer;
    [JsonName('sID_UA')]
    FIDText: string;
    [JsonName('sName')]
    FName: string;
  public
    property ID: Integer read FID write FID;
    property IDText: string read FIDText write FIDText;
    property Name: string read FName write FName;
  end;

  TigovRegion = class
  private
    [JsonName('nID')]
    FID: Integer;
    [JsonName('sID_UA')]
    FIDText: string;
    [JsonName('sName')]
    FName: string;
    [JsonName('aCity')]
    FCity: TArray<TigovCity>;
  public
    property ID: Integer read FID write FID;
    property IDText: string read FIDText write FIDText;
    property Name: string read FName write FName;
    property City: TArray<TigovCity> read FCity write FCity;
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
    FID: Integer;
    [JsonName('nOrder')]
    FOrder: Integer;
    [JsonName('sID')]
    FIDText: string;
    [JsonName('sName')]
    FName: string;
  public
    property Subcategory: TArray<TSubCategory> read FSubcategory write FSubcategory;
    property ID: Integer read FID write FID;
    property Order: Integer read FOrder write FOrder;
    property IDText: string read FIDText write FIDText;
    property Name: string read FName write FName;
  end;

implementation

end.
