
size(700, 700);
background(0);
int value = 0;

void draw() {
noStroke();
  
  float w = width; 
while (w > 0) { 
  fill(value);
  ellipse(mouseX,mouseY,mouseY/2,mouseY/2); 
  w = w - 20; 
}

}

void mouseMoved() {
  value = value + 1;
  if (value > 255) {
    value = 0;
  }
}
