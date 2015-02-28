
/*
  EX2_Draw
  Quinton Statucki
  January 29, 2013
  
  This is an interactive drawing program that draws straight
  lines from thetop left corner to where ever your mouse is.
*/ 


void setup(){
  size(480, 480);
  smooth();
}
void draw(){
  //Draw a line with my mouse while i have the button request
  //background(255);
  
  if (mousePressed== true){ //change the color when i click the mouse
  line(pmouseX, pmouseY,10,10);
  }
} 

void mouseReleased(){
stroke(random (0,225), random (0,255), random (0,255),120);
  }
