

import timeline.*;
Timeline timeline;



void setup() {
  size(400, 300, P3D);
  timeline = new Timeline(this);
}

void draw() {
  background(72, 212, 229);

  float pointWidthValueX = timeline.getValue("directionX");
  float pointHeightValueY = timeline.getValue("directionY");
  float pointHeightValueX2 = timeline.getValue("directionX2");
  float pointHeightValueY2 = timeline.getValue("directionY2");

pointLight(51, 102, pointWidthValueX, 35, 40, 36);

  lights();
  // for (int i = 0; i< 400; i++){
  translate(pointWidthValueX, pointHeightValueY);
  rotateY(width/2);
  rotateZ(height/2);
  noStroke();
  fill(105, 185, 178, 125);
  drawCylinder(0, 1200, 600, 100);

  pushMatrix();
  translate(pointHeightValueX2, pointHeightValueY2);
  noStroke();
  fill(33, 141, 155, 125);
  drawCylinder(0, 1200, 600, 100);
  popMatrix();
}

void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();


}


