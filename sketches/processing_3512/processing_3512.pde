
float h=256,t,T,x,y;void draw(){t+=x=.3-mouseY/h/5;T+=mouseX/h*x-x;noStroke();for(y=0;++y<h;){fill(h-y,85);rect(0,h+y,h*2,1);x=h/y+t;fill(x%20*9,85);x=T+noise(x/99)*60-30;rect(h-x*y-2*y,h+y,y*4,1);}}

