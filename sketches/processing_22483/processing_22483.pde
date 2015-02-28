
//KYLE LLESES
//PS2-4
//BOX CHANGES COLOUR WHEN INTERSECTING

void setup() {
  size(500, 500);
  smooth();
  strokeWeight(2);
}


void draw() {
  background(255, 255, 255);
  
    //IF MOUSE INTERSECTS VALUES
    if (intersect(130, 120, 75,  mouseX, mouseY, 75)) {
    fill(255, 20, 147);
  } 
  else {
    fill(139, 10, 80);

  }
  //RECTANGLE
  rect(130, 120, 250, 250);
  //MOVINT RECTANGLE
  rect(mouseX,  mouseY, 250, 250);
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


