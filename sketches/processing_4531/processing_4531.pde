
float a,x,y,u,v,s=.1,t=7;int h=255,c=127,X;void setup(){size(h,h);}void draw(){stroke(X,t);a+=random(-s,s);x=(x+1)%h;if(x<1){y=(y+t)%h;X^=h;}u=cos(a)*t;v=sin(a)*t;line(x,y,x+u,y+v);line(c,c,c+u,c+v);}

