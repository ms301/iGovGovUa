program Project12;

uses
  Vcl.Forms,
  Unit9 in 'Unit9.pas' {Form9},
  iGov.Client in '..\iGov.Client.pas',
  iGov.Types.Response in '..\iGov.Types.Response.pas',
  CloudAPI.Attributes in '..\CloudAPI\CloudAPI.Attributes.pas',
  CloudAPI.Authenticator.Basic in '..\CloudAPI\CloudAPI.Authenticator.Basic.pas',
  CloudAPI.Client.Async in '..\CloudAPI\CloudAPI.Client.Async.pas',
  CloudAPI.Client.Base in '..\CloudAPI\CloudAPI.Client.Base.pas',
  CloudAPI.Client.Sync in '..\CloudAPI\CloudAPI.Client.Sync.pas',
  CloudAPI.Converter.BasicTypes in '..\CloudAPI\CloudAPI.Converter.BasicTypes.pas',
  CloudAPI.Core.RequestBuilder in '..\CloudAPI\CloudAPI.Core.RequestBuilder.pas',
  CloudAPI.Exceptions in '..\CloudAPI\CloudAPI.Exceptions.pas',
  CloudAPI.Ext.MethodLimits in '..\CloudAPI\CloudAPI.Ext.MethodLimits.pas',
  CloudAPI.IAuthenticator in '..\CloudAPI\CloudAPI.IAuthenticator.pas',
  CloudAPI.Json.Converters in '..\CloudAPI\CloudAPI.Json.Converters.pas',
  CloudAPI.LongPolling in '..\CloudAPI\CloudAPI.LongPolling.pas',
  CloudAPI.MethodLimits in '..\CloudAPI\CloudAPI.MethodLimits.pas',
  CloudAPI.Parameter in '..\CloudAPI\CloudAPI.Parameter.pas',
  CloudAPI.Request in '..\CloudAPI\CloudAPI.Request.pas',
  CloudAPI.RequestArgument in '..\CloudAPI\CloudAPI.RequestArgument.pas',
  CloudAPI.Response in '..\CloudAPI\CloudAPI.Response.pas',
  CloudAPI.Types in '..\CloudAPI\CloudAPI.Types.pas',
  iGov.Types.Request in '..\iGov.Types.Request.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
