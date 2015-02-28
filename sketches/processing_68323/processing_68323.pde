
/*
Cardinal curve
Use mouse to control the angle and scale of the curve.
*/

void setup() {
  size(400, 400);
  background(0);
  stroke(255);
  strokeWeight(2);
  noFill();
  smooth();
}

void draw() {
  background(0);

  float x, y;
  float r;
  float ratio = 2 * mouseX * 1.0 / width;
  float crvScale = 5 * mouseY * 1.0 / height;

  beginShape();
  for (float t = 0; t < TWO_PI * ratio; t = t + 0.05) {
    r = (1 + crvScale * sin(t)) * 30;
    x = r * cos(t) + width / 2;
    y = r * sin(t) + height / 2;
    //point(round(x), round(y));
    curveVertex(round(x), round(y));
  }
  endShape();
}

