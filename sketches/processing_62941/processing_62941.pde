

size(600, 600);
smooth();
background(0);
stroke(255);

for(int i=5; i<width; i+=2)
{
  for(int j=7; j<width; j+=20){
  stroke(221, j, i);
  point((20+i)*3,i+i*10);
  point(10+i,(i/4)+(j+40)/i);
  }
}



