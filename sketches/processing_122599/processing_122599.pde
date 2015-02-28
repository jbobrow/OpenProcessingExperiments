
int[]r,g,b;
int i;
void setup()
{
r=new int[450];
b=new int[450];
g=new int[450];
size(450,450);
frameRate(100);
}

void draw()
{
background(255);
  for(int a=0;a<450;++a)
  {
    for(int i=0;i<450;++i)
     {
      r[i]=int(random(256));
      g[i]=int(random(256));
      b[i]=int(random(256));
     stroke(r[i],b[i],g[i]);
     }
   strokeWeight(0.05);
   smooth();
   line(mouseX,mouseY,225+225*sin(a*2),450);
   }
}


