
int i,w=480,h=320,m=w/2; float p,g,x,y,z;
void setup(){size(w,h);}
void draw()
{background(200,222,255);p+=.005;
 for(x=0;x++<w;)
 {y=0;
  for(i=5;i-->0;)
  {noiseDetail(14-i*2); 
    g=200-i*33;
   stroke(g-i*22, g, g-i*33);
   z=h-(noise(33*i+p+x/m)*(h-90*i));
   if(y>0&&z<y)line(x,y,x,z);y=z;
}}}


