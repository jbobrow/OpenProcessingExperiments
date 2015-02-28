
/*
by:CVlement
 
based on:
Bezier Lines by Neil Burdick, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID=20119
License:
http://creativecommons.org/licenses/by-sa/3.0/
http://creativecommons.org/licenses/GPL/2.0/
*/
 
int pX;
int pY;
int mX;
int mY;
int rand;
color colorVar;
int ang;
  
void setup() {
  size(600, 600);
  colorMode(HSB,700);
  background(100);
  smooth();
  pX = height/2;
  pY = width/2;
}
  
void draw() {
  if (mouseX==0 && mouseY==0) {
     mouseX = width/2;
     mouseY = width/2;
   }
   
  drawBez (1,3,300,500, 200,200);
}
  
void mousePressed(){
   pX = mouseY;
   pY = mouseX;
}
  
  
void mouseReleased(){
  fill(0, 5);
  rect(0, 0, width, height);
  save("offf.png");
}
  
void drawBez(int sW, int speed, int control1X, int control1Y, int control2X, int control2Y) {
  
  mX = mouseY;
  mY = mouseX;
  
  noFill();
  strokeWeight(5);
  stroke(random(50, 500),500,100,75);
  stroke(500,600,600,175);
    
  //this does the Math for finding the points around a circle.
  //I found This Math at http://processing.org/learning/trig/
  //radX = Center of Circle X + cos(radians(ang)) * Size of the Circle
  //radY = Center of Circle Y + sin(radians(ang)) * Size of the Circle
  float radX = mouseY + cos(radians(ang)) * control1X;
  float radY = mouseX + sin(radians(ang)) * control1Y;
    
  float handX = 50 + sin(radians(ang)) * 25;
  float handY = width/2  + sin(radians(ang)) * 25;
    
  float radX2 = height/2 + tan(radians(ang)) * control2X;
  float radY2 = width/2 + tan(radians(ang)) * control2Y;
    
    
  bezier(pX, pY, radX2, radY2, radX, radY, mouseX,mouseY);
  ang = ang + speed;
    
  noStroke();
  fill(0,2);
 
}
 
      

