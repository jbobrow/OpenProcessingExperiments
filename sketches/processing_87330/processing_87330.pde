
/*
 * Title: P05_02_PerlinNoise
 * By:    Barton Poulson (bartdoesart.com)
 * Date:  29 January 2013
 */

int n = 100;      // Change this number if you want
float y = .05;    // Try making small changes to this
float dy = .02;   // This changes the value of y for each item;
                  //   try making (very) small changes
float noiseY;     // Leave this
int x;            // Leave this

size(600, 200);   // Can change this
background(255);  // Can change this
stroke(100);      // Can change this

/*
 * This drawing uses a for loop (covered in the next section,
 * section 6) to draw a large number of vertical lines that
 * start at the bottom of the window and go up a random amount.
 * The noise() function is for Perlin noise, which gives it a
 * natural-seeming variation.
 *
 * Feel free to change any of the parameters, as well as what
 * is drawn (e.g., lines, circles, curves, etc.) and what is
 * most interesting to you.
 */
 
for(int i = 1; i < n; i++) {   // This cycles through the loop n times
  y += dy;                     // This increments y by a small amount
  x = i * (width/n);           // This moves across the window from left to right
  noiseY = noise(y)*height;    // This determines the y coordinate for the top
                               //   of each line
  line(x, height, x, noiseY);  // This draws the lines
}
