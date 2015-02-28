
//Brian C, Doubling Shapes, CP1 Mods 16/17

int limit = 1;
void setup()
{
  size(400,300);
  frameRate(1);
}
void draw()
{
  background(0);
  int count = 1;
  while(count <= limit)
  {
    strokeWeight(6);
    fill(random(1,256),random(1,256),random(1,256),150);
    ellipse(random(30,370),random(30,270),random(30,50),random(30,50));
    count++;
    text(limit,10,290);
  }
  limit = limit * 2;
  if (limit == 4096)
  {
    fill(0);
    rect(0,0,400,300);
    limit = 1;
  }
}
