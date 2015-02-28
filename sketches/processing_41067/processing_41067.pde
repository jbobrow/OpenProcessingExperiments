


void setup() {
  noStroke();
  smooth();
  size(300, 300);
  fill(255, 245, 155);
  rect(0, 0, width, height);
}

void draw() {
  if (mousePressed) {
    fill(0);
    ellipse(mouseX, mouseY, 5, 5);
  }

  if (mouseButton == RIGHT && mousePressed) {
    fill(255, 245, 155);
    ellipse(mouseX, mouseY, 10, 10);
  }
  fill(255, 245, 155);
  rect(260, 260, 40, 40);
  fill(229, 220, 138);
  triangle(260, 260, height, 260, 260, height);
}

void mouseClicked() {
  if (mouseX>260 && mouseY>260) {
    fill(255, 245, 155);
    rect(0, 0, width, height);
    fill(255, 245, 155);
    rect(260, 260, 40, 40);
    fill(229, 220, 138);
    triangle(260, 260, height, 260, 260, height);
  }
}


