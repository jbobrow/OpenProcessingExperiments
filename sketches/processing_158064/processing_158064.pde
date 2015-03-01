
void setup() {
  size(700, 600);
  background(13);}
void draw()
{
  println (mousePressed);
  if (mousePressed) {
    ellipse(mouseX, mouseY, 10, 10);
    fill(15, 220, 110);
  }
  else {
    rect(mouseY, mouseX, 20, 20);
    fill(120, 16, 203);
  }
}
