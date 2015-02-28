
void setup() {
  size(700,400);
  smooth();
  
  
 
}

void draw() {
  background(mouseX + mouseY, 255, 255);
  fill(255-(mouseY + mouseX), 255, 255);
}



