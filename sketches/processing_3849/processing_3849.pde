
int w=99,i,f,u;int[]x=new int[w],y=new int[w];void draw(){fill(255,10);rect(0,0,w,w);if(f++>w)for(i=f=0,u=int(random(w*w));++i<w;x[i]=u%w)y[i]=u/w;for(i=0;++i<w;x[i]+=random(9)-4,y[i]+=random(9)-4)point(x[i],y[i]);}

