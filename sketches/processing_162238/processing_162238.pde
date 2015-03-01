
size (700, 100);
colorMode (RGB);
background (50, 80, 37, 50);
noStroke ();
smooth ();
float angle = 0.0;
float offset = 50.0;
float scaleVal = 25.0;
float angleInc = PI/10.0;
for (int x = 0; x <= width; x += 10) {
  float y = offset + (sin(angle) * scaleVal);
  fill (42, 121, 9, 150);
  ellipse (x, y, 20, 40);
  fill (0);
  angle += angleInc;
  fill (28, 77, 8, 50);
  ellipse (x + 10, y +10, 20, 40);
  fill (61, 185, 9, 50);
  ellipse (x -15, y -15, 20, 40);
  fill (69, 214, 9, 50);
  ellipse (x - 25, y - 25, 20, 40);

}





