
PImage img;
int y = 0;

void setup() {
  size(400, 400);
  img = loadImage("board.jpg");
  noStroke();
  noCursor();
}

void draw() {
  image(img, 0, 0);
  color c = get(mouseX, mouseY);
  fill(c);
  rectMode(CENTER);
  rect(mouseX, mouseY, 13, 13);
}


