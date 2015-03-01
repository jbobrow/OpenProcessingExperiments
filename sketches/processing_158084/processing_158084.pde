
void setup() {
  size(700, 600);
  background(13);
}
void draw()
{
  println (mousePressed);
  if (mouseX<100 && mousePressed) {
    ellipse(100, 100, 10, 10);
  }
  if (mouseX>100 || mousePressed) {
    rect(200, 200, 10, 10);
  }
  if (mouseX!=100 && !mousePressed) {
    rect(300, 300, 20, 20);
  }
}

