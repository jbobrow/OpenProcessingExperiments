
float xCor;
void setup () {
  //smooth ();
  size(800, 600);
    xCor=200;
}
void draw () {
  //background(255);
  //stroke(255, 255, 255);
  //strokeweight(100);
  fill(100, 102, 0, 10);
  //ellipse(mouseX, mouseY, 55, 55);

  xCor=xCor+2;
  ellipse(xCor, height/2, mouseX, mouseY);

  //ellipse(width/2, height/2, mouseX, mouseY);

  //ellipse(mouseX+60, mouseY+60, 55, 55);
  //saveFrame("bild.png");
}


