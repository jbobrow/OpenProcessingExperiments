
particle p[] = new particle[100];
float g=0.901;
void setup()
{
  size(1000,500);
  for(int i=0 ; i<p.length ; i++)
  p[i] = new particle(
  width/2+random(-5,5),
  height + random(-5,5),
  random(-5,5), random(-5,-10)
   );
}

void draw()
{
  for(particle n : p)
{
  n.move();
  n.draw();
}
