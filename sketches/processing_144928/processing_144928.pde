
// Processing Source Code for Recursion_Art.pde
// By Jim Plaxco, www.artsnova.com
// Tutorial: Recursion and Algorithmic Art Using Processing
// Tutorial URL: http://www.artsnova.com/Processing_Recursion_Tutorial.html

static final int LIMIT=6;  // size of the smallest rectangle to draw

// System Setup Function
void setup() {
  size(600,400);      // canvas/screen size
  background(255);    // canvas/screen background color, 255=white
  stroke(0);          // draw color, 0=black
  fill(126);          // fill color, 126= mid-gray
  rectMode(CENTER);   // use x,y as rectangle center
}

// System Draw Function
void draw() {
  if(frameCount==1)  Recursion_Art(width/2,height/2, width/2,height/2);
}

// Recursion_Art Function
// Input Parameters: x,y = center of rectangle
//                   w,h = width and height
// Return Value: None (void)
void Recursion_Art(int x, int y, int w, int h) {
  rect(x,y,w,h);
  if(w > LIMIT)
  { // the size of the current rectangle is larger than the LIMIT value
    Recursion_Art(x-(w/2), y-(h/2), w/2, h/2);
    Recursion_Art(x+(w/2), y-(h/2), w/2, h/2);
    Recursion_Art(x-(w/2), y+(h/2), w/2, h/2);
    Recursion_Art(x+(w/2), y+(h/2), w/2, h/2);
    }
}
