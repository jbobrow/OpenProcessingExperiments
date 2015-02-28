
int numberBalls=5;
int click;
int xPos[]=new int[numberBalls];
int yPos[]=new int[numberBalls];

void setup()
{
  smooth();
  size(400, 400);
  background(0, 0, 0);
}


void draw ()
{
  background(0);
  for (int i=0; i<numberBalls && i < click; i++) {
  fill(random(255),random(255),random(255));
  ellipse(xPos[i], yPos[i], 30, 30);
  }
}
void mouseClicked() {
  xPos[click%numberBalls]=mouseX;
  yPos[click%numberBalls]=mouseY;
  click=click+1;
}


