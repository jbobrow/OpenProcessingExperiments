
/*
Alec Shugarman
It's Alive!!!
make a circle that "breathes" using vcariables and for loops.
*/
int xPos = 1;
int yPos = 1;
int xCount = 5 ;
int yCount = 3 ;

void setup(){
//  frameRate(3);
  size(600,600);
  smooth();
}


void draw(){
  background(0);
  noFill();
  stroke(234,10,131);
  strokeWeight(20);
  ellipse(xPos,yPos,30,30);
  xPos = xPos + xCount;   //index x position by 1
  if(xPos >= 600 || xPos <=0){
    xCount = -xCount;       //reverse when you hit the far edge
  }
      yPos = round(yPos + (yCount*2.));   //index x position by 1
  if(yPos >= 600 || yPos <=0){
    yCount = -yCount;       //reverse when you hit the far edge
}
  }
