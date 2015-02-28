
//import processing.pdf.*;

int circleX = 0;
int circleY = 0;
int circlesize = 0;
  int circlesize2 = 0;
  int circleX2 = 500;
  int circleY2 = 500;



void setup(){
  size (500,1000);
 // beginRxecord(PDF, "pattern.pdf");
  background(255);
  smooth();
  stroke(0,0,255, 99);
  strokeWeight(10);
fill(0,0,255);
 
}
void draw(){
  
  /*int x = 100;
  int y = 0;
  
  while (y<250){
    line (y * x,0,y*x, 1000);
    y = y + 1;   
  } */  
  

  fill(0,0,255,1);
  
  while(circlesize<2200){
ellipse(circleX, circleY , circlesize,circlesize);
circlesize = circlesize + 100;
  if (circleY>1000){
    circleY = 0;
    circleX = circleX + 500;
}
  }
  
    
  fill(0,0,255,1 );
  
  while(circlesize2<2200){
ellipse(circleX2, circleY2 , circlesize2,circlesize2);
circlesize2 = circlesize2 + 100;
  if (circleY2>500){
    circleY2 = 500;
    circleX2 = circleX2 + 500;
}
  }
 /* endRecord();
  exit();
*/}

