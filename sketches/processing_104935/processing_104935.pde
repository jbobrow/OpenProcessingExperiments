
int xPos = 50;
int yPos = 50;
int stepSizeX = 3;
int stepSizeY = 5;
int ballWidth = 50;

//initial 
void setup(){
//sizeofthewindow
  size(400,400);
}

 //looping
void draw(){
  background(51,51,56); 
  fill(115,255,204);
  xPos = xPos + stepSizeX;
  ellipse(xPos,yPos,ballWidth,ballWidth);
  if(xPos > (width-ballWidth)||xPos < ballWidth)
  {
  stepSizeX = stepSizeX*-1;
  }
 
  yPos = yPos+stepSizeY;
  if(yPos > (height-ballWidth)||yPos < ballWidth){
   stepSizeY = stepSizeY*-1;
  }
  
}
