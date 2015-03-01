
void setup () {
frameRate(1000);
noStroke();
size(400,400);
}

void draw () {
fill(0,0,0);
if (mousePressed && mouseX<50 && mouseY<50) {
fill(255,255,255);
}
if (mousePressed) {
ellipse(mouseX,mouseY,25,25);
  }
}
