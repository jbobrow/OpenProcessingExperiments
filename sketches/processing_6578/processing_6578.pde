
/*
  Simple processing program to draw a circles where the mouse was clicked on the screen.
 This program also creates coordinate axes and text using font.
 
 Usage:
 Click left mouse button to create circle.
 Click right mouse button to clear screen.
 
 Author: Satish Goda
 Date: Dec 16, 09
 e-mail: satishgoda at gmail dot com
 */

// Create the font object
PFont font;


// draw the coordinate axes for the sketch.
// X-axis in red goes from top left to top right
// Y-axis in green goes from top left to bottom left
void drawAxes(int width, int height) 
{
  // Change font size to 16
  textFont(font, 16);
  fill(255, 0, 0);
  rect(0, 0, width, 5);
  text("X", width-20, 20);
  fill(0,255, 0);
  rect(0, 0, 5, height);
  text("Y", 10, height-10);
}


// this function is called when this sketch is first loaded
void setup() 
{
  // choose size (width, height) of your sketch
  size(720, 546);
  
  // Choose background color for your sketch
  background(0);
  
  // Load the font file
  font = loadFont("mfcgFont.vlw");
}


// This function is called repeatedly to draw stuff on screen.
void draw() 
{
  // If right mouse button was pressed, clear background
  if (mousePressed && mouseButton == RIGHT) {
    background(0);
  }

  // If left mouse button was pressed, draw circle and also the 
  // x,y coordinates of where the mouse was clicked on screen
  if (mousePressed && mouseButton == LEFT) {
    // Change font size to 10
    textFont(font, 10);
    fill(127);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255);
    text(mouseX+" "+mouseY, mouseX, mouseY);
  }

  drawAxes(width, height);
}
















