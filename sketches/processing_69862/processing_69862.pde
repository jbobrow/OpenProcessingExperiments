
void setup () {
  
  size (400, 600);
  background (255, 255, 255);
  
}

void draw () {
  
  smooth ();
  
  fill (mouseX, 70, 0, 99);
  noStroke ();
  ellipse (mouseX, mouseY, 23, 18);
  
  fill (mouseX, 0, 0, 99);
  noStroke ();
  ellipse (mouseX-13, mouseY-12, 10, 10);
  
  fill (mouseX, 0, 0, 99);
  noStroke ();
  ellipse (mouseX, mouseY-15, 10, 10);
  
  fill (mouseX, 0, 0, 99);
  noStroke ();
  ellipse (mouseX+13, mouseY-12, 10, 10);
  
}
