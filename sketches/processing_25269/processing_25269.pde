
//Problem Set 3
//Question 4
//Matt Iannacci

boolean grid[][] = new boolean[10][10];
void setup() {
  size(500,500);
  smooth();
}  
void draw() {
  background(255);
  int radius = 1000;
  int spacing = 10; 
  while ( radius > 0 ) {
  fill(mouseX,mouseY,0,55);
  ellipse(width/2, height/2, radius, radius);
  radius = radius - spacing;
  }
  
  float w = width / grid.length;
  for (int i=0; i < grid.length; i++) {
    for (int m=0; m < grid.length; m++) {
      float x = w/2 + i*w;
      float y = m/2 + m*w;
      if (grid[i][m]) {
        noFill();
      }
      else {
        noFill();
      }
      ellipse(x, y, w, w);
    }
 }
}

