
void setup(){
  size(800,800);
    background(0);
    smooth();

}

void draw() {
  stroke(mouseX, mouseY, mouseX-mouseY);
  line(mouseX, mouseY, mouseX, mouseY);
  stroke(126);
  strokeWeight(10);
  line(mouseX, 20, mouseX, 75);
  stroke(255);
  line(mouseX, 100, mouseX, 75);
  
  if (mousePressed==true) {
    background(0);
  }
}
