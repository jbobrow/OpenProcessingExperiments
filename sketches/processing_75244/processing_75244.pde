
float mouseLoc;
float rotateAngle;

void setup() {
  size(900, 600);
  smooth();
  ellipseMode(CENTER);
  frameRate(20);
}

void draw() {
  background(120);

  // use push and pop-matrix to ensure
  // that coordinate system is not shifted
  // over time, and the dots/triangle remains static

  pushMatrix();
  translate((width/2)-250, (height/2)-50);
  stroke(12,234,56);
  noFill();

  drawEllipse(0, 0, width, height, 1.1, 8);
  drawEllipse(0, 0, width, height, 1.2, 16);
  drawEllipse(50, 50, width, height, 1.3, 24);
  drawEllipse(-50, -50, width, height, 1.4, 36);
  drawEllipse(100, 100, width, height, 1.4, 36);
  popMatrix();

  drawMousePoints();
}

// A recursive function to draw multiple ellipse
// that shift their location based on the mouse location

void drawEllipse(float x, float y, float w, float h, float proximity, float angle) {
  smooth();

  mouseLoc = (mouseX+mouseY) / 2 + width/2;

  stroke (random(150, 255), 67, 67, random(140, 170));

  ellipse(x, y, w, h);

  rotateAngle = map(mouseLoc, 0, max(width, height), 0, 180);
  rotate(radians(rotateAngle));

  translate(-width/4, -height/4);

  stroke (255);
  //loop
  if (w >= 1 && h >= 1) {
    drawEllipse(0, 0, w/proximity, h/proximity, proximity, angle);
  }
}

// This is to highlight a few interesting spots where order emerges.
void drawMousePoints() {
  fill(253, 10, 0, 180);
  noStroke();
  ellipse(99, 201, 8, 8);
  ellipse(516, 25, 8, 8);
  ellipse(360, 541, 8, 8);
  stroke(0, 0, 255,150);
  noFill();
  fill(0, 0, 255, 5);
  triangle(99, 201, 516, 25, 360, 541);
}
