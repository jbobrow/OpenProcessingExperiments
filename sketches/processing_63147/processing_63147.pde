
size(600,600);
background(14,16,16);
smooth();
  
int hrzn=width/2;

for(int i=0; i<=width; i +=50)
{
  for(int j=100; j<=height-100; j +=2)
  {
  stroke (255,-.1*j,0, 70);
  line (i+(i/4), i-(j*10), i,(j-20)+i);
}
}


