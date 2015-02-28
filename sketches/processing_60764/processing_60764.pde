
int mx;
int my;

void setup() {

  size(400, 400);
  background(255, 255, 255);
}

void draw () {
  background(255, 255, 255);

  mx=mouseX;

  my=mouseY;
  for (int x=0; x <= 400; x=x+20) {

    line(0, x, 400, x);
  }
  for (int y=0; y <= 400; y=y+20) {

    line(y, 0, y, 400);
  }
}


