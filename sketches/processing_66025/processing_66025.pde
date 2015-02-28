
PImage Sean;
PImage Daniel;
int xValue;
int aValue;

void setup(){
  size(750,250);
  xValue = 100;
  aValue = 460;
  strokeWeight(10);
  frameRate(15);
}

void draw(){
  background(0);
   Sean = loadImage("MiniConnery.jpg");
   Daniel = loadImage("MiniCraig.jpg");
   image(Sean,25,15);
   image(Daniel,450,50);
   
  stroke(255,0,0);
  point(xValue,150);
  xValue= xValue + 25;
  if(xValue > 500){
    xValue= 175;
  }
  point(aValue,100);
  aValue= aValue - 25;
  if(aValue < 150){
    aValue= 460; }
  
 

  
}

