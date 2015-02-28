
size(500, 500);
noStroke();
smooth();
background(255);
fill(0);

for (int i = 0; i < 25; i++)
{
  for (int j = 0; j < 25; j++)
  {
    int b = round(random(14));
    if (b >= 0 && b <= 3)
    {
      triangle(i*20, j*20,  (i+1)*20, j*20,  i*20, (j+1)*20);
    }
    if (b >= 4 && b <= 6)
    {
      triangle(i*20, j*20,  (i+1)*20, j*20,  (i+1)*20, (j+1)*20);
    }
    if (b >= 7 && b <= 9)
    {
      triangle(i*20, j*20,  i*20, (j+1)*20,  (i+1)*20, (j+1)*20);
    }
    if (b >= 10 && b <= 12)
    {
      triangle((i+1)*20, j*20,  i*20, (j+1)*20,  (i+1)*20, (j+1)*20);
    }
    if (b == 13)
    {
      rect(i*20, j*20, 20, 20);
    }
  }
}
