
float r=150,c=10,m=0,n=50;int s=500;void setup(){size(s,s);}void draw(){loadPixels();for(int i=0;i++<s*s-1;){r=sin(r)*c+1;pixels[i]=color(c,m,r*c);}updatePixels();c=sin(c)*n+100;m=mouseX/2;n=mouseY;}

