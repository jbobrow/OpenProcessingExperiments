
//Eric T. Computer Programming 1 Mods 4-5
void setup()
{
  size(400,400);
}
void draw()
{
  face();
  eyes();
  mouth();
  eyebrows();
}
void face()
{
  fill(252,236,43);
  stroke(0);
  strokeWeight(5);
  smooth();
  ellipse(200,200,300,300);
}
void eyes()
{
  fill(0);
  ellipse(150,160,40,90);
  ellipse(250,160,40,90);
}
int y = 250;
void mouth()
{
  noFill();
  bezier(130,y,200,300,200,300,280,y);
  y = y + 1;
  if(y > 301)
  {
    y = 301;
  }
}
int brow1 = 100;
int brow2 = 100;
void eyebrows()
{
  noFill();
  bezier(110,105,150,brow1,150,brow1,190,105);
  bezier(210,105,250,brow2,250,brow2,290,105);
  brow1 = brow1 - 1;
  brow2 = brow2 + 1;
  if(brow1 < 80)
  {
    brow1 = 80;
  }
  if(brow2 > 120)
  {
    brow2 = 120;
  }
}
