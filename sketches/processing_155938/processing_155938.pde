
//homework day2_2 by Eliana Xue Feng
int change=3;
float pointaX=0.8;
float pointaY=1.1;
int pointbX=0;
int pointbY=2;
int pointcX=11;
int pointcY=8;
float pointdX=3.2;
float pointdY=4.4;


void setup(){
  size(800,600);
  frameRate(50);
}

void draw(){
  //set up a background color
  background(mouseX/10,mouseY/10,22);
  
  //draw a beizer 
  stroke(mouseX/10);
  strokeWeight(mouseY+3);
  bezier(pointaX,pointaY,pointbX,pointbY,pointcX,pointcY,pointdX,pointdY);
  pointaX+=change+1.1;
  pointaY+=change-2.2;
  pointbX+=change+5;
  pointbY+=change+10;
  pointcX+=change+1;
  pointcY+=change+2;
  pointdX+=change+7.2;
  pointdY+=change-2.9;
  

}


