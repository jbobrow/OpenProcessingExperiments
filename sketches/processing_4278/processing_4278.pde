
int f,i,r,m,w=64,x=230,y=x;void draw(){f++;for(i=0;i++<9999;r+=random(9)-r)
if(f<2){r&=4;rect(i%w*8+i/w%2*4-4+r,i/w*4-r,8-r*2,r*2);}else
if(red(get(w=x+r/3-1,m=y+r%3-1))>99)set(x=w,y=m,-f%39999*151);}

