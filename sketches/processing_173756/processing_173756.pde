
void setup()
{
  size(500,300);
}

void draw()
{
}

void keyPressed()
{
  int f; 
  
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  color c1 = color(rot, grun, blau);
  color c2 = color((grun+blau)/2, (rot+blau)/2, (rot+grun)/2);
  color c3 = color(255-rot, 255-grun, 255-blau);
  
  f = int(random(3));
  if(f==0)
  {
    background(c1);
  }
  if(f==1)
  {
    background(c2);
  }
  if(f==2)
  {
    background(c3);
  }
  
  for(int z = 0; z < 5; z++)
  {
    f = int(random(3));
  if(f==0)
  {
    fill(c1);
  }
  if(f==1)
  {
    fill(c2);
  }
  if(f==2)
  {
    fill(c3);
  }
    triangle(0+z*100,300, 50+z*100,0, 100+z*100,300);
    f = int(random(3));
  if(f==0)
  {
    fill(c1);
  }
  if(f==1)
  {
    fill(c2);
  }
  if(f==2)
  {
    fill(c3);
  }
    triangle(50+z*100,0, 100+z*100,300, 150+z*100,0);
  } 
}
