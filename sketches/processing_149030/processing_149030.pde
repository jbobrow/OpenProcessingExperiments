
// JU Hwiyeon
// 201420109

void setup() {
  size (600,600);
  smooth();
}

void draw() {
  background(0 ,30,30,30);
  fill(0, 30);
  rectMode(LEFT);
  rect(0, 0, width, height);
  rot (mouseX, mouseY);
}

void rot(float a, float b) {
  noStroke();
  pushMatrix();
  fill(#CBFFFF,50);
  translate(a, b);
  rectMode(CENTER);
  rotate(float(mouseX)/50);
  rect(0, 0, 300, 300);
  rotate(float(mouseX)/30);
  rect(0, 0, 200, 200);
  rotate(float(mouseX)/10);
  rect(0, 0, 100, 100);
  rotate(float(mouseX/2)/50);
  rect(0, 0, 150, 300);
  rotate(float(mouseX/2)/30);
  rect(0, 0, 200, 100);
  rotate(float(mouseX/2)/10);
  rect(0, 0, 50, 100);
  popMatrix();
