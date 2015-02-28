
void setup() {
  size(500, 500);
}
float x=250;
float y=360;
float a=86;
float b=65;

void draw() {

  if (mouseX<x) {
    a=map(mouseX, 85, x, x, 68);
  }
  if (mouseX>x) {
    a=map(mouseX, x, 100, 0, x);
  }
  if (mouseY<y) {
    b=map(mouseY, 0, y, y, 584);
  }
  if (mouseY>y) {
    b=map(mouseX, y, 500, 0, y);
  }

  background(250);
  strokeWeight(0.5);

  for (int i=0; i<6; i++) {
    for (int j=0; j<6; j++) {
      fill(a, random(160, 520), b, 250);
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

