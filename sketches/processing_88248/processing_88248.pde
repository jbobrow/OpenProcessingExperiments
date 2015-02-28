
/*
 *  Title: P06_03_ForLoops_3
 *  By:    Barton Poulson (bartdoesart.com)
 *  Date:  04 February 2013
 *
 *  Assignment:
 *    Create a sketch that uses a for loop to go through items in  
 *    an array (such as x or y coordinates, colors, text, etc.)
 *    either in order or randomly.
 */
 
// This palette is "Vintage Ralph Lauren" by dianesteinberg.
// See https://kuler.adobe.com/#themeID/2216979
// Approximate HTML color names from WolframAlpha.com are:
// Wheat, Beige, Slate Gray, Indian Red, and Dark Salmon (base color)
color[] c = {#E3CDA4, #7E827A, #2F343B, #703030, #C77966};

int n = 4;   // Number of circles
int d = 100;  // Diameter of circles

float[] x  = new float[n]; // x coordinates for circles
float[] y  = new float[n]; // y coordiantes for circles

void setup() {
  size(600, 400);
  smooth();
  frameRate(.5);
  
  for (int i = 0; i < n; i++) {  // Cycles through arrays
    x[i]  = (i+1) * width/(n+1); // Positions evenly on x
    y[i]  = random(height);      // Positions randomly on y
  }
}

void draw() {
  background(c[4]);
  
  for (int i = 0; i < n; i++) {
    stroke(220);
    line(x[i], 0, x[i], height);
    
    noStroke();
    fill(c[i]);
    ellipse(x[i], y[i], d, d);
    
    y[i] = random(height);      // New position on y
  }
}
