
int videoScale = 6;
int cols, rows;

void setup() {
  size(605, 605);
  background(255);
  frameRate(100);
  cursor(CROSS);
  cols = width/videoScale;
  rows = height/videoScale;
  
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows 
    for (int j = 0; j < rows; j++) {
    // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale;
      int y = j*videoScale;
     fill(255);
      stroke(200);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      rect(x,y,videoScale,videoScale); 
    }
  }
}


void draw() {
  
  smooth();

  fill(0);
  rect(10, 3, 40, 12);
  fill(255);
  text((mouseX*100)/600, 28, 14);
  text("X=", 10, 14); 


  fill(0);
  rect(60, 3, 40, 12);
  fill(255);
  text((mouseY*100)/600, 78, 14);
  text("Y=", 60, 14); 
  
  stroke(0);
  strokeWeight(6);
   if (mousePressed) { 
    line(mouseX, mouseY, pmouseX, pmouseY);
  }

  if (keyPressed) {
    if (key == 'r') {
      strokeWeight(1);
      background(255);
      for (int i = 0; i < cols; i++) {
    // Begin loop for rows 
    for (int j = 0; j < rows; j++) {
    // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale;
      int y = j*videoScale;
     fill(255);
      stroke(200);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      rect(x,y,videoScale,videoScale); 
    }
  }
    }
  }
}
