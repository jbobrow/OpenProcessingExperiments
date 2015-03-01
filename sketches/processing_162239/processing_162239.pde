
size (300, 300);
colorMode (RGB);
background (200, 70, 50, 10);
noStroke ();
fill (200, 60, 40);
smooth ();
float radius = 0.3;
for (int deg = 0; deg < 360 * 10; deg +=15) {
  float angle = radians (deg);
  float x = 10 + (cos(angle) * radius);
  float y = 10 + (sin(angle) * radius);
  ellipse (x, y, 10, 10);
radius = radius + 0.5;
}
for (int deg = 0; deg < 360 * 10; deg +=20){
  float angle = radians (deg);
  float a = 10 + (cos(angle) * radius);
  float b = 10 + (sin(angle) * radius);
  fill (100, 100, 100, 5);
  ellipse (b, a, 290, 290);
}




  



