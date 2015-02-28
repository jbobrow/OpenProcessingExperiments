
/*
 *  Title: P09_01_Functions
 *  By:    Barton Poulson (artbybart.org)
 *  Date:  13 February 2013
 *
 *  Assignment: 
 *    Create a sketch that uses a custom function.
 */

void setup() {
  size(600, 200);
  smooth();
  frameRate(2);
}

// Create randomly placed Pac-Men with a function
void draw() {
  background(0);
  pacMan();
}
// Define the Pac-Man function
void pacMan() {
  noStroke();                       // No outline
  float x = random(0, width);       // Random x coordinate
  float y = random(0, height);      // Random y coordinate
  float d = random(20, 100);        // Random diameter within bounds
  fill(#FFEF00);                    // Bright yellow fill
  arc(x, y, d, d, 0.2*PI, 1.8*PI);  // Draws the Pac-Man shape
}


