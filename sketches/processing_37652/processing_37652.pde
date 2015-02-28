
float x,y,z,f=.01;int u=4,v=50,w=500;void draw(){stroke(0,v);smooth();line(x,y,x+(z=noise((x+=u)*f,(y+=x>w?(x-=w+u)+u:0)*f)*v),y+z);}



