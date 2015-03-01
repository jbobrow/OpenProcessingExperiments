


void setup(){
  size(600, 600);
  smooth();
  frameRate(10);
  background(0);
}

void draw(){
  noFill();
  strokeWeight(4);
  stroke(200);
  curve(100, 100, mouseY, mouseX, 300, 100, 500, 100);
  stroke(150);
  curve(100, 100, mouseY, mouseX, 300, 500, 500, 100);
}
