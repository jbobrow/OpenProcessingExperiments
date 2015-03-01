
  float directionY = 0.0;
  float directionX = 0.0;
  int positionY = 0;
  int positionX = 0;

void setup() {
  size(500,500);
}

void draw() {
  frameRate(40);
  background(40);
  noStroke();
  fill(directionY*3.5,100,directionX*3.5);
  ellipse(positionX,positionY,positionX+50,positionY-100);
  directionY += 5;
  directionX += 3;
  positionY+=directionY;
  positionX+=directionX;
  
  if (positionY>=500 || positionY <= 0) {
    directionY *= -1;
  }
  if (positionX>=width || positionX <= 0) {
    directionX *= -1;
  }
}


