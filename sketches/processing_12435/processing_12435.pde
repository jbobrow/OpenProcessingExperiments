
//import processing.opengl.*;
import peasy.*;

static final int PENTS = 25;
static final float MIN_HEIGHT = 2;
static final float MAX_HEIGHT = 6;
static final float MIN_RADIUS = 15;
static final float MAX_RADIUS = 20;
static final float MAX_ROT = .01;

PeasyCam cam;
ThePent[] pents = new ThePent[PENTS];
PVector l0, l1, l2;
float rx, ry;
float dx, dy;

void setup() {
  size(600, 400, P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  for (int i = 0 ; i < PENTS ; i++) {
    pents[i] = new ThePent();
  }
  l0 = new PVector(random(-200, 200), random(-200, 200), random(-200, 200));
  l1 = new PVector(random(-200, 200), random(-200, 200), random(-200, 200));
  l2 = new PVector(random(-200, 200), random(-200, 200), random(-200, 200));
  rx = random(0, TWO_PI);
  dx = random(-MAX_ROT, MAX_ROT);
  ry = random(0, TWO_PI);
  dy = random(-MAX_ROT, MAX_ROT);
}

void draw() {
  background(0);
  lights();
  pointLight(64, 64, 64, l0.x, l0.y, l0.z);
  pointLight(64, 64, 64, l1.x, l1.y, l1.z);
  pointLight(64, 64, 64, l2.x, l2.y, l2.z);
  rx += dx;
  ry += dy;
  rotateX(rx);
  rotateY(ry);
  for (int i = 0 ; i < PENTS ; i++) {
    pents[i].draw();
  }
}

/*
void keyPressed() {
  saveFrame("pent###.png");
  delay(1000);
}
*/

class ThePent {
  float x, y, z, h;
  float r0, r1;      // radii
  float rx, ry, rz;  // rotations
  float dx, dy, dz;  // deltas
  int r, g, b;
  
  ThePent() {
    init();
  }
  
  void init() {
    x = random(0);
    y = random(0);
    z = random(-20, 20);
    h = random(MIN_HEIGHT, MAX_HEIGHT);
    r0 = random(0, MIN_RADIUS);
    r1 = r0 + random(MIN_RADIUS);
    rx = 0; ry = 0; rz = random(0, TWO_PI);
    dx = 0; dy = 0; dz = random(-MAX_ROT, MAX_ROT);
    r = (int)random(64, 256);
    g = r;//(int)random(64, 256);
    b = r;//(int)random(64, 256);
  }
  
  void draw() {
    fill(r, g, b);
    noStroke();
    rx += dx;
    ry += dy;
    rz += dz;
    z = 30 * cos(rz);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    float angle = TWO_PI / 5;

    // inner
    tube(r0);
    // outer
    tube(r1);
    // top
    end(z + h);
    // bottom
    end(z - h);
  }
  
  void tube(float radius) {
    float angle = TWO_PI / 6;
    beginShape(QUAD_STRIP);
    float a = 0;
    vertex(x + radius * cos(a), y + radius * sin(a), z - h);
    vertex(x + radius * cos(a), y + radius * sin(a), z + h);
    a += angle;
    vertex(x + radius * cos(a), y + radius * sin(a), z - h);
    vertex(x + radius * cos(a), y + radius * sin(a), z + h);
    a += angle;
    vertex(x + radius * cos(a), y + radius * sin(a), z - h);
    vertex(x + radius * cos(a), y + radius * sin(a), z + h);
    a += angle;
    vertex(x + radius * cos(a), y + radius * sin(a), z - h);
    vertex(x + radius * cos(a), y + radius * sin(a), z + h);
    a += angle;
    vertex(x + radius * cos(a), y + radius * sin(a), z - h);
    vertex(x + radius * cos(a), y + radius * sin(a), z + h);
    a += angle;
    vertex(x + radius * cos(a), y + radius * sin(a), z - h);
    vertex(x + radius * cos(a), y + radius * sin(a), z + h);
    a += angle;
    vertex(x + radius * cos(a), y + radius * sin(a), z - h);
    vertex(x + radius * cos(a), y + radius * sin(a), z + h);
    endShape();
  }

  void end(float ht) {
    float angle = TWO_PI / 6;
    beginShape(QUAD_STRIP);
    float a = 0;
    vertex(x + r0 * cos(a), y + r0 * sin(a), ht);
    vertex(x + r1 * cos(a), y + r1 * sin(a), ht);
    a += angle;
    vertex(x + r0 * cos(a), y + r0 * sin(a), ht);
    vertex(x + r1 * cos(a), y + r1 * sin(a), ht);
    a += angle;
    vertex(x + r0 * cos(a), y + r0 * sin(a), ht);
    vertex(x + r1 * cos(a), y + r1 * sin(a), ht);
    a += angle;
    vertex(x + r0 * cos(a), y + r0 * sin(a), ht);
    vertex(x + r1 * cos(a), y + r1 * sin(a), ht);
    a += angle;
    vertex(x + r0 * cos(a), y + r0 * sin(a), ht);
    vertex(x + r1 * cos(a), y + r1 * sin(a), ht);
    a += angle;
    vertex(x + r0 * cos(a), y + r0 * sin(a), ht);
    vertex(x + r1 * cos(a), y + r1 * sin(a), ht);
    a += angle;
    vertex(x + r0 * cos(a), y + r0 * sin(a), ht);
    vertex(x + r1 * cos(a), y + r1 * sin(a), ht);
    endShape();
  }
}

