


int circle1X = 50;
int circle1Y;

int boxX, boxY;

int circle2X, circle2Y;





void setup() {
  colorMode(RGB, 100);
  frameRate(30);
  size(600, 600); 

  circle1Y = 100;
  circle2X= width / 2;
  circle2Y = height / 2;
}

void draw() {
  background(76);
  noCursor();

  abstractShapes(mouseX, mouseY);
  abstractShapes(mouseY, mouseY);
  abstractShapes(mouseY, mouseX);
  abstractShapes(mouseX, mouseX);
  println(frameRate);

  return;
}

void abstractShapes(int moveX, int moveY) {


  pushMatrix();
  translate(moveX, moveY);
  boxX = mouseX/2;
  boxY = mouseY/2;

  fill(100, 80, 20, 50);
  stroke(100, 0, 100, 75);
  strokeWeight(5);
  triangle(10, 10, 20, 20, 0, 50);

  noFill();
  ellipse(circle1X, circle1Y, 200, 200);

  fill(100, 50, 80, 100);
  noStroke();
  rectMode(CENTER);
  rect(boxX, boxY, 30, 40);

  fill(10, 50, 20, 100);
  stroke(20, 100, 40);
  strokeWeight(5);
  ellipse(circle2X, circle2Y, 100, 50);
  popMatrix();


  return;
}



