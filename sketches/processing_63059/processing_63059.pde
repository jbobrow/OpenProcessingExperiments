
size(400,400);
background(255);
smooth();

for (int i = 10; i <=width; i+=10)
{
  for (int j = 10; j <=height; j+=10)
  {
    point(i,j);
    point(i*1.5, j*1.5);
  }
}

