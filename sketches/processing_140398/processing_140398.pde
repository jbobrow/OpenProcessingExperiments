
// base example for color experiments
// AW, March 2014
 
color c1,c2,c3; // Füllfarbe, Linienfarbe, Hintergrundfarbe
 
void setup() {
  defineColors();
  background(c2);
  size(400,400);
  strokeWeight(2); 
}
 
void draw() {
  fill(c1);
  stroke(c3);
  ellipse(mouseX, mouseY, abs(mouseX-pmouseX), abs(mouseX-pmouseX));
}


//Vulkanausbruch   
void defineColors() {
   c1 = color(153,22,10);
   c2 = color(204,20,0);
   c3 = color(255,112,0);
   background(c2);
}



