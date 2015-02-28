
float n,r; int x,w=640,h=480;
void setup()
{size(640,480); strokeWeight(4);}
void draw()
{copy(0,2,w,h,0,0,w,h); n+=0.2;
 for(x=0; x<w; x+=2)
 {r=noise(x*0.01, n);
  stroke(88,55+180*r,88);
  line (x,h-r*66,x,h);
}}


