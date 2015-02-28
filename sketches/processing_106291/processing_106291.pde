
int yoko = 7;
int tate = 21;

int r = 20;

Hexagon[][] hexa = new Hexagon[yoko][tate];

color bg = color(255);

void setup() {
  size(420, 400);
  colorMode(HSB, 360, 100, 100);
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

      hexa[i][j].display(i*r*3.5+space, j*r);
    }
  }
}

class Hexagon {
  int r = 20;

  float hue;
  float sat = random(100);  //saturation;
  float bright = random(100);

  float sat_theta = random(TWO_PI);
  float bright_theta = random(TWO_PI);

  float sat_spd = random(0.01, 0.025) / 3;
  float bright_spd = random(0.01, 0.025) / 3;

  Hexagon() {
  }

  void display(float x, float y) {
    sat = 70 * abs(sin(sat_theta)) + 30;
    bright = 70 * abs(sin(bright_theta)) + 30;

    noStroke();
    fill(hue, sat, bright);

    pushMatrix();
    translate(x, y);
    beginShape();
    for (int i = 0 ; i < 6;i++) {
      vertex(r * cos(radians(360*i/6)), r * sin(radians(360*i/6)));
    }
    endShape();
    popMatrix();

    sat_theta += sat_spd;
    bright_theta += bright_spd;

    hue += 0.25;

    if (hue > 360) {
      hue  = 0;
    }
  }
}

