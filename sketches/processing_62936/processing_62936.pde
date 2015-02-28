

size(600, 600);
smooth();
background(0);

for(int i=40; i<height; i+=8) 
{
  for(int j=10; j<width; j+=80) {
  stroke(i, 248, j);
  line(i-j/2, i-j, 600, i+j);
  stroke(j, 248, i);
  line(i-j, i, j, j);
  }
}


