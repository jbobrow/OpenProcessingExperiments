
int d = 40;
int xPos = 1;
int yPos = 1;
int directionX = 10;
int directionY = 10;
  
void setup(){
  size(400, 400);
  smooth();
   background(150, 255, 0);
}

void draw(){
  background(150, 255, 0);
  noStroke();
  fill(255);
  rect(xPos, yPos, d, d);
  xPos = xPos + directionX;
  yPos = yPos + directionY;
  if(xPos > mouseX +d/2 ){
    directionX = -1;    
  }
  if(yPos > mouseY +d/2){
    directionY = -1;
  }    
  if(xPos < mouseX +d/2){
    directionX = 1;
  }
  if(yPos < mouseY+d/2){
    directionY = 1;
  }      
   stroke(0);
   noFill();
   rect(mouseX, mouseY, 80, 80); 
}
