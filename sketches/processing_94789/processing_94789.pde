
int value = 0;                                            //iteration variable

void setup(){
  size(750, 550);                                         //750 pixels wide and 450 pixels high
  background(0);                                          //Set background color to black
  frameRate(55);                                          //Changes color faster
  noStroke();                                             //Show no lines
  smooth();                                               //Draws all geometry with smooth edges
}

void draw() {
  fill(value);
  ellipse(mouseX, mouseY, mouseX, mouseY);
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

