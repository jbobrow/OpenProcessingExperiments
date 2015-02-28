
size(500, 500);
smooth();
background(174, 130, 198);
 
stroke(92, 218, 222);
 
for (int i=10; i<=width/2; i+=10)
{
  for (int j=1; j<=height; j+=10)
  {
      line(0, j+(i*3), j+ (i*2), j*2);
  }
}

