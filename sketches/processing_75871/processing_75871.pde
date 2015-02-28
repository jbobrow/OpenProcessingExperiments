
//Dan-Tran Cong-Huyen, Doubling Shapes, CP1 16/17
int count = 1;
void setup()
{
  size(500,500);
  frameRate(2);
  noStroke();
}
void draw()
{
  background(187,180,188);
  int x = 1;
  while(x <= count )
  {
    fill(int(random(255)),int(random(255)),int(random(255)));
    ellipse(int(random(500)),int(random(500)),30,30);
    x++;
  }
  count = count*2;
  if(count >= 1024)
  {
    count = 1;
  }
}
