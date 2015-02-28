

void setup() {
  size(600, 600);
  background(255);
  frameRate(1);
  smooth();
  ellipseMode(CENTER);
}

void draw() {
  translate(300, 300);
  translate(random(300), random(300));
  translate(-random(300), -random(300));
  rotate(random(2*PI));
  rotate(-random(2*PI));
  drawFlag();
}

void drawFlag() {
  float srcX = 0;
  float srcY = 100;
  float h = random(28) + 190;
  float destX = srcX;
  float destY = srcY - h;
  stroke(0);
  strokeWeight(1.8);
  noFill();
  bezier(srcX, srcY, srcX - 12, srcY - (h/2), destX, destY, destX, destY);
  line(destX, destY, destX + 18, destY + 10);
  line(destX + 18, destY + 10, destX - 1, destY + 19);
  fill(128, 0, 0);
  ellipse(srcX, srcY, 10.0, 10.0);
  //show the control point
  //stroke(128, 0, 0);
  //strokeWeight(1.0);
  //line(srcX, srcY, srcX - 12, srcY - (h/2));
}

