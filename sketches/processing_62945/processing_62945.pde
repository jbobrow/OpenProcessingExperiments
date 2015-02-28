
size(600, 600);
smooth();
background(0);
stroke(255);

for(int i=22; i<width/4; i+=5)
{
  for(int j=2; j<width; j+=6){
  stroke(234, i, j);
  line(i, i, 600, i*10);
  }
}


