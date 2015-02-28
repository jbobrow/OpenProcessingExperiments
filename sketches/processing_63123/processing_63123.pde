
size(500, 500);
smooth();
background(0);
 
strokeWeight(1);
stroke(232,220,232,5);
 
for (int i=10; i<=width; i+=10)
{
  for (int j=10; j<=height; j+=10)
  {
     
    line(i, i, j, j/5);
    line(i, j, j, i*5);
    line(j/5, j, i, i/5);
//    line(j, j+(i/2), j+(i/7), j);
  }
}

