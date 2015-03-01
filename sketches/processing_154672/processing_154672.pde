
float [] [] pos = new float [0] [2];
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
    ellipse (pos[i] [0], pos[i] [1], s[i], s[i]);
 
    int j = i+1;
    while (j < pos.length)
    {
      float dis = dist (pos[i] [0], pos[i] [1], pos[j] [0], pos[j] [1]);
      if (dis > 10 && dis < 40)
      {
        line (pos[i] [0], pos[i] [1], pos[j] [0], pos[j] [1]);
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
    float [] p = new float [2];
    p [0] = random (width);
    p [1] = random (height);
    pos = (float [] []) append (pos, p);
    s = (int []) append (s, round (random (6, 20)));
  }
  else
  {
    if (pos.length > 0)
    {
      pos = (float [] []) shorten (pos);
      s = (int []) shorten (s);
    }
  }
}
