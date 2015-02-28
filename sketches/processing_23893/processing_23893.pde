
// loops 
// we can create really interesting patterns using repetition and
// stacked transformations...

// try different shapes (triangle, ellipse, etc..)
// try animating the scaling and rotation, instead of using the mouse

void setup() {
  size(400, 300);  
  rectMode(CENTER);
  smooth();
  noFill();
}

void draw() {
  background(255);
  // move the origin so that it is right in the center of the
  // sketch 
  translate(width/2, height/2);
  
  // loop 100 times 
  // remember that scale() and rotate() add up! 
  // this is how we create this effect.
  for (int i=0; i < 100; i++) {
    
    // calculate an angle and a scale based on 
    // the mouse position using map() 
    float angle = map(mouseX, 0, width, 0, PI);
    rotate(angle);
    float s = map(mouseY, 0, height, 1.1, 1.4);
    scale(s);
    
    // notice how we draw each box the same way, but they 
    // are drawn differently because the canvas is being 
    // scaled and rotated first
    rect(0, 0, 20, 20);
  }  
}

