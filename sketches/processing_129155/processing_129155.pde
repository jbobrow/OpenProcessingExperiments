
/**
 This example shows how we can change the text size.
 It creates a dramatic zoom effect by increasing the text size as
 the text moves up the canvas.
 
 C. Andrews
 2014-01-20
 **/

String str = "Bowties are cool"; // text to display
PFont font; // our font

void setup() {
  size(600, 600);
  background(255);
  font = createFont("Arial", 72, true); 

  fill(0, 50);
  textFont(font);
  // center align the text so it stays in the center of 
  // the canvas as it resizes
  textAlign(CENTER);

  noLoop(); // just draw it once and stop
}


void draw() {
  float x, y; // the current text location
  float fontSize; // the current text size

    // start the text at the bottom and in the middle
  x = width/2;
  y = height;

  fill(0, 0, 255, 30); 
  // loop until y is in the top quarter of the canvas
  while (y > height/4) {
    // we use our y position to figure out the text size using map
    fontSize = map(y, height, height/4, 5, 72);
    // set the text size
    textSize(fontSize);
    // draw the text
    text(str, x, y);
    // move up the canvas
    y = y - .5;
  }

  // The above sweep was drawn in blue, so we draw one more time in
  // white so we can read the text
  fill(255);
  textSize(72);
  text(str, x, y);
}



