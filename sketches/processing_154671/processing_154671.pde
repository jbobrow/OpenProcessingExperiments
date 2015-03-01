
color [] [] c;

int s = 4;

void setup ()
{
  size(600, 200, P3D);
  //smooth();
  noSmooth();

  c = new color [width/s] [height/s];

  int i = 0;
  while (i < c.length)
  {
    int j = 0;
    while (j < c[i].length)
    {
      c [i] [j] = color ((i * j) & 255, 255 / (1+(i + j) | (i * j)), i ^  (j /3));
      j = j + 1;
    }
    i = i + 1;
  }
}

void draw ()
{
  background (#57385c);
  noStroke();
  int i = 0;
  while (i < c.length)
  {
    int j = 0;
    while (j < c[i].length)
    {
      color fc = c [i] [j];
      fill (fc);

      rect (i*s, j*s, s, s);

      j = j + 1;
    }
    i = i + 1;
  }
}

