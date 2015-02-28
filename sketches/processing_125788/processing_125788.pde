
void setup() {
  size(600, 600);
  background(9,0,67);
 

}

void draw() {
   fill(255, 226, 0);
   ellipse (100, 100, 150,150);
  if (mousePressed) {
    fill (198,56,0);
    stroke (0);
    ellipse(mouseX, mouseY, 300, 300);
  } else {
    stroke(0);
    fill (183,141,0);
    ellipse(mouseX, mouseY,350,350);
    fill (245,188,0);
    ellipse(mouseX, mouseY, 430, 90);
  }
  

} 


