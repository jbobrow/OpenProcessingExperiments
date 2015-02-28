
size(400,400);
background(255);
smooth();

fill(150, 50);
noStroke();

for (int i = 10; i <=width; i+=15)
{
  for (int j = 10; j <=height; j+=15)
  {
    ellipse(i, j+i*1.5, 25, 25);
    ellipse(i,j, 7, 7);
  }
}




for (int x = 50; x <=width; x+=35)
{
  for (int y = 50; y <=height; y+=35)
  {
    ellipse(x*1.2, y+x*1.7, 15, 15);
  }
}

