
// SIMONE ROTH // PS2_2

void setup() {
  size(400, 400);
  smooth();
  

}
 
 
void draw() {
  background(#F7F79B);
   

    if (intersect(130, 120, 75,  mouseX, mouseY, 75)) {
    fill(51, 177, 201);
  }
  else {
    fill(51, 201, 104);
 
  }

  rect(100, 150, 200, 200);

  rect(mouseX,  mouseY, 200, 200);
}
 
boolean intersect(float a1, float b1, float c1, float a2, float b2, float c2) {
 
  float d = dist(a1, b1, a2, b2);
 
  if ( d < (c1 + c2) ) {
 
    return true;
  }
  else {
    return false;
  }
} 

