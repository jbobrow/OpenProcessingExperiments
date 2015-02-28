
size(600, 600);
smooth();
background(0);

strokeWeight(5);

int eSize = 20;
//outer
for (int i=eSize/2; i<width; i=i+eSize)
{
  for (int j=eSize/2; j<height; j=j+eSize)
{
  strokeWeight (j);
  stroke(255-i,j-255,255);
  point(2.5*i,j); 
}
}


