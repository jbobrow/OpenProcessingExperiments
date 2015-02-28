
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 18-1: User input
// Modified by Kevin Gutowski
// ocf.berkeley.edu/~keving

PFont f;

// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";

void setup() {
  size(300, 200);
  f = createFont("Arial", 16, true);
}

void draw() {
  background(255);
  int indent = 25;

  // Set the font and fill for text
  textFont(f);
  fill(0);

  // Display everything
  text("Click in this applet and type. \nHit return to save what you typed. ", indent, 40);
  text(typing, indent, 90);
  text(saved, indent, 130);
  
   
}

void keyPressed() {
  if ((key == BACKSPACE) && (typing.length() > 0)) { //make sure you don't go out of the string lenght and putting this if statement up front allows for multiple backspaces
      typing = typing.substring(0, typing.length() - 1);
    } 
    else if (key == '\n' ) {
      // If the return key is pressed, save the String and clear it
      saved = typing;
      // A String can be cleared by setting it equal to ""
      typing = "";
    } 
    else {
      // Otherwise, concatenate the String
      // Each character typed by the user is added to the end of the String variable.
      typing = typing + key;
    }
}

