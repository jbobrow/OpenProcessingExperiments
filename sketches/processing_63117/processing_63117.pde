
size(500, 500);
smooth();
noFill();
background(255);

for (int y=2; y<=height; y+=10)
{
  for (int x=3; x<=width; x+=30)
  { 
   stroke(117,152,77);
   line(x, y, x+25, x+15);
  }
  
}

