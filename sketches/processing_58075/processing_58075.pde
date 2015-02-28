
//Problem set 3
//Question 4
//Natalie DeCoste 

boolean grid[][] = new boolean[40][40];
void setup() {
  size(400, 400);
  smooth();
} 
void draw() {
  background(255);
  int radius = 2000;
  int spacing = 30;
  while ( radius > 0 ) {
    strokeWeight(2);
    fill(mouseX, mouseY, pmouseX);
    ellipse(mouseX, mouseY, radius, radius);
    radius = radius - spacing;
  }

  float w = width / grid.length;
  for (int i=0; i < grid.length; i++) {
    for (int m=0; m < grid.length; m++) {
      float x = w/2 + i*w;
      float y = m/2 + m*w;
      if (grid[i][m]) {
       
      }
      else {
        noFill();
      }
      
      ellipse(x, y, w, w);
    }
  }
}


