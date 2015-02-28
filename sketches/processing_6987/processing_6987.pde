
void setup() {
  // Set initial conditions
  size(700, 700);
  smooth();
  background(0);
}

// ---------------------------------

void draw() {
  // Do something over and over again
  // background(1119)
 noFill();
smooth();
  stroke(mouseX, mouseY, 1, 100);
  //stroke(where the mouse goes, '', colour, colour)
  ellipse(mouseX, mouseY, 150, 150);
}


//----------------------------------
void mouseDragged() {
  stroke(mouseX, mouseY, 50, 100);
  rect(mouseX, mouseY, 100, 100);
}

//-------------------
void keyPressed() {
  background(0);
}  

void mousePressed() {
  saveFrame();
}


