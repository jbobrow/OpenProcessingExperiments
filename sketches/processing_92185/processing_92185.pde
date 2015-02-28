
void setup () {
  size(1280, 720);
  colorMode(HSB, height, height, height, height);
  noSmooth();
  background(#BFFAFA);
}
 
void draw () {
  if (mousePressed) {
    background(#BFFAFA);
    stroke(100);
  }
  else {
    stroke (255);
  }
  ellipse(mouseX, mouseY, 60, 60);
  fill(mouseY, height, height);
}


