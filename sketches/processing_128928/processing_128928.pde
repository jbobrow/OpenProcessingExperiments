
// Constants
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2, d1;
int radius = 100;
int theta=0;
int rad2;
int rad1;

void setup() {
background(0);
  size(900, 600);
  b1 = color(218,247,30);
  b2 = color(247,30,229);
  c1 = color(204, 102, 0);
  c2 = color(0, 102, 153);
  d1 = color(40,184,35);
  

 
}

void draw() {

  //background(0);
  //setGradient(0, 0, width, height, b1, b2, Y_AXIS);
  //setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);
   //Foreground
if(mousePressed)
{
rad1 = cos(theta)*radius;
rad2 = sin(theta)*radius;
 setGradient(mouseX-rad1, mouseY-rad2, radius, radius, c1, c2, Y_AXIS);
 theta++; 
}
  //setGradient(mouseX-radius/2, mouseY-radius/2, radius, radius/2, c1, c2, Y_AXIS); 
  //setGradient(mouseX-radius/2, mouseY-radius/2, radius, radius, b1, b2, Y_AXIS); 
 // setGradient(mouseX-radius/2, mouseY-radius/2, radius, radius/4, c1, c2, Y_AXIS); 
  //setGradient(mouseX-radius/2, mouseY-radius/4, radius, radius/4, c2, b1, Y_AXIS);
  // setGradient(mouseX-radius/2, mouseY, radius, radius/4, b1, b2, Y_AXIS); 
    //  setGradient(mouseX-radius/2, mouseY+radius/4, radius, radius/4, b2, d1, Y_AXIS); 
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x + w-rad2, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
