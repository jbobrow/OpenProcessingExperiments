
void setup() {
  size(500, 500);
  background(255);
  frameRate(10);
}

void draw() {
  fill(255, 50);
  noStroke();
  rect(0, 0, 500, 500);
  //here we call the first flashy rectangle, the one in red
  fill(255, 0, 0);
  moveShapes();
  //here we call the second flashy rectangle, the one in yellow
  fill(255, 255, 0);
  moveShapes();
  //we could add more if we want...
}

//here we define our function: just a rectangle that appears randomly on the screen
void moveShapes() {
  rect(random(300), random(500), 200, 10);
}

