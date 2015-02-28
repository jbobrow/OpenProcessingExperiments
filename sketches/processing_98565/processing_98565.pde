
float arc_b_r = 0;
float arc_s_r = 0;

float t = 0;

int flg1 = 0;
int flg2 = 0;
int flg3 = 0;

color c;

void setup() {
  size(350, 350);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
  strokeCap(SQUARE);
  rectMode(CENTER);

  noCursor();
}

void draw() {
  background(0);

  scope(mouseX, mouseY);
}

void scope(int mX, int mY) {
  if (mousePressed == true) {
    arc_b_r += 10;
    if (arc_b_r > 140) {
      arc_b_r = 140;
      flg1 = 1;
    }

    arc_s_r += 10;
    if (arc_s_r > 120) {
      arc_s_r = 120;
      flg2 = 1;
    }

    t+=0.25;
    if (t > TWO_PI) {
      t = TWO_PI;
      flg3  = 1;
    }
  }
  else {
    c = color(119, 100, 100);
    arc_b_r = 0;
    arc_s_r = 0;

    t = 0;

    flg1 = 0;
    flg2 = 0;
    flg3 = 0;
  }

  if (flg1 == 1 && flg2 == 1 && flg3 == 1) {
    c = color(0, 100, 100);
  }
  else {
    c = color(119, 100, 100);
  }

  pushMatrix();
  translate(mX, mY);
  noFill();
  stroke(c);
  strokeWeight(5);
  pushMatrix();
  translate(0, 0);
  rotate(t);
  arc(0, 0, arc_s_r, arc_s_r, radians(-20), radians(20));
  arc(0, 0, arc_s_r, arc_s_r, radians(-20+180), radians(20+180));
  popMatrix();

  strokeWeight(10);
  arc(0, 0, arc_b_r, arc_b_r, radians(-40), radians(40));
  arc(0, 0, arc_b_r, arc_b_r, radians(-40+180), radians(40+180));

  strokeWeight(2);
  ellipse(0, 0, 30, 30);

  fill(c);
  noStroke();
  rect(0, -30, 3, 10);
  rect(0, 30, 3, 10);
  rect(-40, 0, 15, 3);
  rect(40, 0, 15, 3);

  rect(0, 0, 3, 10);
  rect(0, 0, 10, 3);

  popMatrix();
}



