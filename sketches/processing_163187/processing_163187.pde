
int x = 200;
int y = 100;
int xSpeed = 2;
int ySpeed = 1;
int xDirection = 4;
int yDirection = -3;
int radius = 10;
int rectY;
int scoreL = 0;
int scoreR = 0;

void setup() {
  size(1000, 600);
  smooth();
  noStroke();
  
  ellipseMode(RADIUS);
  rectMode (CENTER);
}

void draw() {
  background(#6EDED3);
  ellipse(x, y, radius, radius);
  rect(100, mouseY, 20, 100); //left rectangle
  rect(900, rectY, 20, 100); //right rectangle
  textSize(30);
  text(scoreL, 400, 50);
  text(scoreR, 600, 50);
  
  x += xSpeed * xDirection;
  y += ySpeed * yDirection;
  
  //right rectangle keypress
  if (keyPressed) {
    if (key == 'o' || key == 'O') {
      rectY -= 15;
    }
    if (key == 'l' || key == 'L') {
      rectY += 15;
    }
  } //end of keyPress
  
  //right rectangle moving boundaries
  if (rectY < 0) {
    rectY = 0;
  }
  if (rectY > 600) {
    rectY = 600;
  }
  
  //ball bouncing
  if ((x > width - radius) || (x < radius)) {
    xDirection = -xDirection;
  }
  if ((y > height - radius) || (y < radius)) {
    yDirection = -yDirection;
  }
  
  if ((x < 100 + 5) && (y < mouseY + 50) && (y > mouseY - 50)) {
    xDirection = -xDirection;
  }
  if ((x > 900 - 5) && (y < rectY + 50) && (y > rectY - 50)) {
    xDirection = -xDirection;
  }
  
  if (x-radius < 1) {
    scoreR = scoreR + 1;
  }
  if (x+radius > 999) {
    scoreL = scoreL + 1;
  }
}
