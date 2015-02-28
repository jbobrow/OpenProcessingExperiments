
// Constants
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;

void setup(){
  size(400,600);
  smooth();
  
   // Define colors
  b1 = color(255);
  b2 = color(0);
  c1 = color(204, 102, 0);
  c2 = color(0, 102, 153);

  noLoop();
}

void draw(){
  // Background
  setGradient(0, 0, width/2, height, b1, b2, X_AXIS);
  setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);
  
  //big red triangle
  fill(220,20,10);
  triangle(20,70,150,50,140,450);
  
  //main sun
  fill(188,128,51);
  ellipse(400,0,100,100);
  
  //sun rings
  noFill();
  ellipse(400,0,105,105);
  ellipse(400,0,110,110);
  ellipse(400,0,125,125);
  ellipse(400,0,140,140);


  
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
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
