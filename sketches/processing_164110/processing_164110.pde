
void setup()
{
  size(300,500);
}

void draw()
{
}

void fahrben(int rot, int grun, int blau)
{
  int zufall = int(random(4));
  if(zufall == 0)
  {
    fill(255 - rot, grun, blau);
  }
  if(zufall == 1)
  {
    fill(rot, 255 - grun, blau);
  }
  if(zufall == 2)
  {
    fill(rot, grun, 255 - blau);
  }
  if(zufall == 3)
  {
    fill(255 - rot, 255 - grun, 255 - blau);
  }
}

void keyPressed()
{
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  fahrben(rot, grun, blau);
  rect(0,0,150,250);
  fahrben(rot, grun, blau);
  rect(0,250,150,250);
  fahrben(rot, grun, blau);
  rect(150,0,150,250);
  fahrben(rot, grun, blau);
  rect(150,250,150,250);
  fill(rot, grun, blau);
  ellipse(150,250,150,150);
  save("Test.png"); 
}
