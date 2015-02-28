
size (800, 100);
noFill();
float angle = 0.0;
for (int x=0; x <=width; x+=5) {
  float y = 50 + (sin(angle) * 40.0);
  ellipse (x, y, 180, 180);
  angle += PI/25.0;
}
