
//Alan C DoublingSquares 14/15
int x=1;
int y=1;
 
void setup()
{
  size(500, 500);
  frameRate(10);
}
void draw()
{
 
  background(150);
  int x = 1;
  while (x<=y)
  {
    fill(random(255));
    stroke(20,150,255);
    strokeWeight(3);
    rect(int(random(500)), int(random(500)), 25, 25);
    x++;
  }
 
 if (x>=y)
  {
    y=y*2;
  }
  if (x>1300)
  {
    x=1;
    y=1;
  }
      fill(255,0,0);
  textSize(100);
  text(y/2, 150,150);
}
