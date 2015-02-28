
float d;
float xPos;
float yPos;
float xVel; 
float yVel;


void setup(){
  size(400, 400);
  d = (10);
  xPos = random (10 + d/2, width - d/2);
  yPos = random (20 + d/2, width - d/2);
  xVel = random (20);
   yVel = random(20);
  ellipse(50, 50, 100, 100);
  frameRate(10);
}
void draw(){
  
  background(150);
  
  if (xPos < 10 + d/2){
    xVel = -xVel;
  }
  
  if (yPos < 10 + d/2){ 
    yVel = -yVel;
  }
  
   if (xPos > width - d/2){
    xVel = -xVel;
  }
 
  if (yPos > width - d/2){ 
    yVel = -yVel;
  }
  yPos += yVel;
  ellipse(xPos,yPos,d,d);

}

