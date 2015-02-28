
// Learning Processing Example 14-6, 7, 8, 9. Rotational axes.

float theta = 0.0;

void setup() {
  size(750, 300, P3D);
}

void draw() {
  background(200);
  stroke(0);
  fill(100);
  pushMatrix();
  translate(150, height / 2);
  rotateX(theta);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  pushMatrix();
  translate(300, height / 2);
  rotateY(theta);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  pushMatrix();
  translate(450, height / 2);
  rotateZ(theta);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  pushMatrix();
  translate(600, height / 2);
  rotateX(theta);
  rotateY(theta);
  rotateZ(theta);
  rectMode(CENTER);
  rect(0, 0, 100, 100);
  popMatrix();
  theta += 0.01;
}

