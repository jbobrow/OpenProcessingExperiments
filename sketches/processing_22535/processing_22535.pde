
void setup() {
  size(300, 300);
  smooth();
}
 
//------------------------------------------
void draw() {
  background(0);
  
  int dia = 100;
 
  if (intersect(100, 200, dia/2, mouseX, mouseY, dia/2)) {
    fill(0);               
  }
  else {
    fill(255); 
  }
   
rect(100, 200, dia, dia);
  rect(mouseX,  mouseY, dia, dia); 
}
 
//---------------------------------------------------------------
// A function to test for intersection between two circles
// x1, y1 and r1 represent one circle
// x2, y2 and r2 represent the other circle
// We can say that two circles overlap when the distance between
// their centres is larger than the sum of their radius.
boolean intersect(float x1, float y1, float r1,
                  float x2, float y2, float r2) {
   
  float d = dist(x1, y1, x2, y2);
   
  if ( d < (r1 + r2) ) {
    // yep, they intersects
    return true;
  }
  else {
    return false;
  }
}


