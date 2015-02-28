
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
  // draw a color button
  rect(0,0,100,50);

  // are we in draw mode?
  if (drawing == true)
    {
    ellipse(mouseX, mouseY, 30, 30);
    }

  }

// mousePressed - runs every time the mouse is pressed
void mousePressed()
  {
  // did we click the button?
  if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 50)
    {
    fill (random(255), random(255), random(255));
    }

  // otherwise we are in draw mode
  else
    {
    drawing = true;
    }
  }

void mouseReleased()
  {
  drawing = false;
  }
