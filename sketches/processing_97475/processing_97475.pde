
// Cindy Feijó, 2S2012
// Reforço 2 - original
// Usando cores frias

size (200,200);
background (138, 43, 226); //Blue Violet
strokeWeight (3);
smooth ();

int y=20;
for (int x=19; x<80; x=x+10){ //condição
stroke (64, 224, 208); // Turquoise a partir de x=60
 if (x<60) {
 stroke (0); // Preto até x=60
 }
 line (40, x*x/35, 120, y-10); //linha base
 y=y+12; //repetição variável
 }
