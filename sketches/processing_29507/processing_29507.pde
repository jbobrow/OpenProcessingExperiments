
void setup () {
  size (800, 800);
  smooth ();
}
void draw () {
  frameRate (5);
  strokeWeight(1);
  background(100, 255, random(120, 255));
  for (int i=11; i<800; i+=11) {
    for (int j=11; j<800; j+=20) {
      line(3, i, i, j);

      if (mousePressed) {
        fill (random(mouseY));
        line(50, i, i, j);
        stroke(0, mouseX);
      }
      else {
      }
    }
  }
}


