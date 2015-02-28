

void setup() {
  size(320, 240, P2D);
  fill(0);
}
  
void draw() {    
  background(255);
  
  if (mousePressed) {
  
  for (int i = 0; i < 1000; i++) {
    float x = random(mouseX);
    float y = random(mouseY);
    text("s t r e t c h i n g", y, x);
    
  }  
} else {
  
  for (int i = 0; i < 1000; i++) {
    float x = random(width);
    float y = random(height);
    text("tension", x, y);
  }
}
}


