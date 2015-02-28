
/**
 This example forms a moving ticker, scrolling the text across the 
 screen. It is partially based on the Processing Text tutorials:
 http://www.processing.org/tutorials/text/
 
 The main additions are a resumption of the scroll before the text is 
 completely gone and a streak behind the letters.
 
 C. Andrews
 2014-01-20
 **/


String str = "Bowties are cool"; // our text to display
PFont font; // our font variable
int x, y; // current position of the text
void setup() {
  size(600, 600);
  background(255);

  // create the font
  font = createFont("Arial", 64, true); 

  // start the text off screen halfway down the canvas
  x = width;
  y = height/2;

  // set the font   
  textFont(font);
}


void draw() {

  // draw a full screen partially opaque white rectangle for the blur
  fill(255, 30);
  rect(0, 0, width, height);


  // set the fill for the text
  fill(0, 70);

  // If the head of the text has started to go off screen, 
  // draw a second copy behind it by 50 pixels
  if (x < 0) {

    text(str, x + textWidth(str) + 50, y);
  }

  // if the first copy of the text is completely offscreen, set x to be 
  // at the current location of the second copy
  if (x <= -textWidth(str)) {
    x = x + (int)textWidth(str) + 50;
  }

  // Draw the text
  text(str, x, y);
  // move the position one to the left
  x--;
}



