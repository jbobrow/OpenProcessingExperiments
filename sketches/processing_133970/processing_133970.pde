
void setup() {
  size(500, 500);
}
float x=250;
float y=250;
float a=0;
float b=0;

void draw() {

  if (mouseX<x) {
    a=map(mouseX, 0, x, x, 0);
  }
  if (mouseX>x) {
    a=map(mouseX, x, 500, 0, x);
  }
  if (mouseY<y) {
    b=map(mouseY, 0, y, y, 0);
  }
  if (mouseY>y) {
    b=map(mouseY, y, 500, 0, y);
  }

  background(250);
  strokeWeight(0.5);

  for (int i=0; i<6; i++) {
    for (int j=0; j<6; j++) {
      fill(a, random(100, 160), b, 20);
      stroke(a, random(100, 160), b, (a+b)/5);
      bezier(i*100, j*100, x-a, y-b, x+a, y+b, j*100, i*100);
    }
  }

  if (mouseX<x) {
    x=x-(a/40);
  }
  if (mouseX>x) {
    x=x+(a/40);
  }
  if (mouseY<y) {
    y=y-(b/40);
  }
  if (mouseY>y) {
    y=y+(b/40);
  }
  if (mousePressed) {
    x=mouseX;
    y=mouseY;
  }
}

