
void setup() {
  size (600, 600);
  background (60);
  }
  
void draw () {
  float vt = dist (mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(vt/5);
  line (mouseX, mouseY, pmouseX, pmouseY);
  stroke (0/100);
 }

