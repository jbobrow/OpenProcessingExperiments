
size(800,200);
smooth();

int eSize = 80;

for(int i =eSize/2; i<width; i=i+80)
{
  ellipse(i, height/2,  80,80);
}

fill(#727272);
for(int i = 40; i<width; i=i+80)
{
  ellipse(i, height/2,  50,30);
}

