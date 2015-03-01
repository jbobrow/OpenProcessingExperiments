
void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  if (mousePressed) {
    background(100, 200, 0);
    fill(0);
  }
  
  stroke(255, 255, 255);
  fill(160, 220, 90);
  ellipse(250, 250, 300, 300);
  
  stroke(255, 255, 255);
  fill(105, 215, 150);
  ellipse(250, 250, 100, 100);
  
  fill(255, 255, 255);
  ellipse(215, 215, 35, 35);
  
  fill(255, 255, 255);
  ellipse(290, 215, 50, 50);
  
  fill(255, 2, 255);
  rect(215, 215, 5, 5);
  
  fill(255, 2, 255);
  rect(290, 200, 20, 20);
  
  fill(0);
  ellipse(mouseX, 305, 50, 60);
  
}
