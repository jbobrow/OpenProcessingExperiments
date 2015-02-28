
int w=200,h=200;
void setup(){size(w,h);noFill();rect(0,0,30,30);}
void draw(){loadPixels();for(int i=0;i<w*h;i++){float m=random(i);stroke(pixels[(int)m]);point(m%w,m/h);}}


