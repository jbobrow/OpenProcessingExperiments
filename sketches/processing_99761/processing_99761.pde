
void setup(){
  size(500,500);
    background(255);
    smooth();
 
}
 

   
  if (mousePressed==true) {
    void draw() {
  stroke(150, 150, mouseX);
  line(mouseX, mouseY, mouseX, mouseY);
  stroke(126);
  strokeWeight(10);
  }
}
