
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
   c1 = color(173,78,255);
   c2 = color(255,196,103);
   c3 = color(42,204,102); 
}
