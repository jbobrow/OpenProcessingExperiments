
//Georgina Yeboah
//PS2-3
//triangles and circles change in transparency
//triangles change in shape
void setup () { 
  size (500, 500);
  background (0);
  noStroke ();
  smooth ();
  //---------------------------------------------------------------
}
void draw () {
  if (mousePressed || (mouseButton==LEFT)) {
    brush(mouseX, mouseY);
  }
}
//--------------------------------------------------------------  
void brush (int x, int y) {

  //triangles
  fill(mouseY, mouseX, 100, 27);
  triangle(mouseX, 15, 300, 190, mouseY, 500);
  triangle(mouseX, 15, 150, 350, mouseY, 250);

  //big circles
  fill(mouseX, mouseY, 100, 20); 
  ellipse(mouseX, mouseY, 70, 70);
  ellipse(mouseX, mouseY, 100, 100);

  //small circles
  fill(mouseX, mouseY, 250, mouseX);
  ellipse(mouseX, mouseY, 30, 30);
  ellipse(mouseX, mouseY, 10, 10);
}
//---------------------------------------------------------------
void keyPressed() {
  saveFrame ("screenshot.jpg");
}


