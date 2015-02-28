
//Lisa L, CP1 Mods 16/17, Doubling Shapes

int t;

void setup()
{
  size(500,500);
  smooth();
  frameRate(1);
  t = 1;
}
void draw()
{
  background(0);
  int num = 1;
  while(num <= t)
  {
    fill(random(0,256),random(0,256),random(0,256),random(0,256));
    ellipse(random(5,496),random(5,496),random(20,51),random(20,51));
    num++;
  }
  t*=2;
  fill(255);
  textSize(60);
  text(t/2,50,50);
  if(t > 2049)
  {
    t = 1;
  }
}
