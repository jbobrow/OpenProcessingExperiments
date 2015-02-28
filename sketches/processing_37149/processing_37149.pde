
float xPos;
float yPos;

void setup () {
  size (800, 200);
  background (255);
  xPos = 0;
  yPos=height/2;
}

void draw () {
  xPos = xPos + 12;
  yPos = yPos + random(-10,10);
  ellipse(xPos, yPos, 10, 10);

noFill();
}

