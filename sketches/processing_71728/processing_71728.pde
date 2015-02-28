
float xPos;
float yPos;
float speed;
boolean xDir;
boolean yDir;
 
float xHit;
float yHit;
float xTotal;
float yTotal;
 
color ballColor;
float ballR;
float ballG;
float ballB;
float ballSize;
 
  
void setup() {
  frameRate(25);
  size(700,700);
  smooth();
  background(225,0,225);
  xPos = 1;
  yPos = 1;
  speed = 1;
  xDir = true;
  yDir = true;
  ballSize = 25;
  xTotal = (width/10) + 10;
  yTotal = (height/10) + 10;
  
  
  
  
  
  
  

  
  
}
 
void draw() {
   
  noStroke();
  fill(255,47,28,10);
  rect(0,0,width,height);
 
   
  ballR = 255 - constrain(xPos,0,255);
  ballG = 255 - constrain(yPos,0,255);
  ballB = constrain(yPos,0,255);
   
  ballColor = color(ballR,ballG,ballB); 
  fill(ballColor);
  ellipse(xPos,yPos,ballSize,ballSize);
  
  
  
  
  
  
  
  
   
  if (xDir) {
    xPos = xPos + speed+30;
  } else {
    xPos = xPos - speed-30;
  }

   
  if (yDir) {
    yPos = yPos + speed+2;
  } else {
    yPos = yPos - speed-2;
  }
   
  if (xPos > (width-(ballSize/2))) {
    xDir = false;
    xHit = xTotal;
  } else if (xPos < (ballSize/2)) {
    xDir = true;
    xHit = xTotal;
  }
   
  if (yPos > (height-(ballSize/2))) {
    yDir = false;
    yHit = yTotal;
  } else if (yPos < (ballSize/2)) {
    yDir = true;
    yHit = yTotal;
  }
   
  if (xHit>0) {
    strokeWeight(3);
    stroke(225,225,225,225-(xHit*(255/xTotal)));
   noFill();
    ellipse(xPos,yPos,(xTotal-xHit)*15,(xTotal-xHit)*15);
    noStroke();
    xHit--;
  }
  if (yHit>0) {
    strokeWeight(3);
    stroke(0,0,255,255-(yHit*(250/yTotal)));
    noFill();
    ellipse(xPos,yPos,(yTotal-yHit)*15,(yTotal-yHit)*15);
    
    yHit--;


  }
}




 
float x = 15;
float y = 15;
float speedX = 4;
float speedY = 4;
float speedUp = 0.5;
