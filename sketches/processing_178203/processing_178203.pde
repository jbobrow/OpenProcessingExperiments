
void setup() {
  size(1000, 1000);
}
 
void draw() {
  if (mousePressed) {
    fill(random(255),mouseX,145,mouseY);
  } else {
    fill(random(200),20,mouseX,mouseY);
  }
  ellipse(mouseX, mouseY, 25, 25);
  ellipse(mouseY, mouseX, 25, 25);
}
