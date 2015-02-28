
void setup() {
  size(500,500);
}
  
void draw() {
  if (mousePressed) {
    fill(400,80,200);
    stroke(random(270), random(220), random (185));
  } else {
    fill(random(450), random(280), random (345));
  }
  ellipse(mouseX, mouseY, 80, 80);
}
