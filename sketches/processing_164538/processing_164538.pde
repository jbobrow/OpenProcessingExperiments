

int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;
// sets constants

void setup() {
  // runs the code only once
  size(500, 400);
  //sets the size of the sketch to 500 px in width and 400 px in height

  // Define colors
  b1 = color(255);
  //sets color to white
  b2 = color(0);
  //sets color to black
  c1 = color(204, 102, 0);
  //sets color to light grey
  c2 = color(0, 102, 153);
  //sets color to dark grey

  noLoop();
  //sets it so that it does not loop, it is a staic non-changing image
}

void draw() {
  // runs the code as a loop at the default frame rate
  setGradient(0, 0, width, height, b1, b2, X_AXIS);
//sets background to a grey linar gradient 


fill (154,164,162);
//fills the rect in grey
noStroke (); 
//sets it so that there is no stroke on the rect
rect (60,150,350,90);
//detmines location and size of rect
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {


  if (axis == Y_AXIS) {  
    // sets the gradient from top to bottom 
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
       //sets inter to equal above equation 
      color c = lerpColor(c1, c2, inter);
      //sets the letter c to represent above equation
      stroke(c);
      //uses c to represent above equation for the stroke
      line(x, i, x+w, i);
        // sets gradient line to span from top to bottom 
    }
  }  
  else if (axis == X_AXIS) {  
    // sets the gradient from left to right
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      //sets inter to equal above equation 
      color c = lerpColor(c1, c2, inter);
      //sets the letter c to represent above equation
      stroke(c);
      //uses c to represent above equation for the stroke
      line(i, y, i, y+h);
        // sets gradient line to span from left to right 
    }
  }
}



