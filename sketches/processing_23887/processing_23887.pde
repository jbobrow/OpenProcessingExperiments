
// a vertical line, following the mouse 

///////////////////////////////////////////////////////
// Code placed in setup() will run once
void setup() {
  size(300, 200);
  stroke(255);
  strokeWeight(2);
}

///////////////////////////////////////////////////////
// Code placed in draw() will run over and over
void draw() {
  background(64); 
  // mouseX and height are built-in variables. their value
  // is updated automagically by Processing 
  line(mouseX, 0, mouseX, height);
}
