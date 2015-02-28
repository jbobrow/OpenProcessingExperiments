
size(600, 600);
smooth();
background(255);

for(int i=0; i<height; i+=8) 
{
  for(int j=10; j<width; j+=80) {
  stroke(i, j, 100);
  line(0, i-j, 600, i+j);
  }
}


