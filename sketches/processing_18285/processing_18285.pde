
// illustrates how sections code run at different 
// times

void setup() {
  // runs once in the beginning
  // Set initial conditions 
  size(300, 300);
  smooth();
  noStroke();
  background(64);
}

//-------------------------------------------
// draw() is a loop, it will run over and over
void draw() {
  // even if draw() is empty, we must have it 
  // along with setup() to create a dynamic 
  // mode sketch 
}

// ------------------------------------------
// mouseMoved only runs when the mouse moves 
// BUT no mouse button is held
void mouseMoved() {
  fill(mouseX, mouseY, 0, 128);
  ellipse(mouseX, mouseY, 75, 75);
}

// ------------------------------------------
// mouseDragged() runs only when the mouse 
// is moving AND the left button is held 
void mouseDragged() {
  // using the background color as fill is like
  // having an eraser!
  fill(64);
  ellipse(mouseX, mouseY, 75, 75);
}

// ------------------------------------------
// keyPressed() runs only when we press a key 
// on the keyboard 
void keyPressed() {
  saveFrame("screenshot.jpg");
}


                                
