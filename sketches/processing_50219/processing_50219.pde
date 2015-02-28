
//homework 3
//copyright russell andrews rwandrew 2012

int change, a, b;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  change = color(random(255), random(255), random(255), 50);
  a = 0;
  b = 75;
}

void draw() {
  fill(255, 5);
  rect(0, 0, width, height);
  noStroke();
  fill(change);
  ellipse(mouseX, mouseY, a, a);
}

void mouseClicked() {
  change = change + 1;
  if (change % 2 == 0) {
    change = color(random(255), random(255), random(255), 50);
  }
  else {
    change = color(random(255), random(255), random(255), 50);
  }
}

void mouseMoved() {
  a = a + 1;
  if (a > 200) {
    a = -a;
  }
}

