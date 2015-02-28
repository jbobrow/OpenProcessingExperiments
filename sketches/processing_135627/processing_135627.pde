
PImage dog;

// setup - runs one time
void setup()
  {
  // set a stage size of 500 x 500 pixels
  size (500,500);

  // load in the image from our folder
  dog = loadImage("boston.png");

  // hide the mouse
  noCursor();
  }

// draw - runs once a frame
void draw()
  {
  // background color
  background (100);

  // draw a ball using the mouse
  image(dog, mouseX, mouseY);
  }
