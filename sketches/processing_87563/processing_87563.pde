
int x = 50;
int y = 50;
int center = 10;


void setup () {
  size(500, 500);
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(100);

  float i = dist(mouseX, mouseY, x, y);
  if (i < center) {
    center++;
    fill(0);
  }
  else {
    fill(255);
  }
  rect(x, y, center, center);
}


