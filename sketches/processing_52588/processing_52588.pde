
// define our shape variable
PShape bg;
PShape tri1;
PShape tri2;

float angle;
float jitter;

float angle2;
float jitter2;

float tri1Scale;
float tri2Scale;

// set up our app borders
void setup() {
  // set the size of our app
  size(270,270);
  
  // find our shape
  bg = loadShape("bg.svg");
  tri1 = loadShape("tri1.svg");
  tri2 = loadShape("tri2.svg");
  
  // anti-alias that shit!
  smooth();
  
  //noLoop();
  frameRate(60);
  
  shapeMode(CENTER);
}

// draw our shape
void draw() {
  // set a background
  background(255,255,255);
  
  // every three seconds, change up the rotation and scale!
  if (second() % 3 == 0) {  
    jitter = random(0.5, 3.5);
    jitter2 = random(0.5, 3.5);  
  }
  
  angle = angle + jitter;
  angle2 = angle2 + jitter2;
  
  tri1Scale = jitter*10;
  tri2Scale = jitter*8;
  
  shape(bg, 135, 135, 250, 250);
  
  // start our animation loop
  pushMatrix();
  float c = cos(angle);
  
  // reposition the object in the center of the screen
  translate(width/2, height/2);
  rotate(angle*TWO_PI/360);
  shape(tri1, 0, 0, 250-tri1Scale, 250-tri1Scale);
  popMatrix();
  
  // start our animation loop
  pushMatrix();
  float c2 = cos(angle);
  
  // reposition the object in the center of the screen
  translate(width/2, height/2);
  rotate(-angle2*TWO_PI/360);
  shape(tri2, 0, 0, 250-tri2Scale, 250-tri2Scale);
  popMatrix();
}

