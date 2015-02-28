
int gyna = 5;

void setup() {
  background(10);
  size(600,600);
}

void draw() {
  
  stroke(255);
  noFill();
  line (mouseY, mouseX,pmouseX,pmouseY);
  stroke(280,10,358);
  ellipse(random (width), random(height),3,3);
  
}
