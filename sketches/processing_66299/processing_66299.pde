
int xPos=0;
int yPos=0;
int velocitya=5;
int velocityb=10;

int xPos1=6;
int yPos2=3;
int velocityc=23;
int velocityd=15;

void setup(){
  size(800,800);
  smooth();
}
void draw(){
  background(3,244,255);
  
  // + speed to the xPos,yPos
  xPos = xPos + velocitya;
  yPos = yPos + velocityb;
  xPos1 = xPos1 + velocityc;
  yPos2 = yPos2 + velocityd;
  

  
  if ((xPos>width) || (xPos<0)){
    velocitya=velocitya*-1;
}
  if ((yPos>height) || (yPos<0)){
    velocityb=velocityb*-1;
}
  if ((xPos1>width) || (xPos1<0)){
    velocityc=velocityc*-1;
}
  if ((yPos2>height) || (yPos2<0)){
    velocityd=velocityd*-1;
}
  stroke(30);
  fill(82,90,55,15);
  ellipse(xPos1,yPos2,50,50);
  
  stroke(0);
  fill(82,90,55,15);
  ellipse(xPos,yPos,50,50);
}
  

