
MyTriangle[] tri = new MyTriangle[2];

void setup() {
  size(550, 550);
  background(255);
  smooth();

  for (int i = 0 ; i < tri.length;i++) {
    tri[i] = new MyTriangle(i);
  }
}

void draw() {
  for (int i = 0 ; i < tri.length;i++) {
    tri[i].move();
    tri[i].display();
  }
}

void mousePressed() {
  for (int i = 0 ; i < tri.length;i++) {
    tri[i].theta_start = random(TWO_PI);

    tri[i].r = random(10, 30);
    tri[i].R = random(30, 250);

    tri[i].c_random = random(255);
    tri[i].theta = 0;
  }

  background(255);
}

class MyTriangle {
  float rotate_t;
  float x = 200;
  float y = 200;

  float r = random(10, 30);

  float theta_start = random(TWO_PI);
  float theta = 0;
  float R = random(30, 250);
  int theta_sign;

  float c_random = random(255);

  MyTriangle(int num) {
    if (num % 2 == 0) {
      theta_sign = 1;
    } else {
      theta_sign = -1;
    }
  }

  void move() {
    theta += theta_sign * 0.03;

    if (theta > TWO_PI || theta < -TWO_PI) {

      theta_start = random(TWO_PI);

      r = random(10, 30);
      R = random(30, 250);

      c_random = random(255);
      theta = 0;
    }

    x = width/2 + R * cos(theta_start + theta);
    y = height/2 + R * sin(theta_start + theta);
  }

  void display() {
    stroke( 0, c_random, 255, 50);
    noFill();

    pushMatrix();
    translate(x, y);
    rotate(rotate_t);
    beginShape();
    for (int i = 0 ; i < 3; i++) {
      vertex(r * cos(radians(360 * i / 3)), r * sin(radians(360 * i / 3)));
    }
    endShape(CLOSE);
    popMatrix();


    rotate_t += 0.3;
  }
}



