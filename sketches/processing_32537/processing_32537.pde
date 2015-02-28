
//import processing.pdf.*;

int circleX = 250;
int circleY = 0;
int circlesize = 100;



void setup(){
  size (500,1000);
  //beginRecord(PDF, "pattern7.pdf");
  background(255);
  smooth();
  stroke(0,0,255);
  strokeWeight(3);
fill(0,0,255, 10);


}
void draw(){
  
  
  
  int strokescale = 5;
  int x = 30;
  int y = 0;
  
  while (y<250){
    strokeWeight(y);
    line ((y+10) * x,1000,y*x, 500);
    y = y + 1;   
  }   
  
  int xx = 30;
  int yy = 0;
  
  while (yy<250){
    strokeWeight(yy);
    line ((yy+10) * xx,0,yy*xx, 500);
    yy = yy + 1;   
  }   
    int xxx = 30;
  int yyy = 0;
  
  while (yyy<250){
    strokeWeight(yyy);
    line ((yyy-10) * xxx,0,yyy*xxx, 500);
    yyy = yyy + 1;  
  }
  
  int xy = 30;
  int yx = 0;
    while (yx<500){
    strokeWeight(yx);
    line ((yx-10) * xy,1000,yx*xy, 500);
    yx = yx + 1;  
    }
    
    
  noStroke();
  fill(0,0,255, 20);
  
 /* while(circleY<500){
ellipse(circleX, circleY , 500,250);
circleY = circleY + 24;
  if (circleX>500){
    circleX = 0;
    circleY = circleY + 250;
}
 }
 /* endRecord();
  exit();
*/}

