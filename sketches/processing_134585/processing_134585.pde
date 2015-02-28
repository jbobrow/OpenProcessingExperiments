
void setup() {
  size(500,500);
}
  
void draw() {
  if (mousePressed) {
    fill(162,80,255);
    stroke(random(258), random(60), random (259));
  } else {
    fill(random(87), random(20), random (250));
  }
  ellipse(mouseX, mouseY, 60, 20);
}
