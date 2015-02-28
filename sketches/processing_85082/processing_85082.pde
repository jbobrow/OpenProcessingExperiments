
void setup() {
  size(500,500);
  background(0,0,0);
  smooth  ();
}
 
void draw() {
  stroke(mouseX/5,mouseY/8,30,120);
  strokeWeight (2);
  line (mouseX,mouseY,mouseY,height/2);
}
 

void mousePressed() {
  background (mouseX/5,mouseY/5,50,50);
}
 
void mouseReleased() {
  background (255);
}
