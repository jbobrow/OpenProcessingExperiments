
// base example for color experiments
// AW, March 2014
//
 
color c1,c2,c3; // Füllfarbe, Linienfarbe, Hintergrundfarbe
 
void setup() {
  defineColors();
  background(c3);
  size(400,400);
  strokeWeight(4); 
  colorMode(HSB, 360, 100, 100);
}
 
void draw() {
  defineColors();
  fill(c1);
  stroke(c2);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
}

void mousePressed() {
  defineColors(); 
  background(c3);
}
   
void defineColors() {
  
   c1 = color(283,100, random(70,90) ); //(283,100,83);
   c2 = color(13, 95, random(60,95)); //(13,95,93);
   c3 = color (211,100, random(90,100) );//(211,100,95);
}
