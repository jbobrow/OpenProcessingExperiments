
int W=600,H=100,x,y,z,Y,u,v,s,Q=8192,S=Q*Q*2/W;void setup(){size(W,H,P2D);}void draw(){Y+=Q;for(y=0;y<H;y++)for(z=y+1,u=-Q*Q/z,v=Y-u,s=S/z,x=0;x<W;u+=s,x++)set(x,y,(u>>12^v>>12)&255);}


