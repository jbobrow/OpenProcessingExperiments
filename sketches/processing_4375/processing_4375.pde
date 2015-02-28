
int c,i,t,y; 
void setup(){size(256,256,P3D);} 
void draw(){lights();for(background(i=5);i++<4096;translate(y<1?-504:8,y<1?8:0),fill(c=int(900*noise(t+y))&int(900*noise(t+i/64))),box(2,2,c))y=i%64;t++;}

