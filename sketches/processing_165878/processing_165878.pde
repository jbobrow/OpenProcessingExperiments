
size(480, 480);
background(255);
rectMode(CENTER);
fill(0);
noStroke();

//Länge
int l=50;
//Breiten
int b1=4; int b2=8; int b3=16; int b4=20; int b5=24; int b6=28; int b7=32; int b8=36;

//X-Positionen
int x1=30; int x2=90; int x3=150; int x4=210; int x5=270; int x6=330; int x7=390; int x8=450;
//Y-Positionen
int y1=30; int y2=90; int y3=150; int y4=210; int y5=270; int y6=330; int y7=390; int y8=450;

//1. Reihe
//rect(x1, y1, l, b1);
//rect(x2, y1, b1, l);
//rect(x3, y1, l, b1);
//rect(x4, y1, b1, l);
rect(x5, y1, l, b1);
rect(x6, y1, b1, l);
rect(x7, y1, l, b1);
rect(x8, y1, b1, l);

//2. Reihe
rect(x1, y2, b2, l);
rect(x2, y2, l, b2);
rect(x3, y2, b2, l);
rect(x4, y2, l, b2);
rect(x5, y2, b2, l);
rect(x6, y2, l, b2);
rect(x7, y2, b2, l);
rect(x8, y2, l, b2);

//3. Reihe
rect(x1, y3, l, b3);
rect(x2, y3, b3, l);
rect(x3, y3, l, b3);
rect(x4, y3, b3, l);
rect(x5, y3, l, b3);
rect(x6, y3, b3, l);
rect(x7, y3, l, b3);
rect(x8, y3, b3, l);

//4. Reihe
rect(x1, y4, b4, l);
rect(x2, y4, l, b4);
rect(x3, y4, b4, l);
rect(x4, y4, l, b4);
rect(x5, y4, b4, l);
rect(x6, y4, l, b4);
rect(x7, y4, b4, l);
rect(x8, y4, l, b4);

//5. Reihe
rect(x1, y5, l, b5);
rect(x2, y5, b5, l);
rect(x3, y5, l, b5);
rect(x4, y5, b5, l);
rect(x5, y5, l, b5);
rect(x6, y5, b5, l);
rect(x7, y5, l, b5);
rect(x8, y5, b5, l);

//6. Reihe
rect(x1, y6, b6, l);
rect(x2, y6, l, b6);
rect(x3, y6, b6, l);
rect(x4, y6, l, b6);
rect(x5, y6, b6, l);
rect(x6, y6, l, b6);
rect(x7, y6, b6, l);
rect(x8, y6, l, b6);

//7. Reihe
rect(x1, y7, l, b7);
rect(x2, y7, b7, l);
rect(x3, y7, l, b7);
rect(x4, y7, b7, l);
rect(x5, y7, l, b7);
rect(x6, y7, b7, l);
rect(x7, y7, l, b7);
rect(x8, y7, b7, l);

//8. Reihe
rect(x1, y8, b8, l);
rect(x2, y8, l, b8);
rect(x3, y8, b8, l);
rect(x4, y8, l, b8);
rect(x5, y8, b8, l);
rect(x6, y8, l, b8);
rect(x7, y8, b8, l);
rect(x8, y8, l, b8);

//Text
PFont font;
smooth ();
font = loadFont ("HelveticaNeue-Medium-36.vlw");
textFont (font);
textSize (28);
text ("creativecoding", 35, 40);

