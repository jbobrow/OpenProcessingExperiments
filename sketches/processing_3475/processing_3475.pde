
int x,y,w,h,i;float d=.01;void setup(){size(w=450,h=150,P2D);}void draw(){for(y=h;--y>=0;)for(x=w;--x>=0;){set(x,y,sin(i*d*d+dist(x,y,mouseX,mouseY)/4*noise(x*d,y*d+d*d*d*i--))>.5?0xffffff:0);}}

