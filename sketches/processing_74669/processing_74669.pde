
void setup()
{
  size(600, 600);
  background (0);
  noStroke();
}
int x=1;
void draw()
{
  lights();
  if (x<=100)
  {
    fill(255);
    pushMatrix();
    int siz = int(random(3, 30));
    int offsetX = int(random(0, 600));
    int offsetY = int(random(0, 600));
    ellipse(offsetX, offsetY, 10,10);
    popMatrix();
    x=x+1;
  }
}
void mousePressed()
{
  x=1;
  background(0);
}
