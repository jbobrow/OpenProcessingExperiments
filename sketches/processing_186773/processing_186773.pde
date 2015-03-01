
void setup() {
  size(600, 600);
  colorMode(HSB);
}
void draw() {
  background(0);
 

  for (int i= 255 ; i > 0 ;i=i-15) {
    fill(i, 200, 200);
    triangle(30, 75, 58, 20, i, i);
    triangle(400, 58, 250, 20, i, i);
    triangle(300, -75, -250, 20, i, i);
    triangle(400, 250, 600, 500, i, i);
 

    ellipse(300, 350, 200, 200);
    ellipse(350, 250, 100, 100);
    triangle(500, 58, 250, 20, i, i);
  
    
  }
}﻿
