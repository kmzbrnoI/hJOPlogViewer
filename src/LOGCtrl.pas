unit LOGCtrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, XPMan;

type
  TForm1 = class(TForm)
    LV_log: TListView;
    P_Prj_pozadi: TPanel;
    B_LoadFile: TButton;
    OD_Open: TOpenDialog;
    CHB_Vybarvovani: TCheckBox;
    procedure B_LoadFileClick(Sender: TObject);
    procedure LV_logCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure CHB_VybarvovaniClick(Sender: TObject);
    procedure LV_logDblClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

uses ShowRadek;

{$R *.dfm}

procedure TForm1.B_LoadFileClick(Sender: TObject);
var f:TextFile;
    i:Integer;
    LI:TListItem;
    parsed:TStrings;
    line:string;
    ignore:boolean;
 begin
  if (not Self.OD_Open.Execute) then Exit();

  try
   AssignFile(f, Self.OD_Open.FileName);
   Reset(f);
  except
   on E:Exception do
    begin
     Application.MessageBox(PCHar('Soubor '+Self.OD_Open.FileName+' se nepodaøilo otevøít'+#13#10+E.Message), 'Nelze otevøít soubor', MB_OK OR MB_ICONWARNING);
     Exit();
    end;
  end;

  parsed := nil;
  try
    parsed := TStringList.Create();
    Form1.LV_log.Clear();

    i      := 0;
    ignore := false;
    while (not Eof(f)) do
     begin
      ReadLn(f, line);

      parsed.Clear();
      ExtractStrings([';'], [], PChar(line), parsed);

      LI := Self.LV_log.Items.Add();
      LI.Data := Pointer(clWhite);
      LI.Caption  := IntToStr(i+1);
      LI.SubItems.Add('?');
      LI.SubItems.Add('?');
      LI.SubItems.Add('?');
      LI.SubItems.Add('?');

      try
       LI.Data := Pointer(StringToColor(parsed[4]));
       LI.SubItems.Strings[0] := parsed[0];
       LI.SubItems.Strings[1] := parsed[3];
       LI.SubItems.Strings[2] := parsed[1];
       LI.SubItems.Strings[3] := parsed[2];

      except
       on E:Exception do
         if ((not ignore) and (Application.MessageBox(PChar('Nelze naèíst øádek '+IntToStr(i+1)+#13#10+E.Message+#13#10+'Ignorovat další chyby?'), 'Chyba', MB_YESNO OR MB_ICONWARNING OR MB_DEFBUTTON2) = mrYes)) then
           ignore := true;
      end;//except

      Inc(i);
     end;//while
  finally
   parsed.Free();
   CloseFile(f);
   Self.LV_log.Repaint();
  end;
 end;//procedure

procedure TForm1.LV_logCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
 begin
  if (CHB_Vybarvovani.Checked) then
   begin
    LV_log.Canvas.Brush.Color := TColor(LV_log.Items.Item[Item.Index].Data);
   end else begin
    LV_log.Canvas.Brush.Color := clWhite;
   end;
 end;//procedure

procedure TForm1.CHB_VybarvovaniClick(Sender: TObject);
 begin
  LV_log.Repaint;
 end;//procedure

procedure TForm1.LV_logDblClick(Sender: TObject);
 begin
  if (LV_log.Selected <> nil) then
   begin
    F_ShowRadek.OpenForm(StrToIntDef(LV_log.Items.Item[LV_log.ItemIndex].Caption,0)-1);
   end;//if LV_log.Selected <> nil
 end;//procedure

end.//unit
