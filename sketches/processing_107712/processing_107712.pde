
void setup() {
  size(900,700);
  background(204, 0, 150);

}

void draw() {
  if (mousePressed) {
    ellipse(mouseX, mouseY, mouseX/2, mouseY/2);
    stroke(200, 150, 15);
    strokeWeight(4); 
    fill(0, 0, 0);
    translate(width/2, height/4);
  } else {
    stroke(120, 0, 250);
    strokeWeight(3);
    fill(15,40,200);
    ellipse(mouseX, mouseY, mouseX/8, mouseY/8);
}
}
