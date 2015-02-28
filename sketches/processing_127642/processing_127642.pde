
/**
 This example further explores the HSB color space by mapping
 hue to the horizontal component of the canvas and saturation
 to the vertical. 
 
 This is also our first example of the grid patter.
 
 C. Andrews
 2014-01-08
 **/


void setup() {
  size(600, 600); 

  // we use the width and height of the canvas to define the 
  // range for hue and saturation
  colorMode(HSB, width, height, 100);
}


void draw() {
  background(0, 0, 100);

  float numDivisions = mouseX/2 +1;
  float  w = width / numDivisions;
  float h = height / numDivisions;
  float y = 0;

  // This nested for-loop is our basic pattern for making grids  
  // The outer loop repeats the rows to fill the canvas
  for (int j = 0; j < numDivisions; j++) {
    y = h*j;
    // the inner loop makes one full row of the grid
    for (int i = 0; i < numDivisions; i++) {
      // if you turn off the fill, you woll see that this makes a grid over the canvas
      float x = i * w;
      fill(x, height - y, 100);
      stroke(x, height - y, 100);
      rect(x, y, w, h);
    }
  }
}



