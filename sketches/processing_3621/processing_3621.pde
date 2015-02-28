
int w=255,x,y,u,v,q,r,s;void setup(){size(w,w,P2D);}void draw(){s++;for(y=0;y<w;q=y++-w/2)for(x=0;x<w;v=int(w*atan2(q,r=x-w/2)/PI),u=int(w*32/sqrt(r*r+q*q)))set(x++,y,color((u+s+v^u*2-v)&w,0,0));}

