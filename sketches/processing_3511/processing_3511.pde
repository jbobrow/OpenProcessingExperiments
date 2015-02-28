
int w,h,x,y;float c;void setup(){w=800;h=100;size(w,h);}void draw(){y=(int)map(sin(c),-1,1,0,h);x=(int)map(sin(c),-1,1,0,w);copy(x,y,w,1,-100,y,w+200,1);stroke(c*100%255);line(w-x,0,w-x,h);c+=0.01;}

