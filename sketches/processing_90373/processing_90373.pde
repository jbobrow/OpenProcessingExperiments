
/*
Jamarius Herbert
it's alive!!!
*/

int xPos =1;
int yPos =1;
int xPos = 6;
int yPos = 3;

void setup(){
  //framerate(3)
  size(600,600);
  smooth();
}
  
  
void draw(){
  background(0);
  stroke(234,453,234);
  strokeWeight(20);
  ellipse(xpos,yPos,30,30);
  xPos = xPos + xCount;  //index x position by 1
  if(xPos >= 600 || xPos <= 0){
    xCount = -xCount;
  }
  yPos = (yPos +[yCount
