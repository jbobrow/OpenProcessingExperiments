
/*
 *  Title: P05_06_TheAttributeMatrix
 *  By:    Barton Poulson (bartdoesart.com)
 *  Date:  01 February 2013
 *
 *  Assignment:
 *    Choose a color palette from Kuler: https://kuler.adobe.com/ 
 *    Create a sketch and put the hex codes for those colors in a
 *    color array, Make sure you give credit to the person who
 *    developed the palette and give the link to it in a comment
 *    in your sketch. Use that palette to color objects in your sketch,
 *    either randomly or systematically
 */

// Palette is "Alone Amongst the Crowds" by dianesteinberg
// URL is https://kuler.adobe.com/#themeID/1990293
color[] palette = {#678C8B, #8FA89B, #A2BAB0, #D0EDDE, #B3B597};
int s = 80;  // Size of untranformed square
float a = 0; // Angle for rotation

void setup() {
  size(600, 200);
  smooth();
  noStroke();
}

void draw() {
  background(palette[0]);

  fill(palette[1]);
  rect(0, 0, s, s);

  // pushMatrix() & pushStyle()
  pushMatrix();
  pushStyle();

  translate(230, 25);  // This moves the origing
  scale(2);            // Doubles the scale
  rotate(a);           // Rotates the matrix by a variable amount
  a += 0.005;          // Increments the angle
  stroke(palette[3]);
  strokeWeight(15);
  fill(palette[2]);
  rect(0, 0, s, s);

  // popMatrix()       // Restores the grid without restoring styles
  popMatrix();
  rect(380, 20, s, s);

  // popStyle()       // Restores the styles
  popStyle();
  rect(width-s, height-s, s, s);
}
