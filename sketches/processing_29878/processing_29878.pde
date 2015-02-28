
void setup() {
  size(800, 600);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(255,random(255),255,random(255));
  } else {
    fill(0,random(255),0,random(255));
  }
  quad(mouseX-40, mouseY-40, mouseX-40, mouseY+40, mouseX+40, mouseY+40, mouseX+40, mouseY-40);
}

