
/* lilly gonzales
It's Alive!!!
make a circle that "breathes" using variables and for loops.
*/

int xPos=1;
int yPos=1;
int xCount=5;
int yCount=2;

void setup(){
  //frameRate(18);
  size(600,600);
  smooth();
}

void draw(){
  background(0);
  noFill();
  stroke(30,30,30);
  strokeWeight(20);
  ellipse(xPos,yPos,30,30);
  xPos=xPos+xCount; //index x position by 1
  if(xPos>=600 || xPos<=0){
    xCount=-yCount; //reverse when you hit the
  }
  yPos=yPos+round(yCount*1.2); //index y position by 1
  if(yPos>=600 || yPos<=0){
    yCount=-yCount; //reverse when you hit the y edge
}
}
