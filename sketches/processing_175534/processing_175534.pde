
void setup(){
  size(600, 600);
  smooth();
  frameRate(10);
  background(0);
}

void draw(){
  noStroke();
  fill(255);
  ellipse(100, 500, 50, 50);
  noFill();
  strokeWeight(4);
  stroke(255);
  curve(100, 100, mouseX, mouseY, 100, 500, 500, 100);
  stroke(200);
  curve(100, 100, mouseY, mouseX, 130, 500, 500, 100);
}
