
float x = 1;
float y = 1;
 
 
 
void setup() {
  size(640, 360);
 
  stroke(255,220,60);
  strokeWeight(25);
}
 
void draw() {
  background(255,204,0);
   
  x = mouseX ;
  y = mouseY ;
  
  
  ellipse(x, y, 50, 50);
  }
