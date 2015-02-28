
/*

It's Alive!!!
make a circle the "breathes" using variables and for loops/
*/

int xPos=1;
int yPos=1;
int xCount = 5;
int yCount = 2;

void setup(){
  //frameRate(3);
  size (600,600);
  smooth();
}


void draw (){
    background(0);
    noFill();
    stroke(255,0,0);
    strokeWeight(20);
    ellipse(xPos,yPos,50,50);
    xPos = xPos + xCount;  //index the x position by 1
    if(xPos >=600 || xPos <=0){
      xCount=-xCount;    //reverse when you hit the x edge
    }
      yPos = yPos + yCount;  //index the y position by 1
    if(yPos >=600 || yPos <=0){
      yCount=-yCount;    //reverse when you hit the y edge
    }
}
