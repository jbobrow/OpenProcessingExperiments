
float xCor;
void setup() {
  size (800, 600);
    xCor=200;
  smooth();
}

void draw () {

  //background(23, 69, 70, 80);

  stroke(230, 70, 60);
  strokeWeight(1);

  xCor=xCor+2;
  ellipse (xCor, height/2, mouseX, mouseX);
  fill (mouseX, mouseY);
  ellipse (mouseX, mouseY, 30, 30);
  //ellipse (mouseX+50,mouseY, 20, 20);
  fill (30, 60, 255, 150);

  // ellipse (100, 40, 20, 20);
  // saveFrame("bild.png");
}



