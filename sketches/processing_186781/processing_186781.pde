
size(900,300);
void setup() {
  
}
void draw() {
  background(10);
  
 
  for (int i= 255 ; i > 0 ;i=i-15) {
    fill(i, 200, 200);
    triangle(30, 75, 58, 20, i, i);
    ellipse(400, 58, 250, 20, i, i);
   ellipse(300, -75, -250, 20, i, i);
    triangle(400, 250, 600, 500, i, i);
  
 
    triangle(300, 350, 200, 200);
    triangle (350, 250, 100, 100);
    triangle(500, 100, 250, 20, i, i);
    triangle(600, 75, 58, 10, i, i);
    ellipse(5000, 58, 250, 20, i, i);
   
     
  }
}﻿
