
 
color c1,c2,c3; // Füllfarbe, Linienfarbe, Hintergrundfarbe
 
void setup() {
  colorMode(HSB, 360, 100, 100);
  defineColors();
  background(c2);
  size(400,400);
  strokeWeight(4); 
}
 
void draw() {
  defineColors();
  fill(c1);
  stroke(c3);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
}
   
void defineColors() {
   c3 = color(191+random(-30, 30),26,67);
   c2 = color(0,0,50);
   c1 = color(217+random(-30, 10),22,95); 
}

