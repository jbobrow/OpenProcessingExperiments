
size(500, 500);
background(0);
smooth();
noStroke();

for (int i = 0; i < 4; i++)
{
  for (int k = 0; k < 4; k++)
  {
    for (int j = 0; j < 10; j++)
    {
      if (j%2 == 0) fill(255, 0, 0);
      else fill(255);
      ellipse((i+1)*100, (k+1)*100, 80-(j*8), 80-(j*8));
    }
  }
}
