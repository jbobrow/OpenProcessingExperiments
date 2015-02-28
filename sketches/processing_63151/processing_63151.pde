
size(600, 600);
smooth();
background(255);

strokeWeight(5);

int eSize = 20;
//outer
for (int i=eSize/2; i<width; i+=i+eSize)
{
  for (int j=eSize/6; j<height; j+=40)
{
  strokeWeight (10);
  stroke(250-i,j*2,150);
  point(i/2-10,j*5+(i+3)); 
}
}


