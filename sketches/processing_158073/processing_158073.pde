
byte C = 0;
void setup () {
  size(600, 600);
}
void draw() {
  C++;
   float vt = dist(mouseX, mouseY, pmouseX, pmouseY);
backgroud(vt,0,vt);
  if (mousePressed) {
    ellipse(mouseX, mouseY, 20, 20);
    fill(C,mouseX,mouseY);
    if (C>225) {
      C--;
    }
    else {
      C++;
    }
  }
}

