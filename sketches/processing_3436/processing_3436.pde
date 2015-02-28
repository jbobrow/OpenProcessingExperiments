
int w=500,t=0,c=w/2;void setup(){size(w,w);background(0);noStroke();}void draw(){for(float r=c;r>0;r-=.3){float a=r*(t+mouseX*27)*.001;ellipse(c+cos(a)*r,c+sin(a)*r,2,2);}filter(11);filter(17);t++;}

