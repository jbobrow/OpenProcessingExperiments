
byte C=0;
void setup () {
  size (600, 600);
  background(255);
}
void draw () {
  C++;
  float vt = dist(mouseX, mouseY, pmouseX, pmouseY);
  if (mousePressed) {
    ellipse(mouseX, mouseY, vt, vt);
    fill(mouseX, vt, mouseY);
    ellipse(width-mouseX, height-mouseY, vt, vt);
    fill(mouseX, C, mouseY);
    if (C>225) {
      C--;
    }
    else {
      C++;
    }

  }
}
