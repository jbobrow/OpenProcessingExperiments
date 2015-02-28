
//Georgina Yeboah
//PS2-4
//When two rectangles collide

void setup() {
  size(300, 300);
}
void draw() {
  background(60);

  if (intersect(10, 30, 10, mouseX, mouseY, 10, 30, 0)) {
    fill(62, 219, 245);
  } 
  else {
    fill(245, 62, 242);
  }
  rect(100, 50, 100, 50);
  rect(mouseX, mouseY, 100, 50);
}
boolean intersect(float x_1, float y_1, float width_1, float height_1, float x_2, float y_2, float width_2, float height_2) {
  float d = dist(x_1, y_2, height_2, x_2, y_2, height_2);
  if ( d < (width_1 + width_2)) {
    return true;
  }
  else {
    return false;
  }
} 


