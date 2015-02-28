
float pacX=300;
float pacY=300;
float count=0;
float pacsize=20;
void setup()
{
  size(600, 600);
  background(0);
}
void draw()
{
  count=count+1;
  if (count>599)
  {
    background(0);
    ellipse(300, 300, pacsize, pacsize);
    pacsize=pacsize+40;
  }
  else
  {
    pacman();
  }
}
void pacman()
{
  background(0);
  fill(250, 250, 40);
  arc(pacX, pacY, 50, 50, PI/4, 7*PI/4);
  pacX=pacX+int(random(-10,10));
  pacY=pacY+int(random(-10,10));
}
