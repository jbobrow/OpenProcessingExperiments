
int x;
int y;
int directionx;
int directiony;

//runs once
void setup(){
  size(600,400);
  smooth();
  x=10;
  y=-200;
  directionx=0;
  directiony=5;
}

//runs every frame
void draw(){
  background(0);
  x+=directionx;
  y+=directiony;
  if(x<1){
    directionx=0;
  }
  if(y>400){
    directiony=-5;
  }
  if(y>400){
    directionx=3;
  }
  if(y<300){
    directiony=5;
  }
  ellipse(x,y,20,20);
}

