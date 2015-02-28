
int value = 0;                                   //Variable used for iteration

void setup(){                               
  size(600,600);                                //Set screen size 600x600
  background(0,139,69);                         //Set back ground colour to green
  frameRate(55);                                //Spped of colour changes
  noStroke();                                   
  smooth();                                     //Draws all geometry with smooth edges
}
void draw() {
  fill(value);
  ellipse(mouseX, mouseY, mouseX, mouseY);
}
void mouseMoved() {
  value = value +5;
  if (value > 255) {
    value =0;
  }
}
