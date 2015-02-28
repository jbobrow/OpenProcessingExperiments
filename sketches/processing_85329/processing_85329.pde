
void setup () {
  size(480, 480);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(25);
  } else {
    fill(255,165);
  }
  ellipse(mouseX, mouseY, 80,80);
} 


