
// width and height are built in.
int centerX = 600 / 2; 
int centerY = 600 / 2;

void setup() {
  size(600, 600);
  background(255, 0, 40);
  fill(255, 21, 255, 50);
  rectMode(CENTER);
  rect(200, 200, 200, 200);
}

void draw() {
  strokeWeight(10);
  stroke(57, 240, 2, 128);
  noFill();
  ellipseMode(CENTER);
  ellipse(mouseX, mouseY, 100, 100);
  noStroke();
  ellipseMode(CORNER);
  fill(57, 240, 200, 20);
  ellipse(mouseX, mouseY, 100, 100);
}



