
int w=400,j=w/2;
float n=1;
void setup() { size(400,400); }
void draw(){smooth();for(int i=1;i<999;++i){float t=i*.01,r=j*sin((n+mouseX*100/w)*t);ellipse(j+cos(t)*r,j+sin(t)*r,8,8);}n += .001;filter(11);filter(17);}


