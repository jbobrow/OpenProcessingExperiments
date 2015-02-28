
int f,i,r,x=98,y=99,w=64,m;void draw(){f++;for(i=0;i++<4096;r+=random(4)-r)
if(f<2){m=r/2*8;rect(i%w*8,i/w*8,m,8-m);
}else{w=x+r%2*(r++%4/2*2-1);m=y+r%2*(r%4/2*2-1);
if(get(w,m)%8<0)set(x=w,y=m,-1);}}

