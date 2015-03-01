
void setup() {
  size(900, 300);
  fill(237, 28, 36);
  noStroke();
  float rotate = 0.001;
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  for (float i = 30; i < 100; i++) {
    rotate(mouseY);
    ellipse(i, 0, 5, 5);
   
  }
}

