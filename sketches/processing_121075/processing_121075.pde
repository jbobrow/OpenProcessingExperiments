
// Learning Processing Exercise 14-9. Rotating a bunch of 3D cubes.

final int NUMBER_OF_CUBES = 50;
Cube[] cubes = new Cube[NUMBER_OF_CUBES];

void setup() {
  size(400, 400, P3D);
  for (int i = 0; i < NUMBER_OF_CUBES; ++i) {
    cubes[i] = new Cube((int)random(width), (int)random(height), (int)random(2, 50), random(10), random(0, 0.1));
  }
}

void draw() {
  background(33);
  for (int i = 0; i < NUMBER_OF_CUBES; ++i) {
    cubes[i].draw();
  }
}

class Cube {

  static final float DEFAULT_THETA = 0.0;
  static final int DEFAULT_SIZE = 20;
  static final float DEFAULT_SPEED = 0.01;

  int x;
  int y;
  float theta;
  int size;
  float speed;

  Cube() {
    this(width / 2, height / 2, DEFAULT_SIZE, DEFAULT_THETA, DEFAULT_SPEED);
  }

  Cube(int x, int y, int size, float theta, float speed) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.theta = theta;
    this.speed = speed;
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    rotateX(theta);
    rotateY(theta);
    //scale(cos(theta));
    //scale(cos(theta), sin(theta), cos(theta));
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
    popMatrix();
    theta += speed;
  }

}
