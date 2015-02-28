
size(600, 600);
smooth();
background(0);
stroke(255);

for(int i=15; i<width; i+=10)
{
  for(int j=9; j<200; j+=12){
  point(i+j*3, 15+(j/i)*8);
  }
}


