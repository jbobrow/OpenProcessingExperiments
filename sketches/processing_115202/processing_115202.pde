

// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs font="Georgia.ttf"; */

String message = "launch";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text
float size;
float ballr;

void setup() {
  size(640, 360);  

  // Create the font
  //int size = 50;
  textAlign(CENTER, CENTER);


  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}



void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(#EA580E);
  rect(0, 0, width, height);
  
  int ballr = 100;

  if (abs(mouseX - x) < hr &&
    abs(mouseY - y) < vr) {
    ballr += 10;  
    size += 10;
    textFont(createFont("Helvetica", size));
  }


  fill(#ffffff);
  ellipse(x, y, ballr, ballr);
  
  fill(0);
  text("Launch", x, y);
}



