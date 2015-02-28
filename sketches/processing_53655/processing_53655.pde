
//Georgina Yeboah
//PS2-2
//Shooting stars is what I call this skecth :)
void setup () { 
  size (400, 400);
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
  //Tails of the shooting starts
  fill(mouseX, mouseY, 190, 110);
  triangle(mouseX, mouseY, 30, 5, 15, 10);

  //The stars
  fill(mouseX, mouseY, 140, 110);
  ellipse(mouseX, mouseY, 10, 50);
  ellipse(mouseX, mouseY, 50, 10);
}

//---------------------------------------------------------------
void keyPressed() {
  saveFrame ("screenshot.jpg");
}


