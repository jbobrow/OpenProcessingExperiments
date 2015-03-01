
byte C=0;
void setup () {
  size (600, 600);
  background(0);
}
void draw () {
  C++;
  float vt = dist(mouseX, mouseY, pmouseX, pmouseY);
  ellipse(mouseX, mouseY, vt, vt);
  stroke(C,vt);
  fill(C,mouseX,vt);
  if (C>255) {
    C--;
  } else {
    C++;
  }
}

