
//code from monzp5.wordpress.com & edited by Janet
PImage bg;
void setup() {
  size (720,480);

  // smooth all drawing
  smooth();
  
  //processing.org/reference/background_.html
  background(255);

  //processing.org/reference/ellipseMode_.html
  ellipseMode(CORNER);
  
  //background image from Google; grayscale
  bg = loadImage("grayscale1.jpg");
  
  background(bg);
  }

// draw - runs once a frame
void draw() {

  ellipse(mouseX, mouseY, mouseX-mouseY,mouseY-mouseX);
  }

// color changes when the mouse is clicked
void mousePressed()
  {
  fill (random(0,255), random(0,255), random(0,255), 50);
  }

