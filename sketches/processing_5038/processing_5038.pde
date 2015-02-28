
class Circle {
 
  int radius = 20;
  float x, y;
  float vy;
  
 Circle(float ix, float iy, int irad) {
  x = ix;
  y = iy;
  radius = irad;
 } 
 
 void show() {
   fill(0, 10);
   noStroke();
  ellipse(x, y, radius, radius); 
 }
 
  
}

