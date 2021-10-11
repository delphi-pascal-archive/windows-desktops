unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ExtCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    XPManifest1: TXPManifest;
    Edit2: TEdit;
    Button7: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Button7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
GENERIC_Desktop_ALL = DESKTOP_CREATEMENU or
DESKTOP_CREATEWINDOW or
DESKTOP_ENUMERATE    or
DESKTOP_HOOKCONTROL   or
DESKTOP_JOURNALPLAYBACK  or
DESKTOP_JOURNALRECORD    or
DESKTOP_READOBJECTS      or
DESKTOP_SWITCHDESKTOP     or
DESKTOP_WRITEOBJECTS      or
STANDARD_RIGHTS_REQUIRED;

procedure TForm1.Button1Click(Sender: TObject);

begin
CreateDesktop(PChar(Edit1.Text), nil, nil, DF_ALLOWOTHERACCOUNTHOOK, GENERIC_Desktop_ALL, nil);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
SwitchDesktop(OpenDesktop(PChar(Edit1.Text),DF_ALLOWOTHERACCOUNTHOOK, false, GENERIC_Desktop_ALL));
end;

function EnumDesktopProc(lpszDesktop: PChar;LPARAM: lParam): LongBool; stdcall;
begin
 TListBox(LPARAM).Items.Add(lpszDesktop);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 ListBox1.Clear;
 EnumDesktops(GetProcessWindowStation, @EnumDesktopProc, LPARAM(ListBox1));
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
 Edit1.Text:=ListBox1.Items.Strings[ListBox1.ItemIndex];
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 SwitchDesktop(OpenDesktop('default', DF_ALLOWOTHERACCOUNTHOOK, false, GENERIC_ALL));
end;

procedure TForm1.Button5Click(Sender: TObject);
var
 Si : TStartupInfo;
 PrI : TProcessInformation;
 Cmd: PChar;
begin
 Cmd:=PChar(Edit2.Text);
 FillChar(Si, SizeOf(Si), 0);
 Si.cb:=SizeOf(Si);
 Si.dwFlags:=STARTF_USESHOWWINDOW;
 Si.wShowWindow:=1;
 Si.lpDesktop:=PChar(Edit1.Text);
 CreateProcess(nil, Cmd, nil, nil, false,
       CREATE_DEFAULT_ERROR_MODE or NORMAL_PRIORITY_CLASS, nil, nil ,Si , PrI);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 SwitchDesktop(OpenDesktop('default', DF_ALLOWOTHERACCOUNTHOOK, false, GENERIC_ALL));
 Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 SwitchDesktop(OpenDesktop(PChar(Edit1.Text),DF_ALLOWOTHERACCOUNTHOOK, false, GENERIC_Desktop_ALL));
 Timer1.Enabled:=False;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 Timer1.Enabled:=true;
end;

end.
