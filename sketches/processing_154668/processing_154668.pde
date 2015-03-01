
float [] x = new float [0];
float [] y = new float [0];
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
  while (i < x.length)
  {
    ellipse (x[i], y[i], s[i], s[i]);

    int j = i+1;
    while (j < x.length)
    {
      float dis = dist (x[i], y[i], x [j], y[j]);
      if (dis > 10 && dis < 40)
      {
        line (x[i], y[i], x [j], y[j]);
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
    x = (float[]) append (x, random (width));
    y = (float[]) append (y, random (height));
    s = (int []) append (s, round (random (6, 20)));
  }
  else 
  {
    if (x.length > 0)
    {
      x = (float[]) shorten (x);
      y = (float[]) shorten (y);
      s = (int []) shorten (s);
    }
  }
}

