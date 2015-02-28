
size(600,200);
background(255, 39, 46);
smooth();

strokeWeight(1);
for (int i=2; i<=width; i+=10)
{
  for (int j=2; j<=height; j+=10)
  {
    quad(i, j, i+20, j+20, i, j, i+20, j+20);
  }
}


fill(240);
for (int i=-35; i<=width; i+=10)
{
  for (int j=30; j<=height; j+=10)
  {
    quad(i+50, height, i+20, j+20, i+50, j, width, j+100);
  }
}


