
//Di T,hundredshapes, CP1, 14-15

void setup()
{
  size(700,700,P3D);
  smooth();
  frameRate(5);
  noStroke();
  
}

void draw()
{
  background(0);
  
  int i = 1;
  pointLight(0, int(random(0,255)), int(random(0,255)), 350, 350, 200);
  while ( i <= 100)
  {
  int size = int(random(3,30));
  int xx = int(random(0,700));
  int yy = int(random(0,700));
  int zz = int(random(0,200));
  translate(xx,yy,zz);
  sphere(size);
  i++;
  translate(-xx,-yy,-zz);   
   
  }
}
