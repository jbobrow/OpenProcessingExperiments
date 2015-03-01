
/*
 * Creative Coding
 * Week 1, 01 - Draw your name!
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image to the file "yourName.jpg"
 * Press 'r' to erase your drawing and start with a blank screen
 * 
 */

float sz;
int r,g,b;

// setup function -- called once when the program begins
void setup() {

  // set the display window to size 500 x 500 pixels
  size(500, 500);

  // set the background colour to white
  background(255);

  // set the rectangle mode to draw from the centre with a specified radius
  rectMode(RADIUS);
}


// draw function -- called continuously while the program is running
void draw() {

  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  if (mousePressed) {
    // draw a rectangle with a small random variation in size
    stroke(50); // set the stroke colour to a light grey
    fill(255); // set the fill colour to white
    sz = noise(frameCount/10)*15; // width and height of the circles
    ellipse(mouseX, mouseY, sz, sz);
    ellipse(width-mouseX, height-mouseY, sz,sz);
    ellipse(width-mouseX, mouseY, sz,sz);
    ellipse(mouseX, height-mouseY, sz,sz);
  }


  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(255);
  }
}

