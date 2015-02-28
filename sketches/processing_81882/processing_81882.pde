
size(800, 800);
smooth();
noStroke();

float scaleVal = 20.0;
float angleInc = PI/20.0;
float angle = 0.0;
for (int offset = 0; offset < width; offset += 25) {
  for (int y = -10; y <= height; y += 10) {
    float x = offset + (sin(angle) * scaleVal);
    fill(random(450),random(450),random(130));
    rect(x, y, 100, 100);
    angle += angleInc;
  }
angle += PI; 

}
