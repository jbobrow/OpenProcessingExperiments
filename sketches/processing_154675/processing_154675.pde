
float [] [] pos;
int [] s;

void setup ()
{
  size(600, 200);
  smooth();
  pos = new float [0] [0];
  s = new int [0];

  int i = 0;
  while (i < 10)
  {
    int num = round (random (2, 20));
    float [] p = new float[num];
    int j = 0;
    while (j < num)
    {
      p [j] = random (10, 30);
      j = j + 1;
    }

    pos = (float [] []) append (pos, p);

    i = i + 1;
  }
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
    int j = 0;
    float x = 0;
    while (j < pos [i].length)
    {
      rect (x, 2+i*20, pos [i] [j], 15);
      x = x + pos [i] [j] + 10;
      j = j + 1;
    }
    i = i + 1;
  }
}

void mousePressed ()
{
setup();
}

