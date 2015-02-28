
//Roberta
//Reforço 5
void setup()
{
  size(200, 200);
  background(126, 4, 175);
}

void draw()
{
  for (int x=100; x<130; x+=40)
    for (int y=20; y<180; y+=25)
    {
      stroke(255, 255, 0);
      strokeWeight(2);
      line(20, 20, 50+x*x/1000, y);
      line(180, 20, 150-x*x/1000, y);
    }
}
