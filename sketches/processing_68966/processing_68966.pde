
import processing.opengl.*;

int shapeCount = 125;

float[] sizes = new float[shapeCount];
float[] colors = new float[shapeCount];
float[] offsets = new float[shapeCount];

void setup() {
  size(screen.width, screen.height, OPENGL);

  for (int i = 0; i < shapeCount; i++) {
    sizes[i] = random(2, 10);
    colors[i] = random(125, 255);
    offsets[i] = random(50);
  }
}

void draw() {
  lights();
  background(0);

  camera(mouseX / 3, -30.0, 100.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.0);

  float t = map(mouseX, 0, width, 0, 25);

  for (int i = 0; i < shapeCount; i++) {

    float x = sin(t/2 + offsets[i]) * 3 * t;
    float y = cos(t/2 + offsets[i] * 2) * 4 * t;
    float z = (float) java.lang.Math.pow(t, 1.75) * offsets[i] / 50;

    pushMatrix();

    noStroke();
    fill(colors[i]);

    translate(x, y, z);
    rotateX(offsets[i] * t / 50);
    rotateY(offsets[i] * t / 40);
    rotateZ(offsets[i] * t / 30);
    box(sizes[i]);

    popMatrix();
  }
}
