
float s=0,t=0;int w=255,i=0;void setup(){smooth();}void draw(){s=0;i=-1;while(++i<w){set(i,int(noise(s,t)*w/2+min(mouseY,w)),-1);s+=.01;}t+=.007;copy(0,0,w,w,-1,-1,w+2,w+2);}

