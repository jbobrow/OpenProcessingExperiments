
// © Laura Tjho
// 60-257 Hw Assignment 8 

int x, y, dx, dy, phase;
float wd, ht;

void setup()
{
  size(400,400);
  background (115, 161, 173);
  smooth();
  
  y=0;
  dx=30;
  dy=20;
  
  wd= width*.3;
  ht= height*.3;
}

void draw()
{
  if (phase == 0)
  {
    rain();
  }
  else if (phase == 1)
  {
    snow();
    y=(y+dy) % height;
  } 
}

void snow()
{
  int x = 0;
  while (x < width) 
  {
    noStroke();
    fill (255, random(226), 0);
    ellipse(x, y, wd/8, ht/8);
    x= x+dx;
  }
}

void rain()
{
  for (int l=0; l < width; l = l+10) 
  {
    for (int m=0; m < height; m = m+10)
    {
      strokeWeight(1);
      stroke(98, random(255), 227);
      ellipse(l, m, wd/12, ht/12);
    }
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    phase = 1;
    background (247, 146, 77);
  }
  
  if (key == 'f')
  {
    phase = 0;
  }
}

