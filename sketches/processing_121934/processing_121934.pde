
float a;
float b;
float x;
float y;
float r1 = 0;
float t1 = 0.2;
float r1_goal = r1 + t1;
float r2 = 0;
float t2 = 1.0;
float r2_goal = r2 + t2;
float h2 = 0.5;

int num = 40;

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
  noLoop();
  noStroke();
}

void draw() {
  for (int i = 0 ; i < 400;i++) {
    if (i % 11 == 0) {
      fill(320, random(50), random(90, 100), random(50, 150));
    }
    else if (i % 5 == 0) {
      fill(290, random(50), random(90, 100), random(50, 150));
    }
    else {
      fill(300, random(50), random(90, 100), random(50, 150));
    }
    flower(random(width), random(height), random(10, 30), random(TWO_PI));
  }

  filter(BLUR, 1);
}

void mousePressed() {
  background(360);
  redraw();
}

void flower(float ox, float oy, float R, float theta) {
  pushMatrix();
  translate(ox, oy);
  rotate(theta);
  beginShape();
  for (float i = 0; i <= TWO_PI;i+=0.01) {
    b = (sin(r2)+cos(r2*2))*0.8;
    a = b * h2 + 1;
    x = R * a * sin(r1);
    y = R * a * cos(r1);

    r1 += t1;
    r2 += t2;

    vertex(x, y);
  }
  endShape(CLOSE);

  r1 = r1_goal;
  r2 = r2_goal;

  popMatrix();
}

