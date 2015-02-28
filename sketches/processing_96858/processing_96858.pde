
void setup ()
{
  size(400, 400);
  ellipseMode(CENTER);
}
void draw()
{
  background(120, 30, 0);
  stroke(250);
  ellipse(mouseX, mouseY, 80, 80);
}
void mousePressed() {
  if (mouseButton == LEFT) {
    fill(0);
  } 
  else if (mouseButton == RIGHT) {
    fill(255, 255, 0);
  } 
  else {
    fill(255);
  }
}



