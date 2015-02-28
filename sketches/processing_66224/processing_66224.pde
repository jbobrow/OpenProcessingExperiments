
boolean balldirection = false;
float yball;
float r;
float g;
float b;

void setup() {
  size(500, 300);
  background(255);
  smooth();
}

void draw() {
  frameRate(100);
  background(255);

  if (yball < 291 && balldirection == false) {
    yball++;
  }

  if (yball > 9 && balldirection == true) {
    yball--;
  }

  if (yball == 9) {
    balldirection = false;
  }

  if (yball == 291) {
    balldirection = true;
  }

  ellipse (250, yball, 20, 20);
  noStroke();
  r=random(256);
  g=random(256);
  b=random(256);
  fill(r,g,b);
}


