
size(600,600);
background(14,16,16);
smooth();
  
int hrzn=width/2;

for(int i=0; i<=width; i +=20)
{
  for(int j=100; j<=height-50; j +=3)
  {
  stroke (255-j,.1*j,0);
  line (i/4, i+(j*10), i,(j-20)+i);
}
}


