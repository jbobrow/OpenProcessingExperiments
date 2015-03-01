
void setup() {
  size(300,300);
  fill(255, 40);
  background(0);
}

void draw() {
  if (mousePressed == true) {
    fill(150, 250, 250, 200);
    strokeWeight(10);
  } else {
    fill(255, 26, 200, 90);
  }
  for (int i = 0; i <6; i++) {
    ellipse(mouseX + i*i, mouseY, i, i);
  }
}




