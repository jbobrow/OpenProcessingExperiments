
int gyna = 5;

void setup() {
  background(10);
  size(600,600);
}

void draw() {
  
  stroke(255);
  
  line (mouseY, mouseX,pmouseY,pmouseX);
  stroke(250,10,0);
  strokeWeight(0.1);
  line (mouseY, mouseX,mouseX,mouseY);
  stroke(255,55,10);
  line (mouseY, mouseX,pmouseX,pmouseY);
  stroke(107);
  
}
