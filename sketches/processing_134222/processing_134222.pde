
void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    fill(150,200,255);
    stroke(#ff00ff);
 } else {
    fill(255,225,200);
    stroke(#ff00ff);
  }
    
 
  ellipse(mouseX, mouseY, 80, 80);
}
