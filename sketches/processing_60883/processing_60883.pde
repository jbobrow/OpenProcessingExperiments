



void kill()
{
  for (int i=0; i<20; i++)
  {
    if (dist(e[i].ex, e[i].ey, WBCposX+40, WBCposY+40) <= 50)
    {
      e[i] = new Enemy();
      e[i].ex = 950;
      e[i].ey = random(-height, height*2);
      e[i].m=(int)random(50000, 1000000);
      e[i].u=(int)random(5, 400000000);
    }
  }
}




