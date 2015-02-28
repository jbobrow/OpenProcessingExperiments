
Flower[] flowers = new Flower[10];

void setup() {
  size(550, 550);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < flowers.length;i++) {
    flowers[i] = new Flower();
  }

  noStroke();
}

void draw() {
  pushMatrix();
  translate(0,-30);
  for (int i = 0 ; i < flowers.length;i++) {
    flowers[i].move();
    flowers[i].display();
  }
  popMatrix();
}

class Flower {
  Heart[] hearts = new Heart[6];

  float x;
  float y;
  float xy_theta = random(TWO_PI);
  float xy_R = random(15);

  float r = random(0.5, 1.0);
  float R = r * 16;

  float hue = random(360);
  float sat = random(50, 80);

  float theta = random(TWO_PI);

  float S;
  float S_delta = random(0.01, 0.03) * 10;

  Flower() {
    for (int i = 0 ; i < hearts.length;i++) {
      hearts[i] = new Heart();
    }


    x = width/2 + calc_x(xy_R, xy_theta);
    y = height/2 + calc_y(xy_R, xy_theta) ;
  }

  void move() {
    S += S_delta;
    if (S > 1.0) {
      S = 1;

      xy_R = random(15);
      xy_theta = random(TWO_PI);

      x = width/2 + calc_x(xy_R, xy_theta);
      y = height/2 + calc_y(xy_R, xy_theta);

      hue = random(360);
      sat = random(50, 100);

      S = 0;
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(theta);

    pushMatrix();
    translate(0, 0);
    rotate(radians(90));
    fill(hue, sat, 80);
    flower(r*1.1*S, R*1.1*S);
    popMatrix();

    pushMatrix();
    translate(0, 0);
    fill(hue, sat, 100);
    flower(r*S, R*S);
    popMatrix();

    pushMatrix();
    translate(0, 0);
    rotate(radians(90));
    fill(hue, sat-40, 100);
    flower(r*0.6*S, R*0.6*S);
    popMatrix();

    popMatrix();
  }

  void flower(float r, float R) {
    for (int i = 0; i < 6;i++) {
      pushMatrix();
      translate(R*cos(radians(360 * i /6)), R*sin(radians(360 * i /6)));
      rotate(radians(360 * i / 6 + 90));
      hearts[i].display(r/2, r);
      popMatrix();
    }
  }

  float calc_x(float r, float t) {
    float x;

    x = r *(16 * sin(t) * sin(t) * sin(t));

    return x;
  }

  float calc_y(float r, float t) {
    float y;

    y = -1 * r * (13 * cos(t) - 5 * cos(2*t) - 2 * cos(3 * t) - cos(4 * t) );

    return y;
  }
}

class Heart {
  Heart() {
  }

  void display(float rx, float ry) {
    beginShape();
    for (float i = 0; i< TWO_PI;i+=0.05) {
      curveVertex(calc_x(rx, i), calc_y(ry, i));
    }
    endShape(CLOSE);
  }

  float calc_x(float r, float t) {
    float x;

    x = r *(16 * sin(t) * sin(t) * sin(t));

    return x;
  }

  float calc_y(float r, float t) {
    float y;

    y = -1 * r * (13 * cos(t) - 5 * cos(2*t) - 2 * cos(3 * t) - cos(4 * t) );

    return y;
  }
}



