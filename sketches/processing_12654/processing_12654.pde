
  void setup() {
  size(800, 800);
  background(50);
 }
void draw() {
  if (mousePressed == true) {
    stroke(random(255) );
        
        line(mouseX,mouseY,random(mouseX-100, mouseX),random(mouseY-100, mouseY +10));     
  }
    if (mousePressed == false) {
    }
if (keyPressed == true);
 
 
}

