
size (800, 800);
background(50);
smooth();

for (int y=0; y< height; y+=20)
{
  for (int x=0; x< width; x+=10)
  {
    stroke(y/2,0,x/5);
    strokeWeight(random(1,10));
    point(2*x, y);
  }
}

for (int y=0; y< height; y+=5)
{
  for (int x=0; x< width; x+=50)
  {
    stroke(y/2,0,x/5);
    strokeWeight(random(1,10));
    point(x/2, y);
  }
}



