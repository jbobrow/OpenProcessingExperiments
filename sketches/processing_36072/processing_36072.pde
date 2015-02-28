
void setup() {
  size(480, 120);
  smooth();
}

void draw() {
  if (mousePressed) {
 // 'Bright Red'
    fill(255, 0, 0);
  } else {
// 'Pink (Pale Red' 
    fill(255, 200, 200);
  }
  rect(mouseX, mouseY, 80, 80);
}                                               
