
int w=900;float i,a,b,r;void setup(){size(w,128);background(0);smooth();}void draw(){i=i++;r=random(-1,1);b=r+b;stroke(190,190+b,0,9);for(int c=0;c<w;c++)
{a=64+64*r*sin(b+b*c*2*PI/w);point(c%w,a);}}

