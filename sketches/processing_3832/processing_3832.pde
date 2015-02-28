
int i,w=500,h=500;void setup(){size(w,h);}void draw(){loadPixels();int[] p=pixels;for(i=w;i<w*h-w;i++){p[i]=(p[i+w]+p[i-w]+p[i+1]+p[i-1])/4;}updatePixels();rect(random(w),random(h),9,9);filter(11);}

