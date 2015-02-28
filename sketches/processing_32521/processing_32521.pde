
//import processing.pdf.*;

int circleX = 250;
int circleY = 0;
int circlesize = 100;



void setup(){
  size (500,1000);
 // beginRecord(PDF, "pattern1.pdf");
  background(255);
  smooth();
  stroke(255,0,0, 30);
  strokeWeight(3);
fill(0,0,255);
 
}
void draw(){
  
  int x = 30;
  int y = 0;
  
  while (y<250){
    line ((y-10) * x,0,y*x, 500);
    y = y + 1;   
  }   
  
    int xx = 30;
  int yy = -10;
  
  while (yy<500){
    line ((yy+10) * xx,500,yy*xx, 1000);
    yy = yy + 1; 
  }  
  
  noStroke();
  fill(0,0,255, 35);
  
  while(circleY<1000){
ellipse(circleX, circleY , 500,250);
circleY = circleY + 24;
  if (circleX>500){
    circleX = 0;
    circleY = circleY + 250;
}
  }
  /*endRecord();
  exit();
*/}

