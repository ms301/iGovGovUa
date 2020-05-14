unit Unit9;

interface

uses
  iGov.Client.ASync,
  iGov.Types,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.TreeView, FMX.TabControl, FMX.ListBox, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm9 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TreeView1: TTreeView;
    GroupBox1: TGroupBox;
    Layout1: TLayout;
    edtFilterTextInput: TEdit;
    Layout2: TLayout;
    Layout3: TLayout;
    cbFilterRegion: TComboBox;
    cbFilterCity: TComboBox;
    ClearEditButton1: TClearEditButton;
    procedure cbFilterRegionChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FIgov: TiGovApiClient;
    FRegions: TArray<TigovRegion>;
  protected
    procedure LoadRegions;
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}

procedure TForm9.cbFilterRegionChange(Sender: TObject);
var
  LCity: TigovCity;
begin
  cbFilterCity.BeginUpdate;
  try
    cbFilterCity.Clear;
    for LCity in FRegions[cbFilterRegion.ItemIndex].City do
      cbFilterCity.Items.Add(LCity.Name)
  finally
    cbFilterCity.EndUpdate;
  end;
end;

procedure TForm9.FormDestroy(Sender: TObject);
begin
  FIgov.Free;
end;

procedure TForm9.LoadRegions;
begin
  FIgov.Regions(TigovRegionsRequest.Default,
    procedure(ARegions: TArray<TigovRegion>)
    var
      LRegion: TigovRegion;
    begin
      FRegions := ARegions;
      cbFilterRegion.BeginUpdate;
      try
        for LRegion in ARegions do
          cbFilterRegion.Items.Add(LRegion.Name);
      finally
        cbFilterRegion.EndUpdate;
      end;
    end);
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  FIgov := TiGovApiClient.Create;
  LoadRegions;
end;

end.
