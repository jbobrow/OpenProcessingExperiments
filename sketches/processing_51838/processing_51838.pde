
void setup() {
  size (800, 800);
  background(255, 255, 255);
  smooth ();
frameRate(1000);
}

void draw () {
    if (mousePressed) {
    fill (mouseY, mouseX, 40, 50);
    } else {
  fill(mouseY+155, mouseX-200, mouseX, 50);
    }
  ellipse(mouseX, mouseY, mouseY-400, mouseY-400);
  
  
}


