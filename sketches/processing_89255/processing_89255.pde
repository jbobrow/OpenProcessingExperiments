
/*
 *  Title: P07_02_HoveringAndClicking
 *  By:    Barton Poulson (artbybart.org)
 *  Date:  13 February 2013
 *
 *  Assignment: 
 *    Create a sketch that responds to (a) mouse hovering by changing
 *    some behavior when the mouse is over a designated object; and
 *    (b) mouse clicking by changing some behavior when the object
 *    over which the mouse is hovering is clicked.
 *
 *  Notes:
 *    This palette is "Bahamas" by learnedt15
 *    See https://kuler.adobe.com/#themeID/2238023
 */

color[] palette = {#003056, #04518C, #00A1D9, #47D9BF, #F2D03B};
int fa = 0;  // Flash alpha
int s = 100; // Square size
int sa = 0;  // Square alpha

void setup() {
  size(600, 400);
  smooth();
  cursor(CROSS);
  rectMode(CENTER);
  strokeWeight(10);
}

void draw() {
  background(palette[2]);
  
  // Instructions
  textAlign(LEFT, BOTTOM);
  fill(palette[0]);
  text("hover over square", 10, 20);
  text("then wait for prompt", 10, 40);
  
  // Flash of yellow over sketch
  noStroke();
  fill(palette[4], fa);
  fa -= 5;
  fa = constrain(fa, 0, 255);
  rect(width/2, height/2, width, height);
  
  // Square in middle
  stroke(palette[0]);
  fill(palette[4], sa);
  rect(width/2, height/2, s, s);
  
  /* Note: I'm using a square for the hovering and clicking,
   * so I need to use four conditions to identify the position
   * of the mouse, with one on each border of the square. If I
   * were using a circle, it would be easier:
   *   if (dist(circleX, circleY, mouseX, mouseY) < radius)
   * where circleX and circleY are the variables that placed the
   * center of the circle and radius is a varible that gives the
   * radius of the circle.
   */
  
  // Checks if mouse is hovering over square
  if ((mouseX > width/2  - s/2) &&
      (mouseX < width/2  + s/2) &&
      (mouseY > height/2 - s/2) &&
      (mouseY < height/2 + s/2)) {
        
    // If so, increase alpha for square (within constraints)
    sa++;
    sa = constrain(sa, 0, 255);
     
    // Once alpha maxes, show prompt
    if (sa == 255) {
      fill(palette[2]);
      textAlign(CENTER, CENTER);
      text("click", width/2, height/2);
       
      // If mouse is clicked, trigger flash
      if (mousePressed) {
        fa = 255;
       }
     }
  } else {
    
    // If mouse leaves square, decrease square alpha
    sa--;
    sa = constrain(sa, 0, 255);
  }
}
