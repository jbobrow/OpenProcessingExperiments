
//variables

//initialize
void setup() {
  size(400,400);
  background(0);
  // how or why does color mode and rgb setting affect dot drawing?
  colorMode(RGB,255,255,255,100);
  //draw nice anti-aliased things.
  smooth();
}

//draw a circle of a random size
void randomEllipse() {
  // for right now, we use center mode. It may be better to use corner mode.
  ellipseMode(CENTER);
  float wh = random(3, 25);
  int whvalue = int(wh);
  // get random x axis point; need to figure out how to test bounds outside or touching window
  float x = random(0, 401);
  int xx = int(x);
  // get random y axis point; need to figure out how to test bounds outside or touching window
  float y = random(0, 401);
  int yy= int(y);
  ellipse(xx, yy, whvalue, whvalue);
}

// fill an area with various greens
void fillArea() {
  // show floating point to integer conversion for now. could be written as one statement
  // vary opacity between 10% and 100%
  float x = random(10, 101);
  int opaqvalue = int(x);
  // vary green between 75 and 255
  float y = random(75, 256);
  int greenvalue = int(y);
  // RGB is default color mode: fill(R,G,B,opacity)
  fill(25, greenvalue, 100, opaqvalue);
}

// this is the main program loop. Need to build a pause function. 

void draw() {
  // if the mouse key is down, it blanks the canvas
  if (mousePressed == true) {
    background(0);
  } 
  else {  
    // if a key is held, the fill color is black
    if (keyPressed == true) {
      fill(0);
    } 
    else {
      // if a key is not held, fill color is random green
      fillArea();
    }
    // no matter what the fill, draw a circle.
    randomEllipse();
  }
}


