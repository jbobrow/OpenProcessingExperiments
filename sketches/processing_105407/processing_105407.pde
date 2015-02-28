
void setup () {
  size(500, 500);
}

void draw () {

  if (mouseX<250 && mouseY<250) {
    fill (225, 83, 13);
    rect (0, 0, 250, 250);
  }
  if (mouseX>250 && mouseY<250) {
    fill (255, 0, 0);
    rect (250, 0, 250, 250);
  }
  if (mouseX<250 && mouseY>250) {
    fill (232, 12, 122);
    rect (0, 250, 250, 250);
  }
  if (mouseX>250 && mouseY>250) {
    fill (255, 13, 255);
    rect (250, 250, 250, 250);
  }
  ellipse (250,250,300,300);
  
}
