
// base example for color experiments
// AW, March 2014
 
color c1,c2,c3; // Füllfarbe, Linienfarbe, Hintergrundfarbe
 
void setup() {
  background(c2);
  size(400,400);
  strokeWeight(4); 
  colorMode(HSB, 360, 100,100);
}
 
void draw() {
  defineColors();
  fill(c1);
  stroke(c3);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
}
   
void defineColors() {
  int r1 = (int)random(30,120);
  int g1 = (int)random(10, 30);
  int b1 = (int)random(50,60);
  
   c1 = color(r1,g1,b1); 
   c2 = color(204,76,17);
   c3 = color(224,213,22); 
}

