
// base example for color experiments
// AW, March 2014
 
color c1,c2,c3; // Füllfarbe, Linienfarbe, Hintergrundfarbe
 
void setup() {
  background(110,187,196);
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
  int r2 = (int)random(80,120);
  int r1 = (int)random(160,200);
  int r3 = (int)random(185,220);
  
  //Strand
   c1 = color(r3,76,55); 
   c2 = color(r1,44,77);
   c3 = color(r2,74,49); 
}

