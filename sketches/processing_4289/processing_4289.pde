
int w=255,j,i,p,z;float x,y,d,t;void draw(){p++;for(j=0;j<w;j++,y=-1+2.0*j/w)for(i=0;i<w;i++,x=-1+2.0*i/w,d=sqrt(x*x+y*y),t=(3-sqrt(4-5*d*d))/(d*d+1)*w,z=int(y*t+p)^int(x*t+p))set(i,j,color(z&w));}

