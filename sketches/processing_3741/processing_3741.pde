
int W=512,x,y;float X,Y,R,c,s;void setup(){size(W,W,P2D);}void draw(){X+=c=cos(R);Y+=s=sin(R+=.01);for(y=0;++y<W;)for(x=0;x<W;)set(x++,y,~int(X+W*9/y*(c-s+x*s*2/W))&int(Y+W*9/y*(s+c-x*c*2/W))&255);}

