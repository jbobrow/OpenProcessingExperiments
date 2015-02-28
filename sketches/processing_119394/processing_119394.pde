
void setup() {
size (displayWidth, displayHeight) ;
background (89,63,140);
}
void draw() {
  int c = 44; 
  int o = 3;
  int l = 22;
  int p = 70;
  int z = 10;
for (int y = 1; y <= 5000; y += 10) {
  c += 44 ;
  o += 10;
  l += 13;
  p = p += 33;
  z = z += 20 ;
  for (int x = 1; x <= 5000; x = x += 88) {
    fill (c, o, l);
    quad (x, y, p, z, x + 20, y + 20, p + 27, z + 35) ;
  }
  
}
 int t = 200;
 int r = 255;
 int i = 243;
 int b = 5;
 for (int a = 1; a <=2000; a += 20) {
   t += 88 ;
   r -= 2;
   i -= 6;
   b += 3;
   fill (r, i, b);
triangle (t, a, 250, a + 60, 180, a + 35);  
 }


fill (50, 234, 85);
ellipse (300, 1000, 200, 200);

fill (234, 50, 84);
ellipse (400, 1070, 200, 200);

fill (50, 162, 234);
ellipse (500, 1000, 200, 200);

fill (120, 234, 85);
ellipse (600, 1070, 200, 200);
}



