unit ShowRadek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TF_ShowRadek = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    L_Cas: TLabel;
    L_Vyznam: TLabel;
    L_ErrorID: TLabel;
    M_Message: TMemo;
  private
    { Private declarations }
  public
   procedure OpenForm(Radek:Integer);
  end;

var
  F_ShowRadek: TF_ShowRadek;

implementation

uses LOGCtrl;

{$R *.dfm}

procedure TF_ShowRadek.OpenForm(Radek:Integer);
 begin
  L_Cas.Caption     := Form1.LV_log.Items.Item[Radek].SubItems.Strings[0];
  M_Message.Text    := Form1.LV_log.Items.Item[Radek].SubItems.Strings[1];
  L_Vyznam.Caption  := Form1.LV_log.Items.Item[Radek].SubItems.Strings[2];
  L_ErrorID.Caption := Form1.LV_log.Items.Item[Radek].SubItems.Strings[3];

  F_ShowRadek.Caption := 'ÿ·dek '+Form1.LV_log.Items.Item[Radek].Caption;
  F_ShowRadek.ShowModal;
 end;//procedure

end.//unit
