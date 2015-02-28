
int xDiam = width/2;
int yDiam = height/2;
float xPosition = 250;
float yPosition = 250;
float speedA = 1.75;
int speedB = 3;

void setup() {
  size(500,500);
}

void draw() {
  background(18, 32, 12);
  fill(255);
  rect(0,300, 500, 20); 
  xPosition = xPosition + speedA;
  yPosition = yPosition + speedA;
  fill(0, 0, 0, 175);
  ellipse (xPosition, yPosition, (5 + xPosition/10), (5 + yPosition/10));

  if(xPosition > 400) {
    speedA = -2;
  } 
  else if(xPosition < 250) {
    speedA = 2;
  }
  if(yPosition > 400) {
    speedA = -2;
  }
  else if (yPosition < 250) {
    speedA = 2;
  }
  xDiam = xDiam + speedB;
  yDiam = yDiam + speedB;
  fill(235,255, 0);
  ellipse (width/2, height/2, xDiam,yDiam);

  if(speedA > -2){
    speedB = -3;
  } 
  else if(speedA < 2) {
    speedB = 3;
  }
}

