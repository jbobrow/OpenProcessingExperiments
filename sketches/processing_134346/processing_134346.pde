
void setup() {
  size(500, 500);
}
 
void draw() {
  if (mousePressed) {
    fill(0);    
  } else {
    fill(100, 100, 100, 50);
    fill( random(255), random(255), random(255), random(255)); 
  }
     ellipse(mouseX, mouseY, 80, 80);
}
