
int W=300,H=100,x,y,Y;void draw(){for(Y++,y=-H;y<H;y++)for(x=-W;x<W;){float z=abs(y),n=noise(W+x/z,Y/1e2+(W+y)/z,millis()/1e4);set(W+x++,H+y,color(n*(y<0?2.5:.4)*z,n*z*z/55,n*(y<0?.2:2.5)*z));}}

