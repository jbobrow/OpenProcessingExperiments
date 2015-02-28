
size(500, 500);
smooth();

strokeWeight(2);
stroke(10,100,20, 50);

for (int i=10; i<=width; i+=10)
{
  for (int j=10; j<=height; j+=10)
  {
    
    line(i+3, j+(i*3), i, j+3);
    line(j, i, j, i);
  }
}

strokeWeight(2);
stroke(50,200,100, 90);

for (int i=15; i<=width; i+=10)
{
  for (int j=15; j<=height; j+=10)
  {
    
    line(i+3, j+(i*3), i, j+3);
    line(j, i, j, i);
  }
}


