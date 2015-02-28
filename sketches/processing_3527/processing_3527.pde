
float i,w=99,c,d,f,x,y;void draw(){colorMode(HSB,w);i++;for(x=0;x<w;x++){for(y=0;y<w;y++){d=dist(x,y,0,0);f=dist(x,y,9,0);c=sin(d/9)*sin(f/9)*w+i;while(c>w)c-=w;stroke(c,w,w);point(x,y);}}}

