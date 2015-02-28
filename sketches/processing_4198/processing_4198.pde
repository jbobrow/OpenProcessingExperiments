
float i,n;int w=500;void setup(){size(w,w);colorMode(HSB,1);}void draw(){loadPixels();for(i=1;i<w*w;i++){pixels[(int)i]=color(.06+sin(n)*.1,1-sin(3*i%w/w*PI)*sin(i/w/w*PI),.9);}updatePixels();n+=.03;}

