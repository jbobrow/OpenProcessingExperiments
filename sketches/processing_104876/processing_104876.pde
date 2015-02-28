
int radius = 50;
int xPos = 50;
int yPos = 50;
int stepSizeX = 5;
int stepSizeY = 7;

void setup(){
  size(600,600);
 
}

void draw(){

  background(255);  
  
  fill(255,0,0);
  smooth(0);
  
  xPos = xPos + stepSizeX;
  ellipse(xPos,yPos,2*radius,2*radius);
  if(xPos > (width-radius) || xPos < radius){
  stepSizeX = stepSizeX*-1;
  }
  
  yPos = yPos +stepSizeY;
  if(yPos > (height-radius) || yPos <radius){
   stepSizeY = stepSizeY*-1; 
  }
 
}


