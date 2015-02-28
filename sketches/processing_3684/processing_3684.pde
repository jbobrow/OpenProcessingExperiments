
int w;float a,b,c,d;void setup(){w=255;size(w,w);smooth();}void draw(){stroke(0,r()*10);fill(w,0);c=a+r();d=b+r();curve(a,b,a+9,b-9,c+9,d-9,c,d);a=abs(c)%w;b=abs(d)%w;}float r(){return random(-9,9);}


