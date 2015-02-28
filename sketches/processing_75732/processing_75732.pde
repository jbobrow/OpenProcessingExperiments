
float xCor;
void setup () {
  //smooth ();
  size (800,600);
  xCor = 100;
}

void draw () {
  //background(255);
  strokeWeight(12);
  stroke (300);
  xCor=xCor+2;
  fill(mouseX, mouseY, 200, 500);
  //ellipse(100, 46, 55, 20);
  ellipse(xCor, height/2, mouseX, mouseY);
  //ellipse(mouseX+155, mouseY+111,  55, 20);
  //saveFrame("bild.png");

}



