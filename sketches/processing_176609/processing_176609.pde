
PImage bg;

// setup - runs one time
void setup()
  {
  // set a stage size of 900 x 675 pixels
  size (900,675);
  //the background image size has to be same size 
  //as the working area
  //and the image has to be loaded to be used
  bg = loadImage("horse.png");
  // smooth all drawing
  smooth();

  // No outline around the shapes
  noStroke();

  // draw all ellipses from their center point
  ellipseMode(CENTER);
  }

// draw - runs once a frame
void draw()
  {
    background(bg);
  // draw an ellipse at a random spot on the screen 
  ellipse(mouseX, mouseY, 300, 300);
  }

// mousePressed - runs every time the mouse is pressed and 
// changes the colour of the ellipse randomly
void mousePressed()
  {
  fill (random(0,255), random(0,255), random(0,255), 50);
  }


