
size(800, 800);
smooth();
noFill();
background(0);

for (int y=19; y<=height; y+=1)
{
  for (int x=54; x<=width; x+=421)
  {
    stroke(183, 228, 245);
    line(x, y, x+3125, x+231);
  }
}



