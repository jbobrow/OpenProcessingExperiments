
void setup() {
  size(640, 480);
}

void draw () {
  if (mousePressed) {
    fill(mouseX/3, mouseX/3, mouseY/2);
  } 
  else {
    fill(mouseY/2, mouseX-mouseY, mouseX/3);
  }
  ellipse(mouseX, mouseY, 80, 80);
}



