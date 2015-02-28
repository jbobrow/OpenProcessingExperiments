
void setup()
{
 size(600,600);
 noFill();
 stroke(0);
 background(255);
 smooth();
 noLoop();
}
void draw()
{
  for(int i = 0; i < 4; i++)
  {
    for(int j = 0; j < 4; j++)
    {
      switch(j)
      {
      case 0:
        rect(0, (150*i),150,150);
        break;
      case 1:
        for(int u = 0; u < 4; u++)
        {
          rect(150, (150*i)+(75*u),150,75);
        }
        break;
      case 2:
        for(int u = 0; u < 4; u++)
        {
          rect(300, (150*i)+(37.5*u),150,37.5);
        }
        break;
      case 3:
        for(int u = 0; u < 8; u++)
        {
          rect(450, (150*i)+(18.75*u),150,18.75);
        }
        break;
      }
    }
  }
}

