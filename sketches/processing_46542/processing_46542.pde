
inta=5;
int b=10;
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
 
  }

// mousePressed - runs every time the mouse is pressed
void mousePressed()
  {
  fill (random(0,255), random(0,255), random(0,255), 50);
  rectMode(CENTER);
  rect(mouseX,mouseY,100,100);
  }
  
void mouseReleased()
  {
  fill(random(0,255),random(0,255),random(0,255),200);
  ellipse(mouseX,mouseY,100,100);
  }
