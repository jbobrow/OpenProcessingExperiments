
// base example for color experiments
// AW, March 2014
 
color c1,c2,c3; // Füllfarbe, Linienfarbe, Hintergrundfarbe
 
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
   c1 = color(30,65,58);
   c2 = color(88,103,126);
   c3 = color(52,82,80); 
}


