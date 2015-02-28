
/*
Kristian Hallegado
It's Alive!!!
make a cirle that "breathes" using variables and for loops.
*/

int xPos = 1;
int yPos = 1;
int xCount = 2;
int yCount = 5;

void setup(){
//  frameRate(100);
  size(600,600);
  smooth();
}



void draw(){
  background(0);
  noFill(); 
  stroke(222,111,117);
  strokeWeight(20);
  ellipse(xPos,yPos,30,30);
  xPos = xPos + xCount; //index the position by 1
  if(xPos >= 600 || xPos <= 0){
    xCount = -xCount; //reverse when you hit the far end
  }
   yPos = yPos + round(yCount + 1); //index the position by 1
  if(yPos >= 600 || yPos <= 0){
    yCount = -yCount; //reverse when you hit the far end
  }
}
