
void setup() {
  size(700, 700);
  smooth();
}
 
void draw() {
  background(100, 100, 100);
   
    if (intersect(130, 100, 75,  mouseX, mouseY, 160)) {
    fill(247, 172, 239);
  }
  else {
    fill(112, 20, 124);
 
  }
  rect(220, 280, 250, 100);
  rect(mouseX,  mouseY, 150, 50);
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

