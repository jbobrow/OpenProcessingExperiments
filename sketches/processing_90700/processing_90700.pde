
/*
Jeffrey Pangilinan
It's Alive!!!
make a circle that "breathes" using variables and for loops.
*/


int xPos = 1;
int yPos = 1;
int xCount = 5;
int yCount = 2;



void setup(){
 frameRate(50000);
  size(600,600);
  smooth();
  
}  


void draw(){
    background(0);
    noFill();
    stroke(0,215,255);
    strokeWeight (20);
    ellipse(xPos,yPos,30,30);
    xPos = xPos + xCount;  //index x position by 1
    if(xPos >+ 600 || xPos <=0){
      xCount = -xCount;   //reverse when you hit the far edge
    }
     yPos = yPos + round(yCount*1.4);  //index x position by 1
    if(yPos >+ 600 || yPos <=0){
      yCount = -yCount;   //reverse when you hit the far edge  
    }
}
