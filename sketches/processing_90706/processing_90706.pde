
/*

It's Alive!!!
Make a circle that "breathes" using variables and loops.
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
    noFill();
    stroke(0,168,255);
    strokeWeight(20);
    ellipse(xPos,yPos,1,1);
    xPos = xPos + xCount; //index x pos by 1
    if(xPos >= 600 || xPos <= 0){
      xCount=-xCount; //reverse when you hit the far edge
    }
      yPos = yPos + round(yCount*-2.8); //index x pos by 1
    if(yPos >= 600 || yPos <= 0){
      yCount=-yCount; //reverse when you hit the far edge
    }
}
