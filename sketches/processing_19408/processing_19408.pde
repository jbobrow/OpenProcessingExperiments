

import timeline.*;
Timeline timeline;



void setup() {
  size(800, 600, P3D);
  timeline = new Timeline(this);
}

void draw() {
  background(72, 212, 229);

  float pointWidthValueX = timeline.getValue("directionX");
  float pointHeightValueY = timeline.getValue("directionY");
  float pointHeightValueX2 = timeline.getValue("directionX2");
  float pointHeightValueY2 = timeline.getValue("directionY2");
  float pointHeightValueX3 = timeline.getValue("directionX3");
  float pointHeightValueY3 = timeline.getValue("directionY3");

  pointLight(51, 102, pointWidthValueX, pointHeightValueY, 40, 36);

  lights();
  translate(pointWidthValueX, pointHeightValueY);
  rotateY(300);
  rotateZ(200);
  noStroke();

  //main pin
 // pushMatrix();

  fill(105, 185, 178, MULTIPLY);
  drawPin(0, 1200, 800, 200);
 // popMatrix();

  // 2nd pin
  pushMatrix();
  translate(pointHeightValueX2, pointHeightValueY2);
  noStroke();
  fill(103, 222, 169, MULTIPLY);
  drawPin(0, 1200, 800, 100);
  popMatrix();

  //3rd pin
  pushMatrix();
  translate(pointHeightValueX3, pointHeightValueY3);
  noStroke();
  fill(63, 188, 128, MULTIPLY);
  drawPin(0, 1200, 800, 100);
  popMatrix();
}

void drawPin(float pin, float base, float flex, int smoothing) {
  float angle = 0;
  float angleIncrement = TWO_PI / smoothing;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < smoothing + 1; ++i) {
    vertex(pin*cos(angle), 0, pin*sin(angle));
    vertex(base*cos(angle), flex, base*sin(angle));
    angle += angleIncrement;
  }
  endShape();
}


