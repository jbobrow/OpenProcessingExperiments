
void setup() {
  size (500,500);
  background (255);
}
void draw() {
  if (mousePressed) {
    fill(0);
     } else {
    fill((random(55)),(random(55)),(random(55)));
    }
  ellipse (mouseX,mouseY,60,60);
}
