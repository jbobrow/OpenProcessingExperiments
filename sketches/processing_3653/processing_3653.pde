
float x,y,z,u,v,w,r=0.02,f=.93;void draw(){smooth();x+=u+=(mouseX-x)*r;y+=v+=(mouseY-y)*r;z+=w+=atan2(v,u)*r;u*=f;v*=f;w*=f;fill(255,u*u+v*v);translate(x,y);rotate(z);ellipse(0,0,u*5,v*5);}

