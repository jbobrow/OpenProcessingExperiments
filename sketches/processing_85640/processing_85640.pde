
void setup() {
  size(600,600);
  background(#AFAAAA);
  smooth();
}
void draw() {
  if (mousePressed) {
    brush(mouseX, mouseY);
      
  }
}
void brush(int x, int y) { 
stroke(mouseX, mouseY, 140, 110);
noFill();
ellipse(mouseX, mouseY, 60, 60);

}
void keyPressed() {
 saveFrame("PS2_03image.jpeg");
}



