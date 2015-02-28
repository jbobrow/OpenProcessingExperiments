
float xa = -100;
float ya;

float xb = 100;
float yb;

void setup() {
  size(300, 500);
  background(0);
  smooth();
}

void draw() {
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);

  plus();
  minus();
}

void plus() {
  ya = sq(xa)/30+170;

  noStroke();
  fill(random(255), random(255), 255, 80);
  ellipse(xa+width/2, ya, 30+random(50), 30+random(50));

  xa++;

  if (xa > 200) {
    xa = -100;
  }
}

void minus() {
  yb = -sq(xb)/30+330;

  noStroke();
  fill(random(255), 255, random(255), 80);
  ellipse(xb+width/2, yb, 30+random(50), 30+random(50));

  xb--;

  if (xb < -200) {
    xb = 100;
  }
}


