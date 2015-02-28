
int dub;
void setup()
{
  size(400,400);
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
    ellipse(int(random(400)),int(random(400)),40,40);
    i++;
  }
  dub=dub*2;
  if(i>=200)
  {
    dub=1;
  }
}
