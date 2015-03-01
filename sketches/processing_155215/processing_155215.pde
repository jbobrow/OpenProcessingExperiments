
/*
 * Updated by katrin, 2014-07-19:
 * Update: Save snapshots of your drawing with 's'
 * -----------------------------------------------------------------------------
 * Creative Coding
 * Week 1, 01 - Draw your name!
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image to the file "yourName.jpg"
 * Press 'r' to erase your drawing and start with a blank screen
 * ------------------------------------------------------------------------------
 */


// setup function -- called once when the program begins
void setup() {
  
  // set the display window to size 500 x 500 pixels
  size(500, 500);

  // set the background colour to white
  background(255);

  // set the rectangle mode to draw from the centre with a specified radius
  rectMode(RADIUS);
  
  myColor = color(170);
}


// draw function -- called continuously while the program is running
void draw() {
  
 
  
  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */
 
  if (mousePressed) {
    // draw a rectangle with a small random variation in size
    stroke(myColor); // set the stroke colour 
    fill(0, 150); // set the fill colour
    rect(mouseX, mouseY, random(6), random(6)); 
  }

  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    int y = year();
    int m = month();
    int d = day();
    int h = hour();
    int i = minute();
    int s = second();
    saveFrame("sketch_"+y+m+d+h+i+s+".png");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(255);
  }

}


