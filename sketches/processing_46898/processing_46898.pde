
void setup() {
  size (800,800);
  background (#000000);
  
}

void draw () {
// line (0,0, mouseX, mouseY);
//background (#FF1515);
//ellipse (mouseX, mouseY, 50, 50);
//ellipse (mouseX, mouseY, mouseX ,mouseY);
stroke (random (255), random(255), random (255));
strokeWeight (random (10));
triangle (mouseX, mouseY, mouseX, 20, mouseX, 75);
}

void mouseClicked() {
  background (#000000);
  }

