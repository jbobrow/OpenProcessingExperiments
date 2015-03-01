
float x = 88;
float y = 88;
float speedX = 5;
float speedY = 10;
int directionX = 1;
int directionY = 1;
float radius = 15;
int score=0;

void setup() {
  size (500, 500);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}

void draw() {
  background(0);
  fill(255);
  ellipse(x, y, radius, radius);
  rectMode(CENTER);
  rect(mouseX, 450, 100, 20);
  x=x+speedX*directionX;
  y=y+speedY*directionY;
  if (x > width-radius||x<radius) {
    directionX=-directionX;
  }
  if (y > height-radius||y<radius) {
    directionY=-directionY;
  }
  if (x>mouseX-50 && x<mouseX+50 && y>=440) {
    directionY=-directionY;
    score=score+1;
  }
  text(score,20,30);
}




