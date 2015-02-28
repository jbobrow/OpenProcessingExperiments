
size(500,600);
background(255);
smooth();

stroke(0,255);
for (int i=2; i<=width; i+=10)
{
  for (int j=2; j<=height; j+=10)
  {
    quad(i/2, j/4, i+8, j+2, i/2, j/2, i+20, j+20);
  }
}
stroke(18,3,255);
noFill();
for (int i=-5; i<=width; i+=10)
{
  for (int j=-5; j<=height; j+=10)
  {
    quad(i+2, j+2, i+2, j+2, i+2, j+2, i+20, j+20);
  }
}

stroke(0,250);
noFill();
for (int i=2; i<=width; i+=10)
{
  for (int j=2; j<=height; j+=10)
  {
    quad(width, height, height/4, width*2000, i, j, width/2, j/20);
  }
}

