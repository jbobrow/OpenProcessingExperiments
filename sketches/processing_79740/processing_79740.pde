
void setup() {
size(300,300);
background(80,10,255);
 
}
 
void draw() {
if (mousePressed) {
  fill(10);
  noStroke();
  ellipse(mouseX, mouseY, 80, 30);
 
}
}
