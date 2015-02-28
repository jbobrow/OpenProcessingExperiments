
int xPos;
int yPos;
int velocityX;
int velocityY;

void setup() {
  size(500, 400);
  background(255, 100, 255);
  
  xPos = 100;
  yPos = 200;
  velocityX = 3;
  velocityY= 4;
}

void draw() {
  xPos += velocityX;
  yPos += velocityY;
 
  
  if (xPos > (width -25) || xPos < 25) {
    velocityX*=-1;
  }
    
  if (yPos > (height -25) || yPos < 25) {
    velocityY*=-1;
  }
  
  stroke(100, 50, 0, 63);
  strokeWeight(10);
  ellipse(xPos, yPos, 50, 50);
}


