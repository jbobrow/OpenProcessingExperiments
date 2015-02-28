
Bubble[] kugel = new Bubble[50];
Linie[] koks = new Linie[100]; 

int q1, q2;

int randomA, randomB;

void setup()
{
  size(1000, 500);
  background(255);
  smooth();
  
  
  for(int i = 0; i < kugel.length; i++) kugel[i] = new Bubble(random(width), random(height));
  for(int i = 0; i < koks.length; i++)
  {
    randomA = int(random(kugel.length));
    randomB = int(random(kugel.length));
    koks[i] = new Linie(kugel[randomA].getX(), kugel[randomA].getY(),  kugel[randomB].getX(), kugel[randomB].getY(), randomA, randomB);
  }
  
}


void draw()
{
  background(255);
  for(int b = 0; b < koks.length; b++)
  {
    q1 = koks[b].getErstens();
    q2 = koks[b].getZweitens();
    koks[b].update(kugel[q1].getX(), kugel[q1].getY(), kugel[q2].getX(), kugel[q2].getY());
    koks[b].zeigen();
  }
    for(int b = 0; b < kugel.length; b++)
  {
    kugel[b].zeigen();
    kugel[b].bewegen();
  }
}
  









