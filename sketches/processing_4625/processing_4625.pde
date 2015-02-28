
float w=500,h=1E-1,x,y,t;void draw(){smooth();noStroke();x+=h*y;y+=h*(-.2*y+x-x*x*x+map(mouseY,0,w,0,.5)*cos(t));t+=h;fill(0,5);rect(0,0,w,w);fill(-1);ellipse(map(x,-2,2,0,w),map(y,-2,2,0,w),10,10);}

