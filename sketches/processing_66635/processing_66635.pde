
int w=750,sx=0,x,y,z;void setup(){size(w,w,P2D);} void draw(){for(background(y=0);y++<w;)for(x=0;x++<w;)set(y,x,~get(x&mouseX,y&mouseY));}

