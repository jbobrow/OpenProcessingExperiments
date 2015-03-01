
float x = 200,y = 200; 

void setup() {
  size(800,800,P2D);
 
  
}
 void draw() {
  background(255,255,255);
   
   fill(255,0,0);
  x = x + random(-2,2);
  y = y + random (-2,2);
  ellipse( x,y,5,5);
 }
