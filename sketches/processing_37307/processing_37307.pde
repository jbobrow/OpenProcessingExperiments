
//Edmond Guan
//Press 'c' to clear screen

void setup()
{
  size (
  600, 600);
  background(255, 255, 255);
}
void draw()
{

  if (mousePressed == true)
  {
    noCursor();
  }
  else {
    cursor(ARROW);
  }
}
void mouseMoved() {
  line(pmouseY, pmouseX, mouseY, mouseX);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  if (key == 'c') {
    background(255, 255, 255);
  }
}


