
Hexagon[] hexa = new Hexagon[20];

void setup() {
  size(500, 350);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  for (int i = 0; i < hexa.length;i++) {
    hexa[i] = new Hexagon();
  }

  stroke(360, 100);
}

void draw() {
  background(0);

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

  float spd = random(1, 3) * 0.8;
  int spd_sign;
  float t;

  float hue;
  float sat = random(30, 100);  //saturation;
  float bright = random(20, 100);

  Hexagon() {
    if (random(1) >= 0.5) {
      spd_sign = -1;
    } else {
      spd_sign = 1;
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

      fill(hue, sat, bright, 80);
      beginShape();
      for (int j = 0; j < 6;j++) {
        vertex(r * cos(radians(360 * j / 6)), r*sin(radians(360 * j / 6)));
      }
      endShape(CLOSE);

      popMatrix();
    }
    popMatrix();

    hue += 0.5;

    if (hue > 360) {
      hue = 0;
    }
  }

  void move() {
    x += spd_sign * spd;

    t += spd_sign * 0.04 * 0.8;

    if (x > width + R + r) {
      x = - R -r;
    }
    if (x < - R - r) {
      x = width + R + r;
    }
  }
}

