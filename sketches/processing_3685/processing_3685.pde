
int w=512,L,U,I,S;void setup(){size(w,w,P2D);}void draw(){float a=0,b=0,c=I,d=I++*.02,e=sin(d),f=e++*-cos(d);for(U=0;U++<w;a=d+=f,b=c+=-e)for(L=0;L<w;S=int(a+=e))set(L++,U,(S*w+int(b+=f)^S)&255);}

