
// mousePressed exercise
void setup() {
  size(640, 360);
  noSmooth();
  fill(126);
  
}

void draw() {
  background(0);
  if (mousePressed) {
    stroke(0);
  } else {
    stroke(255);
  }
  strokeWeight(3);
  fill(random(0,255), random(0,255), random(0, 255));
  ellipse(mouseX, mouseY, 80, 80);
  
}


