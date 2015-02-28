
size(500, 500);
smooth();
background(240);
 
stroke(255,100);
 
for (int i=10; i<=width; i+=15)
{
  for (int j=1; j<=height; j+=15)
  {
    fill(33,120,162,15);
//      ellipse(j, j+(i/2), j+(i/2), j);
      ellipse(j+i, j, j, i);
//      ellipse(j*2, j+(i*10), j+(i/10), j);
  }
}

