
int i,x,y,w=256,b;void draw(){if((i++%2222)<1)for(y=0;y<w;y++)for(x=0;x<w;x++)set(x,y,(int)random(0xFCFCFC));filter(BLUR);b=4;blend(0,0,w,w,b,b,w-1-b-b,w-1-b-b,512);filter(DILATE);filter(ERODE);}

