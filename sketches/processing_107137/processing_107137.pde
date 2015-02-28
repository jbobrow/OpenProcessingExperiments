
int i=0,s=256;void setup(){colorMode(3);size(s,s);}void draw(){while(++i%s>0){fill(i*i>>(int)cos(i*.01));rect(PI*i%s,0,i*i%s,PI*i%s);}}//#P5
