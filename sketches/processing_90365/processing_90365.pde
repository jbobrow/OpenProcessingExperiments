
/*
Christal Rhea
Period 2

It's Alive!!
make a circle that "breathes" using variables and for loops.
*/
int xPos = 1;
int yPos = 1;
int xCount = 5;
int yCount = 2;

void setup(){
  //frameRate(20);
  size(600,600);
  smooth();
 
}

void draw(){
    background(0);
    noFill();
    stroke(234,89,100);
    strokeWeight(20);
    ellipse(xPos,yPos,30,30);
    xPos=xPos+xCount; //index x position by 1
    if(xPos>=600||xPos<=0){
      xCount=-xCount; // reverse when you hit the x edge
    }
     yPos=(yPos-(yCount*2)); //index x position by 1
    if(yPos>=600||yPos<=0){
      yCount=-yCount; // reverse when you hit the y edge
    }
  }
