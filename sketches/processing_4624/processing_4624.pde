
int w=500;float h=4E-2,x,y=.1;void draw(){smooth();noStroke();x+=h*y;y+=h*(5*(y-x*x*y)-x);fill(0,5);rect(0,0,w,w);fill(0,map(y,-8,8,0,255),0);ellipse(w/2,w/2,map(x,-3,3,0,w),map(y,-8,8,0,w));}

