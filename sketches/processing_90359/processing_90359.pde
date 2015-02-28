
/*

Eleni Bazezew
2/20/2013 

It's Alive!!!
make a circle that "breathes" using variables and for loops.

*/

int xPos = 1;
int yPos = 1;
int xCount = 5;
int yCount = 2;

void setup () {
  // frameRate(900);
  size(600,600);
  smooth();
 
}
 
 void draw() {
  
     background(0);
     noFill();  
     stroke(0,255,150);
     strokeWeight(20);
     ellipse(xPos,yPos,30,30);
     xPos = xPos + xCount; // index x positon by 1
     if(xPos >= 600 || xPos <= 0) {
        xCount= -xCount; //reverse when you hit the far edge 
     }

     yPos = round(yPos +(yCount*1.2)); // index y positon by 1
     if(yPos >= 600|| yPos <= 0) {
        yCount= -yCount; //reverse when you hit the far edge 
     }
  }
