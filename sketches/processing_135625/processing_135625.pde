
boolean drawing = false;

// setup - runs one time
void setup()
  {
  // set a stage size of 500 x 500 pixels
  size (500,500);

  // smooth all drawing
  smooth();

  // don't draw an outline around your shapes
  noStroke();
  }

// draw - runs once a frame
void draw()
  {
  if (drawing == true)
    {
    ellipse(mouseX, mouseY, 30, 30);
    }

  }

// mousePressed - runs every time the mouse is pressed
void mousePressed()
  {
  drawing = true;
  }

void mouseReleased()
  {
  drawing = false;
  }
