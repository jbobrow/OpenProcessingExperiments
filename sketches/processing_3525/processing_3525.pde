
int w=500,t=0,c=w/2;void setup(){background(0);}void draw(){stroke(t%256);for(float r=c*1.3;r>0;r-=.1){float a=r*(t+mouseX*270)*.0001;point(c+cos(a)*r*sin(r),c+sin(a)*r*sin(r));}filter(11);t++;}


