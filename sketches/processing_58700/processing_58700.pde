
//Vanessa Faienza
// Problem Set 3 - Question 3

String message = "Do you believe in ghosts?";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(500, 400); //changed size to enhance usage of space for new message
  PFont font = loadFont("Cracked-48.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  // instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top

  fill(255, 255); //changed fill in order to match them
  rect(0, 0, width, height);
  fill(216); //made lighter to match context "ghost"
  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
    abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  text("Do you believe in ghosts?", x, y);
}


