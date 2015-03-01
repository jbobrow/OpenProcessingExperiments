
int counter;
int videoScale = 10;
int cols, rows;


void setup() {  //setup function called initially, only once
  size(914, 600);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;

  cols = width/videoScale;
  rows = height/videoScale;
}

void draw() { 
    // Draw the box we will draw in
    size(914, 600);

    // Begin loop for columns
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
      
      // Scaling up to draw a rectangle at (x,y)
      int x = i*videoScale;
      int y = j*videoScale;
      fill(255);
      stroke(0);
      // For every column and row, a rectangle is drawn at an (x,y) location scaled and sized by videoScale.
      rect(x,y,videoScale,videoScale); 
      }
    }

    // house
    rect(307, 250, 300, 300);
    // roof
    triangle(50, 250, 350, 250, 200, 50);
    // door
    rect(175, 450, 50, 100);
    // door knob
    ellipse(185, 515, 6, 6);
    // left windows
    rect(85, 300, 40, 40);
    rect(130, 300, 40, 40);
    rect(85, 345, 40, 40);
    rect(130, 345, 40, 40);
    // right windows
    rect(230, 300, 40, 40);
    rect(275, 300, 40, 40);
    rect(230, 345, 40, 40);
    rect(275, 345, 40, 40);  
}
