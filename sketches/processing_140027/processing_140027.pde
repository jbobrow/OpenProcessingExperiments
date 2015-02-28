
// setup - runs once at beginning
void setup()
  {
  // set a base size of 600 x 600 
  size (600,600);

  // smooth all drawing (antialiasing)
  smooth();

  // don't draw an outline around your shapes, keep them solid color
  noStroke();

  // make all the ellipses circles by drawing from the center
  ellipseMode(CENTER);
  }

// draw - runs once per frame
void draw()
  {
  // draw a small square (8x8) at a random spot on the screen
  rect(random(0,width), random(0,height), 8, 8); 
  
  // draw a circular ellipse wherever your mouse is on the screen
  ellipse(mouseX, mouseY, 50, 50);
  }

// mousePressed - happens when you click the mouse
void mousePressed()
  {
  // change color of ellipses with every mouse click
  fill (random(0,255), random(0,255), random(0,255), 50);
  }


