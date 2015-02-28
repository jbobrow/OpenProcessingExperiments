
PFont fontx;
int x = 0;

void setup() {
  size(600, 200);
  background(255);

  fontx = loadFont ("PerpetuaTitlingMT-Bold-48.vlw");
  textFont(fontx, 30);
  noLoop();
}

void draw() {
  fill(5);
  text("Bowan", 230, 100);
}


