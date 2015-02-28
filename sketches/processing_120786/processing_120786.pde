
// Learning Processing Example 14-10. Rotating pyramids. Thanks Shiffman!

float theta = 0.0;

void setup() {
  size(400, 400, OPENGL);
}

void draw() {
  theta += 0.01;
  background(200);
  translate(100, 100, 0);
  rotateX(theta);
  rotateY(theta);
  drawPyramid(50);
  pushMatrix();
  translate(50, 50, 20);
  rotateX(-theta);
  rotateY(-theta);
  drawPyramid(10);
  popMatrix();
}

void drawPyramid(int size) {
  beginShape(TRIANGLES);

  fill(150, 0, 0, 127);
  vertex(-size, -size, -size);
  vertex(size, -size, -size);
  vertex(0, 0, size);

  fill(0, 150, 0, 127);
  vertex(size, -size, -size);
  vertex(size, size, -size);
  vertex(0, 0, size);

  fill(0, 0, 150, 127);
  vertex(size, size, -size);
  vertex(-size, size, -size);
  vertex(0, 0, size);

  fill(150, 0, 150, 127);
  vertex(-size, size, -size);
  vertex(-size, -size, -size);
  vertex(0, 0, size);

  endShape();
}
