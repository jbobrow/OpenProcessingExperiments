
size(400,400);
background(200);
smooth();

for (int i = 10; i <=width; i+=10)
{
  for (int j = 10; j <=height; j+=10)
  {
    stroke(0);
    point(i,j);
    stroke(150, 200, 100);
    point(i*1.5, j*1.5);
    stroke(235, 45, 25);
    point(i*1.2, j*1.2);
    stroke(255);
    point(i*1.7, j*1.7);
  }
}

