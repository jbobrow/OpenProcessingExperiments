
int w=512,c;float x,y,r,v;void draw(){smooth();translate(x,y);rotate(r);ellipse(0,0,v*8,v*4);c=keyCode;v+=c==38?.1:c==40?-.1:0;r+=c==39?.1:c==37?-.1:0;x=(x+v*cos(r)+w)%w;y=(y+v*sin(r)+w)%w;v*=.99;}

