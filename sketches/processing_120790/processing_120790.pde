
// Learning Processing Exercise 14-8. A pyramid class.

float theta = 0.0;

Pyramid pyramid = new Pyramid(100);

void setup() {
  size(400, 400, P3D);
}

void draw() {
  theta += 0.01;
  background(200);
  translate(width / 2, height / 2, 0);
  rotateX(theta);
  rotateY(theta);
  pyramid.draw();
}

class Pyramid {

  int size;

  Pyramid(int size) {
    this.size = size;
  }

  void draw() {
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


}
