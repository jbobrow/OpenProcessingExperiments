
void setup() {
  size(500, 700);
  background(113, 6, 6);
}

void draw () {
  
  if (mousePressed && (mouseButton == LEFT)) {
    noStroke();
    fill(255, 90);
    ellipse(width-mouseX, height-mouseY, 3, 3);
 }

  if (mousePressed && (mouseButton == RIGHT)) {
     ellipse(mouseX, mouseY, 3, 3);
}
}

