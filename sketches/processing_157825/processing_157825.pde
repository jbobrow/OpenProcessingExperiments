
//values of the colors
float r =100;
float g =150;
float b =200;
float a =200;

//values of the shapes
float diam = 20;
float x = 300;
float y = 300;

void setup () {
  size (310, 310);
  background (255);
  smooth ();
}

void draw () {
  
  //making all the vairable random
  r = random (255);
  g = random (255);
  b = random (255);
  a = random (255);
  diam = random (255);
  x = random (255);
  y = random (255);
  //drawing the ellipse
  noStroke ();
  fill (r, g, b, a);
  ellipse (x, y, diam, diam);
}  
  
  
  
  


