
// Josh Newby
// Copyright Josh Newby 2013, Pittsburgh PA 15217
// Homework # 8 While and For loops
// navigate between phases with 1 and 2 keys

int phase, i;
 
 
void setup() 
{
  size (400, 400);
  smooth();
}
 
void draw( )
{
  if (phase == 0 )
  {
   page1( );
  }
  else if (phase == 1 )
  {
   page2();
  }
}

void page1 ()
{
  background (0);
  for (int i = 0; i < width; i = i + 15)
  {
  for (int j = 0; j < height; j = j + 30)
  {
    noFill();
    stroke (255, 255, 0);
    ellipse(i * 2, j * 1.5, j, i);
  }
}
}

void page2 ()
{
  background(0);
  i = i + 10;
  int j = -20;
  while (j < width)
  {
    stroke(255, 0, 0);
    ellipse (i, j, i, j);
    j = j + 2;
    
    if (j > height)
    {
      j = -20;
    }
    if (i > width)
    {
      i = -20;
    }
  }
}

void keyPressed ()
{
  if (key =='1')
  {
    phase = 1;
  }
  else if (key == '2')
  {
    phase = 0;
  }
}
