
int w = 256;int t = 0;
void setup(){size(256,256);}
void draw(){for(int y=0;y<w;++y)for(int x=0;x<w;++x){float n=t+noise(x*.01,y*.02,t*.1)*50;set(x,y,color(((int)(x-n)^(int)(y+n))&255));}t++;}



