
//import processing.pdf.*;

int circleX = 250;
int circleY = -125;
int circlesize = 500;
int circleX2 = 250;
int circleY2 = 500;
int circlesize2 = 500;
int circleX3 = 250;
int circleY3 = 800;
int circlesize3 = 500;

void setup(){
  size (500,1000);
  //beginRecord(PDF, "pattern.pdf");
  background(255);
  smooth();
  stroke(0,0,255, 50);
  strokeWeight(10);
fill(0,0,255, 30);
 
}
void draw(){
  
  
     
  
  
  fill(0,0,255, 10);
  
  while(circleY<250){
ellipse(circleX, circleY , circlesize,500);
circleY = circleY + 15;
  if (circleX>500){
    circleX = 0;
    circleY = circleY + 1;
}
  }
  
  while(circleY2<750){
ellipse(circleX2, circleY2 , circlesize2,500);
circleY2 = circleY2 + 15;
  if (circleX2>500){
    circleX2 = 0;
    circleY2 = circleY2 + 1;
}
  }
    while(circleY3<1000){
ellipse(circleX3, circleY3 , circlesize3,500);
circleY3 = circleY3 + 15;
  if (circleX3>500){
    circleX3 = 0;
    circleY3 = circleY3 + 1;
}
  }
  /*endRecord();
  exit();
*/}

