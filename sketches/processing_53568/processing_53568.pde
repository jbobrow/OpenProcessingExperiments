
//KESHIA.KINGSLEY_QUESTION 4. PS2
//-----------------------------------------------------------
void setup() {
  size(600, 600);
  smooth();
  noStroke();
 
}
 
 
void draw() {
  translate(55, 73);
  background(255);
   
    if (intersect(200, 200, 110, mouseX, mouseY, 110, 100, 50)) {
    fill(161, 238, 252);
  }
  else {
    fill(255, 124, 194);
 
  }
  
  rect(130, 120, 250, 150);
  rect(mouseX, mouseY, 250, 150);
}
 
boolean intersect(float x_1, float y_1, float width_1, float height_1, float x_2, float y_2, float width_2, float height_2) {
 
  float d = dist(x_1, y_2, width_1, x_2, y_2, width_2);
 if ( d < (width_1+ height_2)) {
 
    return true;
  }
  else {
    return false;
  }
}

