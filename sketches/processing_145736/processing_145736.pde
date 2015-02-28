
int counter;

void setup () {
  smooth();
  size (500, 500);
}
void draw () {
  background(0);
  

//* Head
  stroke (255);
  fill(0);
  ellipseMode(CENTER);
  ellipse (mouseX, mouseY+-1, 101, 101);
  //* Ears
  //Right Ear
  ellipse (mouseX+61, mouseY+-64, 73, 74);
  //Left Ear
  ellipse (mouseX-60, mouseY-66, 73, 74);
//* Eyes
  fill (255);
  ellipseMode (CENTER);
  ellipse (mouseX-20, mouseY+-1, 35, 20);
  ellipse (mouseX+25, mouseY+-1, 35, 20);
//* Eyemask
  fill (200, 40);
  ellipse (mouseX+0, mouseY+0, 100, 33);
//* aureool
  stroke (255);
  fill (255, 255, 0, 50);
  ellipse (mouseX+3, mouseY-123, 110, 21);
//*mouth 
  stroke (255);
  fill (255);
  ellipse (mouseX+3, mouseY+37, 45, 12);
//*mouth block
  stroke(0);
  fill(0);
  rect ( mouseX-25, mouseY+36, 54, -8);

  stroke(0);
  fill(0);
}

