
/*
Chad Cruz
It's ALIVE!!!
make a circle that "breathes" using variables and for loops.
*/
int xPos=1;
int yPos=1;
int xCount=5;
int yCount=30;

void setup(){
  background(0);
  frameRate(300);
  size(600,600);
  smooth();
}
void draw(){
  //for(int i=0;i<600;i++){
    background(0);
    noFill();
    stroke(random(0,255),random(0,255),random(0,255));
    strokeWeight(20);
    ellipse(xPos,yPos,30,30);
    xPos=xPos+xCount; //index position by 1
    if(xPos>=600||xPos <= 0){
      xCount=-xCount; //revers when you hit the far edge
    }
      yPos=yPos+yCount; //index position by 1
    if(yPos>=600||yPos <= 0){
      yCount=-yCount; //revers when you hit the far edge
    }
}
