
// base example for color experiments
// AW, March 2014
 
color c1,c2,c3; // Füllfarbe, Linienfarbe, Hintergrundfarbe
 
void setup() {
  size(400,400);
  strokeWeight(2);
  colorMode(HSB, 360, 100, 100);
  defineColors();
  background(c2);
}
 
void draw() {
  defineColors();
  fill(c1);
  stroke(c3);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
}
   
void defineColors() {
   c1 = color((int)random(213,214),(int)random(25,46),(int)random(70,100));
   c2 = color(39,56, 70);
   c3 = color(213,36,100);
}


