
void setup() {
  size(800, 600);
  background(0);
 }
 
 void draw() {
  smooth();
  
 if (mousePressed == true) {
 
  
  noStroke();
fill(255, 204, 51);
ellipse(400, 300, 250, 250);
fill(255, 255, 255, 127);
ellipse(mouseX, mouseY, 130, 130);

 }

 }

