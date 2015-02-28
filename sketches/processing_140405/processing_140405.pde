
// base example for color experiments
// AW, March 2014

color c1,c2,c3; // FÃ¼llfarbe, Linienfarbe, Hintergrundfarbe

void setup() {
  defineColors();
  background(c2);
  size(400,400);
  strokeWeight(4);  
}

void draw() {
  fill(c1);
  stroke(c3);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
}
  
void defineColors() {
   c2 = color(74, 102, 71);
   c1 = color(171, 135, 83);
   c3 = color(255, 87, 81);  
}

