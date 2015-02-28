
int yoko = 7;
int tate = 21;

int r = 20;

Hexagon[][] hexa = new Hexagon[yoko][tate];

color bg = color(255);

void setup() {
  size(420, 400);
  background(bg);

  smooth();

  for (int i = 0;i < yoko;i++) {
    for (int j = 0; j < tate;j++) {
      hexa[i][j] = new Hexagon();
    }
  }
}

void draw() {
  background(bg);

  float space = 0;

  for (int i = 0; i < yoko; i++) {
    for (int j = 0; j < tate;j++) {
      if (j % 2 == 0) {
        space = r*3.5 / 2;
      } else {
        space = 0;
      }

      hexa[i][j].tri(i*r*3.5+space, j*r);
    }
  }
}

class Hexagon {
  int r = 20;
  float t = random(TWO_PI);
  float spd = 0.003;

  Hexagon() {
  }

  void tri(float x, float y) {
    float acute_angle = 60; //鋭角
    float obtuse_angle = (180 - acute_angle) / 2; //鈍角
    float val = 360 / acute_angle; //三角形の個数

    for (int i = 0 ; i < val; i++) {
      pushMatrix();
      translate(x, y);
      rotate(radians(360 * i/val));
      strokeWeight(2);
      stroke(255*abs(sin(t)));
      fill(255*abs(sin(t)));
      triangle(0, 0, -r*cos(radians(obtuse_angle)), r*sin(radians(obtuse_angle)), r*cos(radians(obtuse_angle)), r*sin(radians(obtuse_angle)));
      popMatrix();
    }

    t += spd;
  }
}

