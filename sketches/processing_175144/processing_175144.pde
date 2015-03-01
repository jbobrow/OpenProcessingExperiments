
// INITIAL SETUP
noStroke();

// Dimensions of the final rectangle. Using processing pixel units for now.
int rect_dim_x = 260;
int rect_dim_y = 400;

// The padding for the rectangle in the canvas.
int offset = 20;

// The number of vertical lines in the sketch
int num_lines = 13;

// The likelihood that a bridge will be created.
// This number should be treated as a whole percent. (out of 100)
float bridge_freq = 15;

// How thick the lines will be is dependent on the dimensions of the parent rectangle.
float line_thickness = rect_dim_x / (num_lines * 2);

// The number of cross-bar grids to iterate through for each vertical line.
int cross_bar_grids = int(rect_dim_y / line_thickness);

// Setting the canvas size based on the size of the rectangle + the offset padding.
size(rect_dim_x + (offset * 2), rect_dim_y + (offset *2) );

// Building the parent rectangle
rect(offset, offset, rect_dim_x, rect_dim_y);

// Changing the color of the fill for visibility.
fill(0,255);

// Iterating to create each line.
// The nested loop creates the cross bar patterns.
for(int i = 0; i < num_lines; i = i + 1) {
  float vertical_x = (i * 2 * line_thickness);
  
  // Debugging Comments
  print(vertical_x);
  print("//");
  print(line_thickness);
  print("//");
  
  // Build the vertical lines.
  rect(vertical_x + offset, offset, line_thickness, rect_dim_y);
  if(i != num_lines) {
    // Reset this flag every time there is a new vertical iteration
    // This is a flag to ensure that there will be no repeating grid filling
    boolean previous_filled = false;
    for (int j = 0; j < cross_bar_grids; j = j + 1) {
      // If the random number is greater than the bridge grequency and the previous grid
      // has not been filled.
      if ( random(100) < bridge_freq && previous_filled == false ) {
        // Set the flag to true to make sure the next grid is not filled
        previous_filled = true;
        // Create the rectangle.
        rect(vertical_x + offset + line_thickness, offset + (line_thickness * j), line_thickness, line_thickness);
      } else {
        // Reset the flag if the grid isn't filled.
        previous_filled = false;
      }
    }
  }
}
