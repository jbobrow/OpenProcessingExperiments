
size(600, 600);
smooth();
background(255);

int carbon = 70;
int eSize = 2+(carbon/3);
//outer
for (int i=eSize/2; i<width; i+=(2*i+eSize)/10)
{
  for (int j=carbon/i; j<height/2; j+=2)
{
  strokeWeight (2);
  stroke(1.4*j);
  point(j+i, height-(3*j));
}
}


