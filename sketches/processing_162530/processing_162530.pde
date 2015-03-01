
size (300, 300);
colorMode (RGB);
background (156, 186, 203);
smooth ();
translate (width/2, height/2);
for (int i = 0; i < 20 ; i ++) {
beginShape (TRIANGLES);
noStroke ();
fill (252, 172, 10, i * 10);
vertex (0, 0);
vertex (75, - 100);
vertex (80, - 50);
rotate (PI/12);
vertex (0, 0);
vertex (75, - 100);
vertex (80, - 50);
rotate (PI/12);
vertex (0, 0);
vertex (75, - 100);
vertex (80, - 50);
endShape ();
}




