
// setup - runs one time
void setup()
  {
  // set a stage size of 500 x 500 pixels
  size (500,500);

  // smooth all drawing
  smooth();

  // draw all ellipses from their center point
  ellipseMode(CENTER);
  }

// draw - runs once a frame
void draw()
  {
  // fill all shapes with a solid black color with a very low opacity
  fill(0,0,0,10);

  // draw a rectangle that fills the whole screen
  rect(0,0,width,height);

  // fill all shapes with a random color from this point forward
  fill(random(0,255), random(0,255), random(0,255));

  // draw a small ellipse (10x10) at a random spot on the screen
  ellipse(random(0,width), random(0,height), 10, 10);
  }
