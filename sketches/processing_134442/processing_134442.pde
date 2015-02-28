
void setup() {
  size (500,500);
  background (255);
}
void draw() {
  if (mousePressed) {
    fill(0);
     } else {
    fill((random(45)),(random(56)),(random(65)));
    }
  ellipse (mouseX,mouseY,180,180);
}
