
int x = 2;
int y = 2;
int xSpeed = 6;
int ySpeed = 5;


void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(220);

  x = x + xSpeed;
  y = y + ySpeed;

  if ((x > width) || (x < 0)) {
    xSpeed = xSpeed * -1;
  }

  if ((y > width) || (y < 0)) {
    ySpeed = ySpeed * -1;
  }

  //yellow quad
  strokeWeight(3);
  stroke(0);
  fill(#FFF700, 50);
  quad(x, y, width-x, 0, width-x, height-y, 0, height-y);
  quad(x, y, width-x, 0, height-x, y, 0, y);

  //thick line
  strokeWeight(5);
  line(width-x, height-y, width-y, height-x);

  //red quad
  strokeWeight(1);
  stroke(0);
  fill(#FF7C00, 50);
  quad(width-y, height-y, x, y, width-x, width-x, 0, 0);

  //blue quad
  strokeWeight(3);
  stroke(0);
  fill(#09B7E0, 50);
  quad(height, width, width-y, width-x, 0, height-y, 0, width-x);

  //following pink ellipse
  strokeWeight(3);
  stroke(0);
  fill(#FF00E2, 70);
  ellipse(width-x, height-y, 30, 30);
  ellipse(width-y, height-x, 30, 30);
}

