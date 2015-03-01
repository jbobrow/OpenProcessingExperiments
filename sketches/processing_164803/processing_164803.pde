
void setup() {
size(300, 300);
noStroke();
background(255);
}
 
void draw() { } 
 
void mousePressed() {
  fill(11, 70, 106, 150);
  ellipse (mouseX, mouseY, 50, 50);
}
 
void mouseReleased() {
  fill(11, 70, 106, 180);
  ellipse(mouseX, mouseY, 150, 150);
}



