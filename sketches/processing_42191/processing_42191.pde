
PFont TimesNewRoman;
float y = 600;

void setup() {
  size (440, 600);
  TimesNewRoman = loadFont ("TimesNewRomanPS.vlw");
}

void draw() {
  background(255);
  fill(0);
  textFont (TimesNewRoman, 20);
 String c = "Ora rivoglio bianche tutte le mie lettere, inaudito il mio nome, la mia grazia richiusa; ch'io mi distenda sul quadrante dei giorni, riconduca la vita a mezzanotte."; 
 String d = "E la mia valle rosata dagli uliveti e la città intricata dei miei amori siano richiuse come breve palmo,";
 String e = "il mio palmo segnato da tutte le mie morti. ";
 String f = "O Anatolia disteso dalla sua voce, voglio destarmi sulla via di Damasco — né mai lo sguardo aver levato a un cielo altro dal suo, da tanta gioia in croce."; 
 String g = "Cristina Campo";
  text (c, 40, y, 380, 300);
  text (d, 40, y+120, 280, 300);
  text (e, 40, y+194, 360, 300);
  text (f, 40, y+240, 330, 300);
  text (g, 40, y+360, 330, 300);
  y -= 0.4;
  if (y < -400) {
    y = height;
  }
}






