
int xSize = 0;
int ySize = 0;

void setup() {
  size(500,500);
  background(25);
  smooth();
}

void draw() {
  fill(255);
  ellipse(250,250,xSize,ySize);
}

void mousePressed() {
  println("draw");
  background(25);
  fill(255);
  noStroke();
  ellipse(250,250,xSize,ySize);
  xSize = xSize + 10;
  ySize = ySize + 10;
}

void keyPressed() {
  background(25);
  xSize = 0;
  ySize = 0;
}


