
//Jun Min Z, Loops, CP1, Mods 16-17
size(1000,1000);
background(165,27,27);
noFill();
smooth();

stroke(0);
int y=0;
while(y<801)
{
  
  ellipse(500,500,200,y);
  y=y+15;
  
}

stroke(0);
int x=0;
int w=0;
while(x<551)
{
  
  ellipse(500,500,x,w);
  x=x+10;
  w=w+15;
  
}

stroke(0);
int z=0;
while(z<200)
{
  
  ellipse(500,500,z,z);
  z=z+3;
  
}

strokeWeight(8);
ellipse(500,500,550,825);

fill(0);
ellipse(500,500,50,50);
