
// Making an image appear
// read in an image
// make random dots appear, their position be random, their color be fixed,
// their radius (with a max) be a function of the brightness of the image at that pixel

float r;
float g;
float b;
float a;

float diam = 2;
int x;
int y;
int loc;
float locb;
int totallength;

PImage ninna;

void setup() {
  size(200,207);
  frameRate(100);
  background(255);
  smooth();    
  ninna = loadImage("IV9R5982_640.jpg");
  ninna.loadPixels();
  totallength = (ninna.width*ninna.height)-1; // this should be the max index of the pixel array
}

void draw() {
  locb = 5+95*(exp(-((frameCount+200)*(frameCount+200))/(2*200*200))) -(3-3*(exp(-((frameCount)*(frameCount))/(2*3000*3000))));
  noStroke();
  // Each time through draw(), new random numbers are picked for a new ellipse.
  x = int(random(width));
  y = int(random(height));
  loc = int(x + y*ninna.width);
  constrain(loc, 0, totallength);
  r = red(ninna.pixels[loc]);
  g = green(ninna.pixels[loc]);
  b = blue(ninna.pixels[loc]);
  fill(r,g,b, 128);
  ellipse(x,y,locb,locb);
  x = int(random(width));
  y = int(random(height));
  loc = int(x + y*ninna.width);
  fill(r,g,b, 128);
  constrain(loc, 0, totallength);
  r = red(ninna.pixels[loc]);
  g = green(ninna.pixels[loc]);
  b = blue(ninna.pixels[loc]);
  fill(r,g,b, 128);
  ellipse(x,y,locb,locb);
  x = int(random(width));
  y = int(random(height));
  loc = int(x + y*ninna.width);
  constrain(loc, 0, totallength);
  r = red(ninna.pixels[loc]);
  g = green(ninna.pixels[loc]);
  b = blue(ninna.pixels[loc]);
  fill(r,g,b, 128);
  ellipse(x,y,locb,locb);
}


