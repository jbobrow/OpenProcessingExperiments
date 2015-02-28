
void setup()
{
  size(500, 500);
  rectMode(CENTER);
  rec(width/2, height/2, width * 1 / 2);
}

void rec(int x, int y, int w)
{
  int s = w/2;
  if(w > 5)
  {
    rec(x + s, y + s, s);
    rec(x + s, y - s, s);
    rec(x - s, y - s, s);
    rec(x - s, y + s, s);
  }
  
  fill(random(0, 255));
  rect(x, y, w, w);
}

