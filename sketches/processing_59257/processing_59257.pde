
int rad = 0;
void setup()
{
  size(500,500);
}

void draw()
{
  fill(255,255,255);
  ellipse(250,250,100,100);
  fill(255,0,0);
  text("Click Here",220,250);
}

void mousePressed()
{
  changeBackground(int(random(0,4)));
}

void changeBackground(int i)
{
  if (i == 0)
  {
    background(255,255,255);
  }
  
  if (i == 1)
  {
    background(0,0,0);
  }
  
  if (i == 2)
  {
    background(255,0,0);
  }
  
  if (i == 3)
  {
    background(0,255,0);
  }
  
  if (i == 4)
  {
    background(0,0,255);
  }
}


