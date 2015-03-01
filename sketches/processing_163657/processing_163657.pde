
/*
 
 * This program allows you to draw using the mouse.
 * Press 'm' to save your drawing as an image to the file "myName.jpg"
 * Press 'd' to clear the screen screen
 * 
 */


// setup function -- needs to be here to setup the window --called only once
void setup() {

  // set the display window to size 600 x 600 pixels
  size(600, 600);

  // set the background colour to grey
  background(255);

  // set the rectangle mode to draw from the centre with a specified radius
  //rectMode(RADIUS);
}


// draw function -- called continuously while the program is running
void draw() {

  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  if (mousePressed) {
    // draw a rectangle 
    stroke(255); // set the stroke colour to a light grey
    fill(255,0,0, 220); // set the fill colour to black with transparency
    rect(mouseX, mouseY, mouseX/2, mouseY/3);
  }


  // save your drawing when you press keyboard 'm'
  if (keyPressed == true && key=='m') {
    saveFrame("myName.jpg");
  }

  // clear your drawing when you press keyboard 'd'
  if (keyPressed == true && key == 'd') {
     background(255);
  }
}
