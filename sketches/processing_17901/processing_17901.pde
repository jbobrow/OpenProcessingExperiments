
float TheLimit = 0;
float PositionX = 0;
float PositionY = 0;
float ellipseSize = 80;
float littleellipseSize = 40;
 
void setup(){
  background(169,87,49);
  size(250,250);
  frameRate(1.4);
  smooth();
}
 
void draw(){
  
  for(int i=0;i<2;i++){
    stroke(88,126,61);
    strokeWeight(7);
    fill(8,87,107);
    ellipse(PositionX,PositionY,ellipseSize, ellipseSize);
    strokeWeight(10);
    stroke(238,113,25);
     ellipse(PositionX,PositionY,littleellipseSize, littleellipseSize);
    PositionX+=ellipseSize;
    if(PositionX>width){
      PositionY+=ellipseSize;
      PositionX=0;
  }
  }
  }


