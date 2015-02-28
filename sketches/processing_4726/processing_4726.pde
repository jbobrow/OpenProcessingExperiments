
int w=500;float h=1E-2,x,y=.1,X;void setup(){size(w,w,P2D);smooth();noStroke();}void draw(){x+=h*y;y+=h*(5*(y-x*x*y)-x);fill(0,1);rect(0,0,w,w);fill((X=map(x,-3,3,255,0))+map(abs(y),0,8,255,0),X,0);ellipse(w/2,w/2,X=map(x,-2,3,0,w),X);}

