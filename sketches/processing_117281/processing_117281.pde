
//Setup - run once
//Design3 Background

void setup() {
  size(800,800);
  
  //Keep all drawings very smooth
  smooth();
  
  //Draw ellipses from its central point
  ellipseMode(CENTER);
  
  colorMode(HSB); // switch to Hue/Saturation/Brightness mode
  
}

void draw() {
  noStroke();
  
  // fill these circles with black color and very low opacity
  fill(0,0,0,15);
  
  //draw a rectangle that fills the whole screen?
  rect(0, 0, width, height);
  
  //fill out random colors
  fill(random(0,255), random(0,255), random(0,255));
  
  //draw larget ellipse size at a random spot on the screen
  ellipse(random(0,width), random(0, height), 100, 100);
  
  frameRate(10);
  smooth();
}


