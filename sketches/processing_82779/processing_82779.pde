
size (400, 400);
background (0);
noFill();
smooth();
int radius = 40;
float offset = 5;

for (int deg = 0; deg < 360; deg += 12) {
  float angle = radians(deg);
  float x = offset + (cos(angle) * radius);
  float y = offset + (sin(angle) * radius);
  ellipse (x, y, offset, offset);
  arc (offset/2, offset/2, offset, offset, PI, PI + HALF_PI);
  stroke(offset/2, 200);
  offset += 10;
}

for (int deg = 0; deg < 200; deg += 12) {
  float angle = radians(deg);
  float x = 150 + (cos(angle) * radius);
  float y = 150 + (sin(angle) * radius);
  ellipse (x, y, offset/3, offset/3);
  arc (offset/2, offset/2, offset, offset, HALF_PI, PI);
  stroke(offset/2, 200);
  offset += 10;
}
