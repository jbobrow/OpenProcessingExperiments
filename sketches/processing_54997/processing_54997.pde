
int h = height;            // lets height = h
int w = width;             // lets width = w

void setup (){
  size(666,666);            // size of the window
  stroke(255);              // colour of the box
  frameRate(640);           // frame rate
    
}

float x = 0;                // initial x location of the rectangle
float y = 0;                // initial y location of the rectangle

void draw () {
    
  int w = 64;               // width of the rectangle
  int h = 60;               // height of the rectangle
  
  x = x+1;                  // distance the box moves each frame
  if (x > (666-w)) {        // when the box hits the edge of the frame
    x = (0);                // keeps the box against the right edge
    y = (0);                // moves box down right edge
  }

rect (x, y, w, h);          // draws the rectangle
rect (x, y+(2*h), w, h);    // draws the next rectangle down...
rect (x, y+(4*h), w, h);    // ... and so on
rect (x, y+(6*h), w, h);
rect (x, y+(8*h), w, h);
rect (x, y+(10*h), w, h);
rect (x, y+(12*h), w, h);
rect (x, y+(14*h), w, h);
rect (x, y+(16*h), w, h);
  
}

