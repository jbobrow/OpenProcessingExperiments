
byte C = 0;
void setup () {
  size(600, 600);
  background(110);
}
void draw() {
fill(0,3);
rect(0, 0, width, height);

  C++;
  if (mousePressed) {
    fill(C, mouseX, mouseY);
    ellipse(mouseX, mouseY, 10, 10);
    fill(C, mouseX, mouseY);
    ellipse(mouseY, mouseX, 10, 10);
    fill(mouseX, C, mouseY);
    ellipse(height-mouseY, width-mouseX, 10, 10);
    fill(mouseX, mouseY, C);
    ellipse(width-mouseX, height-mouseY, 10, 10);
    fill(mouseX, width-mouseY, C);
    if (C>225) {
      C--;
      
    }
    else {
      C++;
    }
  }
}
