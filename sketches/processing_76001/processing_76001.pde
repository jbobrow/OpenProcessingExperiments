
int dub;
void setup()
{
  size(300,300);
  frameRate(2);
  dub = 1;
}
void draw()
{
  background(0);
  fill(random(255),random(255),random(255),200);
  int i = 1;
  while (i<=dub)
  {
    ellipse(int(random(300)),int(random(300)),40,40);
    i++;
  }
  dub=dub*2;
}
