
// Text is like anything else we draw.. it has a position, a dimension, etc..
// Therefore we can animate text like any other visual element. 

String message = "The quick brown fox jumps over the lazy dog";

float x;
float y;

void setup() {
  size(300, 300); 
  smooth();
  textSize(150);
  textAlign(LEFT, CENTER);
  y = height/2+30;
  x = width;
}

void draw() {
  background(255);
  fill(0); 
  
  text(message, x, y);
  
  // scroll!
  // it's easier to read if we move the text to the left
  x-=3;
  // textWidth calculates the width in pixels of a String, using
  // the currently active PFont.
  // note the MINUS here.. pretty important, since we're moving left
  if ( x < -textWidth(message) ) {
    x = width;
  }
}


