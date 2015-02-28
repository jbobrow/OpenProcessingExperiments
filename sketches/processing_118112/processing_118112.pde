
void setup() {
  size(600, 600);
}

void draw() {
  stroke(random(255), random(255), random(255));
  strokeWeight(abs(mouseX - pmouseX) + abs(mouseY - pmouseY));
  ellipse(mouseX, mouseY, pmouseX, pmouseY);
}
