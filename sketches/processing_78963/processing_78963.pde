
void setup() {
  size(480, 120);
  smooth();
  text ("Nicholas", 70, 77);
  
} 

void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}


