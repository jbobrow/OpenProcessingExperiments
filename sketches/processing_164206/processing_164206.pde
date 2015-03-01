
void setup()
{
  size(500,300);
  background(0);
}

void draw()
{
}

void Element(float x, float y, float dx, float dy, float d, int dd, color c)
{
  fill(c);
  if( dd == 0)
  {
    ellipse(x + (dx/2), y + (dy/2), dx/2*d, dy/2*d); 
  }
  if( dd == 1)
  {
    rect(x,y, dy*d, dx*d);
  }
}

void Bild1(float a, float aa)
{
  float d = random(1);  
  int dd = int(random(2));
  int xx = int(random(9));
  int yy = int(random(15));
  color c = color(random(255), random(255), random(255));
  for(int x = 0; x < xx; x++)
  {
    for(int y = 0; y < yy; y++)
    {
      Element(a+(aa/xx*x), (300/yy*y), aa/xx, 300/yy, d, dd, c);
    }
  }
}

void keyPressed()
{
  background(0);
  int xx = int(random(6));
  for(int xz = 0; xz < xx; xz++)
 {
   Bild1(500/xx*xz, 500/xx);
 }
save("Test.png"); 
}
