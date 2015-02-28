
// ungeschminkt / natural / frisch
// AW, March 2014
 
color c1,c2,c3; // Füllfarbe, Linienfarbe, Hintergrundfarbe
 
void setup() {
  defineColors();
  background(c2);
  size(400,400);
  strokeWeight(4);
 colorMode(HSB, 360, 100, 100); 
}
 
void draw() {
  defineColors();
  fill(c1);
  stroke(c3);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
}
   
void defineColors() {
 
   c1 = color(0,57,random(50,130));
   c2 = color(14,59,random(50,130));
   c3 = color(2,91,random(30,110));
}

