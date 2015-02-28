
// illustrates how sections code run at different 
// times

void setup() {
  // runs once in the beginning
  // Set initial conditions 
  size(300, 300);
  smooth();
  stroke(255);
  background(64);
  strokeWeight(5);
}

//-------------------------------------------
// draw() is a loop, it will run over and over
void draw() {
  line(pmouseX, pmouseY, mouseX, mouseY);
}

                                
