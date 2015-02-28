
// declare some global variables
float x;
float y;
float spdX, spdY;
float w, h;
float gravity;
float damping;
float wind;
color strokeCol;
float friction;


void setup() {
  size(600, 600);
  

  
  background (200, 50, 90);

  smooth();
  // initialize some variables
  x = width/2;
  y = 30;
  spdX = 4.1;
  gravity = .09;
  damping = .75;
  wind += .002;
  friction = .75;
  spdY = 0;
  w = 30;
  h = 30;
  strokeCol = color(50);
}


void draw() {
  
  
  translate( 30, 30);
  rect( 0, 0, 55, 55);
  
    fill(100, 255, 0);
  stroke(strokeCol);

  fill( 20, 20, 230);
  
  
  ellipse(x, y, w, h);
  x += spdX;
  spdX += -wind;
  spdY += gravity;
  y += spdY;


  // when x is equal to the width fails

  if (x > width-w) {
    spdX *= -1;
    spdY *= damping;
    strokeCol = color(50);

  }

  if (x < 0) {
    spdX *= -1;
    strokeCol = color(50);

  }

  if (y > height-h) {
    y = height - h;
    spdY *= -1;
    spdY *= damping;
    spdX *= friction;
    strokeCol = color(50);
 
  }
  

  if (y < 0) {
    spdY *= -1;
    strokeCol = color(50);
    

  
 translate(width/2, height/2);
 
 float theta =0.0;
 float radius = 200.0;
 int shapeCount = 10;
 float shapeRadius = 40.0;
  for (int i=0; i<shapeCount; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    ellipse(0, 0, shapeRadius*2, shapeRadius*2);
    popMatrix();
    theta += TWO_PI/shapeCount;

  // for fading animation
  //fill(255, 90);
  //rect(0, 0, width, height);

  // no background at all equals painting system



  }
  }
}

