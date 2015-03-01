
/* This algorithm is described by Dr Mark Guglielmetti 
in the video "What is Creative Coding" at futurlearn.com in the 
class creative coding. It is an animated mosaic inspired by Islamic art.
*/

// set the center and dimensions of the 
// template pattern
int center = 32;
float big_radius = float(center);
float little_radius = 0.5*big_radius;

// the rate of change in the radii
float dr = 0.4;

void setup() {
  size(640, 640);
  ellipseMode(RADIUS);
  rectMode(CORNER);
  //noLoop();
}

// I leave this in for debugging
void mousePressed() {
  redraw();
}


void draw() {
  // clear background and update the radii
  background(0);
  big_radius += dr;
  little_radius += dr;
  
  // check how big or small the radii are
  if (big_radius > 4*center || big_radius < center) {
    dr *= -1;
  }
  
  // draw the pattern
  for (int i = 0; i < width; i += 2*center) {
    for (int j = 0; j < height; j += 2*center) {
      pushMatrix();
      translate(i, j);
      pattern();
      popMatrix();
    }
  } 
}


// function to draw the base pattern
void pattern() {
  noFill();
  
  // Big circle
  stroke(122, 56, 11);
  ellipse(center, center, big_radius, big_radius);
  
  // Square outside circle
  stroke(41, 199, 173);
  rect(center - big_radius, center - big_radius, center + big_radius, center + big_radius);
  
  // little circle
  stroke(22, 44, 188);
  ellipse(2*center, 2*center, little_radius, little_radius);
}



