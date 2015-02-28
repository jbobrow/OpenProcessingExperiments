
int w=512;float x,y,z,r,v;void draw(){smooth();translate(x,y);rotate(r);ellipse(0,0,v*8,v*4);v+=noise(x/99,y/99,z)-.5;r+=noise(x/99,y/99,z+9)-.5;z+=.1;x=(x+v*cos(r)+w)%w;y=(y+v*sin(r)+w)%w;v*=.99;}

