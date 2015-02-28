
int NumBars = 35;
int cols, rows;

void setup()
{
  size(1015, 770);
  background(0);
  // how many columns and rows do we need?
  cols = width/NumBars;
  rows = height/NumBars;
}

void draw (){  
  strokeWeight(1); 
      // Begin loop for columns
      for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
      
      // Scaling up to draw a rectangle at (x,y)
      int x = i*NumBars; //  width
      int y = j*NumBars; // height
      
      // Draw the rectangle with a random color.
      stroke(0);
      fill(random(255),random(255), random(255));
      rect(x,y,NumBars,NumBars); 
    }
  }
}
