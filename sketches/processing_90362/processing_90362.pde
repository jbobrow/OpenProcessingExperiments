
/*
Alek Dimitric
It's alive!
make a circle that "breathes" using variables and for loops
*/


int xPos = 1; 
int yPos = 1;
int xCount = 5;
int yCount = 2;
void setup (){
  frameRate (60);
  size(600,600);
  smooth();
}


void draw(){
    background(0);
    noFill();
    stroke(235, 98, 87);
    strokeWeight(20);
    ellipse(xPos,yPos,30,30);
    xPos = xPos + xCount; //index x position by 1
    if (xPos >= 600 || xPos <=0){
      xCount = -xCount; // reverse when hit the x edge
    }
    yPos = (yPos + (yCount*gravity)) //index y position by 1
    if (yPos >= 600 || yPos <=0){
      yCount = -yCount; // reverse when hit the y edge
    }
}
