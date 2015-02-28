
void setup() {
  size(500,500);
  background(255);
}
  
void draw() {
  if (mousePressed) {
    fill(155,0,0);
    stroke(random(250), random(30), random (105));
  } else {
    fill(random(222), random(15), random (100));
  }
  ellipse(mouseX, mouseY, 50, 50);
}
