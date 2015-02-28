
float x,y,vx,vy,m;
int count = 0;
float rat = .2;
void setup()
{
 size(500,600);
 background(255);
 rect(0,0,500,600);
 x=250;y=300;vx=0;vy=0;m=70;}
 void draw()
{
  count=(count+1)%255;
  vx*=.98;
  vy*=.98;
  m=abs(m);
  stroke(count,255-count,random(0,255));
  m+=random(-.01,.01);
  ellipse(x,y,m,m);
  x=(vx+x+500)%500;
  y=(vy+y+600)%600;
  switch(key)
  {case 'w':  vy-=rat; break;
   case 'a': vx-=rat; break;
   case 's': vy+=rat; break;
   case 'd': vx+=rat; break;
   case 'q': m+=.5; break;
   case 'z': m-=.5; break;
   default: break;}
   vx+=rat*(cos(4*3.141592653589*(noise(x,y)-.5)))*50/m;
   vy+=rat*(sin(4*3.141592653589*(noise(x,y)-.5)))*50/m;

   }


