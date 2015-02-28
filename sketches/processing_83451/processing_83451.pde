
import netscape.javascript.*;

/**
 * Cant touch this. 
 * 
 * Remake of "tickle," now with This. Try to touch it .
 * Off the screen - Game over.
 */
 
 

String message = "this";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(800, 600);
  PFont font = loadFont("TheSans-Plain-12.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  hr = textWidth(message) ;
  vr = (textAscent() + textDescent()) ;
  noStroke();
  x = width / 2;
  y = height / 2;
 
}

void draw() {
  // instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top, ce ga zadanš se zavrti komad
  
  background(255);
  fill(255, 120);
  rect(0, 0, width, height);
  fill(0);
  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-20, 20);
    y += random(-20, 20);
  }
  text("THIS", x, y);
}


