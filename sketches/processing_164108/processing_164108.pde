
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  Farben1();
  rect(0,0,100,250);
  Farben1();
  rect(100,0,100,250);
  Farben1();
  rect(200,0,100,250);

  Farben2();
  rect(0,250,100,250);
  Farben2();
  rect(100,250,100,250);
  Farben2();
  rect(200,250,100,250);  
  save("Test.png");
}

void Farben1()
{
  int x = int(random(6));
  if ((x==0) || (x == 1))
  {
    fill(random(50)+200,0,0);
  }
  if (x==2)
  {
    fill(0,random(50)+200,0);
  }
  if ((x==3) || (x==4))
  {
    fill(0,0,random(50)+200);
  }
  if (x==5)
  {
    fill(random(50)+200,random(50)+200,0);
  }
}

void Farben2()
{
  int x = int(random(6));
  if ((x==0) || (x == 1))
  {
    fill(255 - random(50),0,0);
  }
  if (x==2)
  {
    fill(0,255 - random(50),0);
  }
  if ((x==3) || (x==4))
  {
    fill(0,0,255-random(50));
  }
  if (x==5)
  {
    fill(255-random(50),255-random(50),0);
  }
}
