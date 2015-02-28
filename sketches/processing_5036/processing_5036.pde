
class Node {
 
  float x, y, vx, vy;
  int radius = 5;
  
  Node(float ix, float iy) {
 x = ix;
 y = iy;
   
 } 
  
 void create() {
  fill(255);
  noStroke();

  ellipse(x, y, radius, radius); 
 }
 
 void move() {
  x = random(0, width);
  y = random(0, height); 
 }
  
}

