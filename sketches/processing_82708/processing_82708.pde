
int videoScale = 20;

// Number of columns and rows in our system
int cols, rows;

void setup() {
  size(400,400);
  background(0);
  // Initialize columns and rows
  cols = width/videoScale;
  rows = height/videoScale;
}

void mousePressed() {
  
  // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {
      
      // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale;
      int y = j*videoScale;
      fill(random(255));
      stroke(0);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      rect(x,y,videoScale,videoScale); 

    }
  }
  fill(0,0,139,160);
  rect(0,0,width,height);
  
}

void draw () {
}



