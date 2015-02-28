
float d;
float xPos;
float yPos;
float xVel;
float yVel;
int currentColor = 0;

void setup () {
  size(600,600);
  background(255);
  smooth();
  frameRate(60);
  fill(currentColor);
  
  d = random(40,120);
  xPos = random(d/2, width - (d/2));
  yPos = random(d/2, height - (d/2));
  xVel = random(-10,10);
  yVel = random(-5,5);
}

void draw () {
  background(255);
  noStroke();
  fill(currentColor);
  ellipse(xPos,yPos,d,d);
  
  xPos= xPos + xVel;
  yPos= yPos + yVel;
  
 
   if(xPos < (d/2)) {
     xVel = xVel*(-1);
     currentColor = int(random(255));
   } else if(yPos < (d/2)) {
     yVel = yVel*(-1);
     currentColor = int(random(255));
   } else if(xPos>width-(d/2)) {
     xVel= xVel*(-1);
     currentColor = int(random(255));
   } else if(yPos>height-(d/2)) {
     yVel= yVel*(-1);
     currentColor = int(random(255));
   }  
}

