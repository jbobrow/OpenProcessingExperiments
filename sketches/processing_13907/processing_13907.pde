
int w=200;
void setup(){size(200,200);}
void draw(){for(int i=0;i<w;i++){set(i%w,0,color(r(255),r(255),r(255)));}for(int i=0;i<w;i++){set(0,i/w,color(r(255),r(255),r(255)));}for(int i=0; i<w*w;i++){set(i%w,i/w,get((i%w)>>r(cos(mouseX*.005-w)*r(4)),(i/w)>>r(sin(mouseY*.0005-w)*r(3))));}}
int r(float n){return int(random(n));}

