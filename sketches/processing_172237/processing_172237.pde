
// setup - runs one time
void setup()
  {
  // set a stage size of 500 x 500 pixels
  size (500,500);

  // smooth all drawing
  smooth();

  // don't draw an outline around your shapes
  noStroke();

  // draw all ellipses from their center point
  ellipseMode(CENTER);
  }

// draw - runs once a frame
void draw()
  {
  // fill all shapes with a solid black color with a very low opacity
  fill(105,105,105,10);

  // draw a rectangle that fills the whole screen
  // don't draw this rectangle if you don't want to erase the screen each time
  rect(0,0,width,height);

  // fill all shapes with a white color from this point forward
  fill(#40E0D0);

  // draw a small ellipse (20x20) where the mouse is
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}



