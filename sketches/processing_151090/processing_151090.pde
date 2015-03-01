
//

// setup function -- called once when the program begins
void setup() {

  // set the display window to size 500 x 500 pixels
  size(800, 600);

  // set the background colour to white
  background(20);

  // set the rectangle mode to draw from the centre with a specified radius
  rectMode(RADIUS);
}


// draw function -- called continuously while the program is running
void draw() {

  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  if (mousePressed) {
    // draw a rectangle with a small random variation in size
    stroke(#BC1B1B); // set the stroke colour to a light grey
    fill(22, 150); // set the fill colour to black with transparency
    ellipse(mouseX, mouseY, random(60), random(80));
  }


  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(20);
  }
}
