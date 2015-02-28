
void setup () {
  size (500, 500);
  background(255);
}
void draw () {
  if (mouseX>width/2 && mouseY>height/2)
  ellipse (mouseX, mouseY, 10, 10);

  if (mouseX<width/2 && mouseY>height/2)
  line (mouseX, mouseY, 250, 250);

  if (mouseX<width/2 && mouseY<height/2)
  rect (10, 10, mouseX, mouseY);
  
  if (mouseX>width/2 && mouseY<height/2)
  ellipse (mouseX, mouseY, 20, 20);
}
