
/*
Avi Varshney
CMPS 5J
pa6
*/

final int bWidth = 100, bHeight = 100;
float xPos = 250, yPos = 100, xSpeed = 0, ySpeed = 20;
float gravity = 0.6, stopSpeed = 0.2, dissipation = 0.8;
int xDir = 1;  // left (-1) or right (+1)
int yDir = 1;  // down (-1)or up (+1)
void setup(){
  size(500, 500);
  fill(255, 0, 0);
  ellipseMode(CENTER);
}

void draw(){
  background(0,255,255);
  
  displayBall();
  if( mousePressed && mouseOnBall())
    holdBall();
  else{
    moveBall();
    updateSpeed();
  }
}

void displayBall(){
  ellipse(xPos, yPos, bWidth, bHeight);
}
boolean mouseOnBall(){
  if( get(mouseX, mouseY) == color(255, 0, 0) )
    return true;
  return false;
}
void holdBall(){
  xPos = constrain(mouseX, 50, 450);
  yPos = constrain(mouseY, 50, 450);
  xSpeed = mouseX - pmouseX;
  ySpeed = mouseY - pmouseY;
}
void moveBall(){
  if(xPos < 50 || xPos > 450)
    xDir *= -1;
  if(yPos < 50 || yPos > 450)
    yDir *= -1;
}
void updateSpeed(){
  xPos += xSpeed * xDir;
  yPos += ySpeed * yDir;

  ySpeed += gravity;
  
  if(yPos > 450 || yPos < 50)
    ySpeed *= -dissipation;
  if(xPos > 450 || xPos < 50)
    xSpeed *= -(1-dissipation);
    
  if( abs(ySpeed) < stopSpeed )
    ySpeed = 0;
  if( abs(xSpeed) < stopSpeed )
    xSpeed = 0;
  xPos = constrain(xPos, 50, 450);
  yPos = constrain(yPos, 50, 450);  
}


