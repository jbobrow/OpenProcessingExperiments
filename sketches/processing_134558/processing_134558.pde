
void setup() {
  size(500,500);
}
  
void draw() {
  if (mousePressed) {
    fill(400,80,200);
    stroke(random(400), random(80), random (255));
  } else {
    fill(random(198), random(80), random (205));
  }
  ellipse(mouseX, mouseY, 80, 80);
}

