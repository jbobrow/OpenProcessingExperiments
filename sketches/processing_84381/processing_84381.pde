
Cube cube;

void setup() {
  size(640, 480, P3D);
  frameRate(30);

  cube = new Cube(200.0);
}

void draw() {
  background(0);

  translate(width/2, height/2);

  rotateY(map(mouseX, 0, width-1, -HALF_PI, HALF_PI));
  rotateX(map(mouseY, 0, height-1, HALF_PI, -HALF_PI));

  float s = 200 - 100*sin(radians(frameCount*3));


  cube.setSize(s);
  cube.draw();
}
class Ball {

  private float x, y, z;
  private float vx, vy, vz;
  private float s;
  private color c;

  Ball(float x, float y, float z, float vx, float vy, float vz, float s, color c) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.vx = vx;
    this.vy = vy;
    this.vz = vz;
    this.s = s;
    this.c = c;
  }


  void draw() {
    pushMatrix();

    translate(x, y, z);

    fill(c);
    noStroke();
    sphere(s);

    popMatrix();

    x += vx;
    y += vy;
    z += vz;
  }

  void bound(float w, float h, float d) {
    if (x < -w/2 + s/2) {
      vx = -vx;
      x = -w/2 + s/2;
    }
    if (w/2 - s/2 <= x) {
      vx = -vx;
      x = w/2 - s/2;
    }

    if (y < -h/2 + s/2) {
      vy = -vy;
      y = -h/2 + s/2;
    }
    if (h/2 - s/2 <= y) {
      vy = -vy;
      y = h/2 - s/2;
    }

    if (z < -d/2 + s/2) {
      vz = -vz;
      z = -d/2 + s/2;
    }
    if (d/2 - s/2 <= z) {
      vz = -vz;
      z = d/2 - s/2;
    }
  }
}
class Cube {

  private float x, y, z;
  private float s;

  private Ball[] ball;


  Cube(float x, float y, float z, float s) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.s = s;

    colorMode(HSB, 360, 100, 100);
    ball = new Ball[16];
    for (int i = 0; i < ball.length; i++) {
      ball[i] = new Ball(random(-s/2, s/2), random(-s/2, s/2), random(-s/2, s/2),
			 random(6, 12), random(6, 12), random(6, 12),
			 random(6, 12), color(random(360), 100, 100));
    }
    colorMode(RGB, 255, 255, 255);
  }

  Cube(float s) {
    this(0, 0, 0, s);
  }


  float getSize() {
    return s;
  }

  void setSize(float s) {
    this.s = s;
  }

  void draw() {
    pushMatrix();

    translate(x, y, z);

    noFill();
    stroke(192);
    box(s);

    for (Ball b : ball) {
      b.draw();
      b.bound(s, s, s);
    }

    popMatrix();
  }
}


