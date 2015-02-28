
Hexagon[] hexa = new Hexagon[20];

color bg = color(2, 18, 77);

void setup() {
  size(450, 400);
  background(bg);

  smooth();


  for (int i = 0; i < hexa.length;i++) {
    hexa[i] = new Hexagon();
  }
}

void draw() {
  background(bg);

  for (int i = 0; i < hexa.length;i++) {
    hexa[i].move();
    hexa[i].display();
  }
}

class Hexagon {
  float r = random(10, 30);
  float R = r * 2;

  float x = random(width);
  float y = random(height);

  float spd = random(1, 3);
  int spd_sign;
  float t;

  float red;
  float green;
  float blue;

  Hexagon() {
    if (random(1) >= 0.5) {
      spd_sign = -1;
    } else {
      spd_sign = 1;
    }

    if (random(1) >= 0.5) {
      red = random(255);
      green = 255;
      blue = 255;
    } else {
      red = 0;
      green = random(255);
      blue = 255;
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(t);
    for (int i = 0; i < 6; i++) {
      pushMatrix();
      translate(R*cos(radians(360*i/6+90)), R*sin(radians(360*i/6+90)));
      rotate(-t);
      tri();
      popMatrix();
    }
    popMatrix();
  }

  void tri() {
    float acute_angle = 60; //鋭角
    float obtuse_angle = (180 - acute_angle) / 2; //鈍角
    float val = 360 / acute_angle; //三角形の個数



    for (int i = 0 ; i < val; i++) {
      pushMatrix();
      translate(0, 0);
      rotate(radians(360 * i/val));
      noStroke();
      fill(red, green, blue, 60);
      triangle(0, 0, -r*cos(radians(obtuse_angle)), r*sin(radians(obtuse_angle)), r*cos(radians(obtuse_angle)), r*sin(radians(obtuse_angle)));
      popMatrix();
    }
  }

  void move() {
    x += spd_sign * spd;

    t += spd_sign * 0.04;

    if (x > width + R + r) {
      x = - R -r;
    }
    if (x < - R - r) {
      x = width + R + r;
    }
  }
}

