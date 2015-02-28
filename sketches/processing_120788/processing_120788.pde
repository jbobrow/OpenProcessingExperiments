
// Learning Processing Exercise 14-7. Rotating a 3D cube.

float theta = 0.0;

void setup() {
  size(400, 400, P3D);
}

void draw() {
  background(33);
  translate(width / 2, height / 2);
  rotateX(theta);
  rotateY(theta);
  int size = (int)abs((width * (cos(theta) / 2)));
  drawCube(constrain(size, 10, 100));
  theta += 0.01;
}

void drawCube(int size) {
  beginShape(QUADS);

  fill(100, 127);
  vertex(-size, -size, size);
  vertex(size, -size, size);
  vertex(size, size, size);
  vertex(-size, size, size);
  fill(130, 127);
  vertex(-size, -size, size);
  vertex(-size, -size, -size);
  vertex(-size, size, -size);
  vertex(-size, size, size);
  fill(160, 127);
  vertex(size, -size, size);
  vertex(size, -size, -size);
  vertex(size, size, -size);
  vertex(size, size, size);
  fill(190, 127);
  vertex(-size, -size, size);
  vertex(-size, -size, -size);
  vertex(size, -size, -size);
  vertex(size, -size, size);
  fill(220, 127);
  vertex(-size, size, size);
  vertex(-size, size, -size);
  vertex(size, size, -size);
  vertex(size, size, size);
  fill(250, 127);
  vertex(-size, -size, -size);
  vertex(size, -size, -size);
  vertex(size, size, -size);
  vertex(-size, size, -size);
  endShape();
}
