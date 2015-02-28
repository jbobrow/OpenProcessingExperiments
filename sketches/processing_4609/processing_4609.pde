
int i,d,w=300,a[]={2,3*w,-4,-w};void setup(){size(w,w);}void draw(){filter(11);loadPixels();for(i=w;++i<w*(w-3);d=abs(i%w/3-i/w^i%w/3+i/w)){d=(d%56+d%71)%4;pixels[i]=pixels[i+a[d]]-d;}updatePixels();}

