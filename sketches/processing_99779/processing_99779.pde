
void setup() {
  size(500, 500);
  background(0,0,0);
}
void draw() {
  if (mousePressed == true) {
    strokeWeight(random(8));
    stroke(random(5),random(5),random(100));
    fill(random(225),random(225),random(225));
    ellipse(mouseX, mouseY, mouseX/2, mouseY/2);
  }
}
   



