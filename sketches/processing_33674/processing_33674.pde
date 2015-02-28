
int numberBalls=5;
int click;
int xPos[]=new int[numberBalls];
int yPos[]=new int[numberBalls];
 
void setup()
{
  smooth();
  size(500, 500);
  background(0, 0, 0);
}
 
 
void draw ()
{
  background(0);
  for (int i=0; i<numberBalls && i < click; i++) {
    fill (200, 69, 40);;
  ellipse(xPos[i], yPos[i], 35, 35);
  }
}
void mouseClicked() {
  xPos[click%numberBalls]=mouseX;
  yPos[click%numberBalls]=mouseY;
  click=click+1;
}


