program Daftar_gaji_Pegawai;
{I.S. : user memasukkan array NIP, Nama, Golongan, Status, dan Jumlah Anak}
{F.S. : menampilkan daftar gaji total pegawai}
uses crt;

const
  Maks_Peg = 50;

type
  Larik1 = array[1..Maks_Peg] of String;
  Larik2 = array[1..Maks_Peg] of integer;
  Larik3 = array[1..Maks_Peg] of real;

var
  NIP, Nama, Status : Larik1;
  Gol, JumAnak      : Larik2;
  PPN, Gatot        : larik3;

function GajiPokok(Gol : integer):integer;
{I.S. : Gogolongan sudah terdefinisi}
{F.S. : menghasilkan fungsi gaji pokok}
begin
  case (Gol) of
      1 : GajiPokok := 1250000;
      2 : GajiPokok := 1350000;
      3 : GajiPokok := 1500000;
      4 : GajiPokok := 1750000;
  end;//end case
end;//end function

function Tunjangan(Gol, Gapok : integer): real;
{I.S. : Gogolongan dan gaji pokok sudah terdefinisi}
{F.S. : menghasilkan fungsi tunjangan}
begin
  case (Gol) of
      1 : Tunjangan := 0.1 * Gapok;
      2 : Tunjangan := 0.125 * Gapok;
      3 : Tunjangan := 0.15 * Gapok;
      4 : Tunjangan := 0.2 * Gapok;
  end;//end case
end;//end function

function TunjanganAnak(Status : String; JumAnak : integer): integer;
begin
if(status = 'M')or(status = 'm')and(JumAnak > 3)
 then
  TunjanganAnak := 150000 * 3
 else
  TunjanganAnak := 150000 * JumAnak;
end;

function Pajak(Gatot : real): real;
begin
 Pajak := 0.1 * Gatot;
end;

procedure IsiData(var Gol, JumAnak : Larik2; var Status : Larik1);
{I.S. : user memasukkan array NIP, Nama, Golongan, Status, dan Jumlah Anak}
{F.S. : menampilkan daftar gaji total pegawai}
var
  i, gapok : integer;

begin
   gotoxy(28,1);
   write('Daftar Gaji Total Pegawai');
   gotoxy(1,2);
   write('--------------------------------------------------------------------------------');
   gotoxy(1,3);
   write('|   NIP   |   Nama   | Gol | Status | Anak |      PPN      |     Gaji Total    |');
   gotoxy(1,4);
   write('--------------------------------------------------------------------------------');


   //memasukan data pertama
   i := 1;
   gotoxy(1,i+4);
   write('|         |          |     |        |      | Rp.           | Rp.               |');
   gotoxy(3,i+4);readln(NIP[i]);
   while(nip[i]<>'stop')do
   begin
     gotoxy(13,i+4);readln(Nama[i]);
     gotoxy(24,i+4);readln(Gol[i]);
     gotoxy(32,i+4);readln(Status[i]);

     if(Status[i] = 'M')or(status[i] = 'm')
     then
      begin
        gotoxy(40,i+4);readln(JumAnak[i]);
      end
     else
      begin
        gotoxy(40,i+4);write('-');
      end;

     //menghitung gaji total dan PPN
     Gapok    := GajiPokok(Gol[i]);
     Gatot[i] := Gapok + Tunjangan(Gol[i], Gapok) + TunjanganAnak(Status[i], JumAnak[i]);
     PPN[i]   := Pajak(Gatot[i]);
     Gatot[i] := Gatot[i] - PPN[i];

     //Menampilkan PPN dan gaji total
     gotoxy(50,i+4);write(PPN[i]:0:2);
     gotoxy(66,i+4);write(Gatot[i]:0:2);

     //memasukan data berikutnya
     i := i+1;
     gotoxy(1,i+4);
     write('|         |          |     |        |      | Rp.           | Rp.               |');
     gotoxy(3,i+4);readln(NIP[i]);

   end;//endwhile
   gotoxy(1,i+4);
   write('--------------------------------------------------------------------------------');
end;//end procedure

begin
   IsiData(Gol, JumAnak, Status);
   readln;
end.
