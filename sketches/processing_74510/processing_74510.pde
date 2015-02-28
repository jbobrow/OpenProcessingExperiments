
int d = 25;
int xPos = 20;
int yPos = 20;

int directionX = 1;
int directionY = 1;

void setup(){
  
  size(400, 300, P2D);
  smooth(); 
  noCursor();
}

void draw(){
  background(100, 0, 0);
    
  fill(255);
  rect(mouseX, mouseY, 10, 80);
  ellipse(mouseX, mouseY, 70, 90);
  ellipse(mouseX, mouseY, 60, 80);
  fill(51, 66, 181);
 rect(0, 0, 10, 400);
 
 
   //check if ellipse in the rect
  
  if(dist(xPos, yPos, d, d) < 10){
    fill(255, 234, 0);
    rect(0, 0, 10, 400);
  } else {
    fill(51, 66, 181);
    rect(0, 0, 10, 400);
  }   
  
 fill(255);
 
  //check if mouseis in the ellipse
  
  if(dist(width/2, height/2, mouseX, mouseY) < 50){
    fill(251, 229, 83);
  } else {
     fill(255);
 }

 
  ellipse(xPos, yPos, d, d);
  xPos = xPos + directionX;
  yPos = yPos + directionY;
  
  //right border
  if(xPos > mouseX - d/2) {
    directionX = -2;
  }
  
  // left border
  if(xPos  < d/2) {
    directionX = 2; 
  }
  
//top border
  if(yPos < d/2){
    directionY = 2;
  }
  
  //bottom border
  if(yPos > mouseY){
    directionY = -2;
  }
  
 
}
