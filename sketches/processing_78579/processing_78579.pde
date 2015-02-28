
void setup () {
    size(300,400);
    background(255);
}
 
void draw () {
  background (255, 255, 255);
  line (150,120,150,180);
  if(mousePressed) {
  fill(0);  
  ellipse (mouseX, mouseY, 20, 20);

  }
}
