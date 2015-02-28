
// checkers!
// using a 2 dimensional array 

boolean grid[][] = new boolean[5][5];

void setup() {
  size(250, 250);
  smooth();
}

void draw() {
  background(128);  
  float w = width / grid.length;  
  for (int i=0; i < grid.length; i++) {
    for (int j=0; j < grid.length; j++) {
      float x = w/2 + i*w;
      float y = w/2 + j*w;
      if (grid[i][j]) {
        fill(0);
      }
      else {
        fill(255);
      }
      ellipse(x, y, w, w);
    }
  }
}

void mousePressed() {
  int w = width / grid.length;
  int i = mouseX / w;
  int j = mouseY / w;
  grid[i][j] = !grid[i][j];
}
