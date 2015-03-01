
PVector [] pos = new PVector [0];
int [] s = new int [0];

void setup ()
{
  size(600, 200);
  smooth();
}

void draw ()
{
  background (#57385c);
  strokeWeight (2);
  stroke (#ffedbc);
  fill (#A75265);
  int i = 0;
  while (i < pos.length)
  {
    ellipse (pos[i].x, pos[i].y, s[i], s[i]);

    int j = i+1;
    while (j < pos.length)
    {
      float dis = dist (pos[i].x, pos[i].y, pos [j].x, pos[j].y);
      if (dis > 10 && dis < 40)
      {
        line (pos[i].x, pos[i].y, pos [j].x, pos[j].y);
      }
      j = j +1;
    }
    i = i +1;
  }
}

void mousePressed ()
{
  if (mouseButton == LEFT)
  {
    PVector p = new PVector (random (width), random (height));
    pos = (PVector[]) append (pos, p);
    s = (int []) append (s, round (random (6, 20)));
  }
  else 
  {
    if (pos.length > 0)
    {
      pos = (PVector[]) shorten (pos);
      s = (int []) shorten (s);
    }
  }
}

