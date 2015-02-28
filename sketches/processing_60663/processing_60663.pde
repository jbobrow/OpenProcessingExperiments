
int w;
int h;
int x;
int y;
float b;

void setup() {

  size (200, 200);

  w = width/2;
  h = height/2;
}

void draw() {
  background(255);
  noStroke();

  if (mouseX > w) {
    x = w;
  }
  else {
    x = 0;
  }

  if (mouseY > h) {
    y = h;
  }
  else {
    y = 0;
  }

  float b = random(255);

  println ("Yeah! Großraumdisco…");

  fill (mouseX, mouseY, b);
  rect(x, y, w, h);
  //saveFrame("fourfloors.png");
}


