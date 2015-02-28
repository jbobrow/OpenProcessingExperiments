
// illustrates how sections code run at different 
// times

void setup() {
  // runs once in the beginning
  // Set initial conditions 
  size(300, 300);
  smooth();
  //noStroke();
  background(64);
}

//-------------------------------------------
// draw() is a loop, it will run over and over
void draw() {
  ellipse(mouseX, mouseY, 75, 75);
}


