
void setup() {

  size(500, 300);
  background(255);
  strokeWeight(2);
  smooth();
}

void draw() {

  stroke(20, 50, 70);
  float radius = 100;
  float x, y;
  float lastx = -999;
  float lasty = -999;
  float centX = 250;
  float centY = 150;
  for (float ang=0; ang<=360*6; ang+=50) {
    radius += 0.8;
    float rad = radians(ang);
    x = centX + (radius * cos(rad));
    y = centY + (radius * sin(rad));
    point(x, y);
    if (lastx > -999) {
      line(x, y, lastx, lasty);
    }
    lastx = x;
    lasty = y;
  }
}


