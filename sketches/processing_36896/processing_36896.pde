
float xPos;
float yPos;

void setup () {
  size (300, 300);
  xPos=150;
  yPos=100;
}


void draw () {
  //background (255);

  xPos=xPos+random(-15, 25);
  if (xPos>width) {
    xPos=0;
  }
  yPos=yPos+random(-5, 15);
  if (yPos>height) {
    yPos=0;
  }
  strokeWeight(1);
  fill(xPos, 0, yPos);
  ellipse(xPos, yPos, 24, 44);
  // line(xPos, yPos, 0, 0);
  // line(xPos, yPos, 300, 300);
  // line(xPos, yPos, 300, 0);
  


  fill(xPos, 10, 0); // color will change
}


