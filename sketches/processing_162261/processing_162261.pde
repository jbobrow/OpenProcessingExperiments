
size (300, 300);
colorMode (RGB);
background (10, 100, 80);
noStroke ();
smooth ();
fill (15, 150, 150, random (50, 150));
float r = random (50, 100);
float a = random (90, 140);
float b = random (100, 150);
ellipse (r, a, b, r);
ellipse (a, b, r, a);
ellipse (b, r, a, b);
r = r * 2;
a = a * 2;
b = b * 2;
ellipse (r, a, b, r);
ellipse (a, b, r, a);
ellipse (b, r, a, b);
ellipse (r, a, b, r);
ellipse (a, b, r, a);
ellipse (b, r, a, b);
r = r/2;
a = a/2;
b = b/2;
ellipse (r, a, b, r);
ellipse (a, b, r, a);
ellipse (b, r, a, b);
strokeWeight (1);
stroke (255, 50);
for (int i =0; i < 300; i++){
  float c = random (0, 300);
  float d = random (0, 300);
  line (c, 0, 0, d);
  line (0, c, 0, d);
}




