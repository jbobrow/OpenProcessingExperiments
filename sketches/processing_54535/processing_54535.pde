
// "snake" following the mouse
// draw the last 50 positions of the mouse, which are stored
// inside two arrays as the mouse is moved
// an index variable keeps track of the current position in the arrays
// and wraps around to the begining when the arrays are full
// this is also called a "circular buffer" 

int[] trail_x;
int[] trail_y;
int index = 0;

void setup() {
  size(400, 400);
  smooth();
  colorMode(HSB);
  trail_x = new int[50];
  trail_y = new int[50];
}

void draw() {
  background(64);
  stroke(0, 128);
  for (int i=0; i < trail_x.length; i++) {
    
    // always end with the last mouse position to avoid the "jumping" 
    // effect
    int pos = (index+i) % trail_x.length;
    
    // we can use the counter for color and size
    fill(map(i, 0, trail_x.length, 0, 100), 255, 255, 128);    
    ellipse(trail_x[pos], trail_y[pos], 50+i, 50+i);  
  }
}

void mouseMoved() {
  trail_x[index] = mouseX;
  trail_y[index] = mouseY;
  index++;
  if (index >= trail_x.length) index = 0;
}
