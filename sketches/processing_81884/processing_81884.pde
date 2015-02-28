
size(800, 800);
smooth();
stroke(97, 78, 157);

float scaleVal = 20.0;
float angleInc = PI/50.0;
float angle = 0.0;
for (int offset = -10; offset < width+20; offset += 40) {
  for (int x = -10; x <= height+40; x += 4) {
    float y = offset + (cos(angle) * scaleVal);
    fill(120, 242, 176, random(100));
    strokeWeight(x/200);
    ellipse(x, y, 80, 80);
    angle += angleInc;
  }
  angle += PI;
}
