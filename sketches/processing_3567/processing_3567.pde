
int i,x,y,w=255;void setup(){size(w,w);fill(0,0);}void draw(){x=mouseX;y=mouseY;background(x);stroke(~x&w,163);translate(w/2,w/2);for(i=0;i<y;i++,rotate(y*PI/w),scale(.9))rect(-w/2,-w/2,w,w);}

