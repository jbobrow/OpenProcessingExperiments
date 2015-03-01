
int gyna = 5;

void setup() {
  background(10);
  size(600,600);
}

void draw() {
  
  stroke(255);
  noFill();
  line (mouseY, mouseX,10,90);
  stroke(255);
  rect(random (width), random(height/2),10,100);
  
}
