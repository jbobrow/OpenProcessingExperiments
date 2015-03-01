
//DMS 110
//Jenny Na
//Week 2 assignment
//source code: http://www.openprocessing.org/sketch/185064- created by Su Hyun Nam
//watched helllo processing

void setup(){
  background (255,255,0);
  size(500,400);
   
  frameRate(30);
}
  
void draw(){
  x=mouseX;
  y=mouseY;
  background(100,120,255); //RGB COLOR
   
  
  ellipseMode(CENTER);
     
   fill(255,200,200); //RGB COLOR// FOUND PINK COLOR
  ellipse(x,y,200,200);
  fill(255,255,255);
  ellipse(x-50,y,30,30);
  ellipse(x+50,y,30,30);
  fill(0,0,0);
   ellipse (x-50,y,10,10);
   fill(0,0,0);
  ellipse(x+50,y,10,10); }
