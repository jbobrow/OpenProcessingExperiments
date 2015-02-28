
size(600,600);
background(14,16,16);
smooth();
  
int hrzn=width/2;

for(int i=4; i<=hrzn; i +=10)
{
  for(int j=4; j<=hrzn; j +=10)
  {
  fill(240-i, 20);
  stroke (40, 70);
  quad (i+400,j, width/4, height/4,  width, height,  i,j+400);
}
}


