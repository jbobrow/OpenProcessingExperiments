
//import processing.pdf.*;

int circleX = 250;
int circleY = 250;
int circlesize = 0;
int circleX2 = 250;
int circleY2 = 500;
int circlesize2 = 0;
int circleX3 = 250;
int circleY3 = 750;
int circlesize3 = 0;


void setup(){
  size (500,1000);
  //beginRecord(PDF, "pattern5.pdf");
  background(255);
  smooth();
  stroke(0,0,255, 50);
  strokeWeight(15);
fill(0,0,255, 1);
 
}
void draw(){
  
  /*int x = 30;
  int y = 0;
  
  while (y<250){
    line (y * x,0,y*x, 1000);
    y = y + 1;   
  } */  
  
 
  
  while(circlesize<1400){
ellipse(circleX, circleY , circlesize,circlesize);
circlesize = circlesize + 50;
  if (circleY>500){
    circleY = 500;
    circleX = circleX + 500;
}
  }
  
    
  
  while(circlesize2<1400){
ellipse(circleX2, circleY2 , circlesize2,circlesize2);
circlesize2 = circlesize2 + 50;
  if (circleY2>1000){
    circleY2 = 1000;
    circleX2 = circleX2 + 500;
}
  }
 
  while(circlesize3<1400){
ellipse(circleX3, circleY3 , circlesize3,circlesize3);
circlesize3 = circlesize3 + 50;
  if (circleY3>1000){
    circleY3 = 1000;
    circleX3 = circleX3 + 500;
}
}
/*endRecord();
exit();
*/}

