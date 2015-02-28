


void setup() {
  size(600, 600); 
  background(255); 
  stroke(0); 
  smooth(); 
}

void draw() {
  stroke (245, 242, 193); 
  fill (232, 226, 115); 
  bezier(30, 30, mouseX, mouseY, mouseX, mouseY, 570, 570); 
  bezier(30, 30, mouseY, mouseX, mouseY, mouseX, 570, 570); 


}

void mouseClicked() {
  background(255); 
}

