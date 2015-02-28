
int mx;
int my;

void setup() {
smooth();
  size(400, 400);
  background(255, 255, 255);
}

void draw () {
  background(255, 255, 255);

  mx=mouseX;

  my=mouseY;
  for (int y=0; y <= 400; y=y+2) {

    ellipse(mouseX, y, 400, y);
  }
  for (int x=0; x <= 400; x=x+10) {

    line(mouseY, 0, x, 400);
  }
     for (int y=0; y <= 400; y=y+2) {

    rect(mouseX, y, random(2,35), y);
  }
}


