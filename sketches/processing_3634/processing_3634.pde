
int i,j,b,a=512;void setup(){size(a,a);b=a;noStroke();}void draw(){for(i=0;i++<b/5;){for(j=0;j++<b/20;){fill(sin(a++)*b,sin(a++)*b,sin(a++)*b);rect(i*5-4,j*15-10,5,10*(j*sin(a++)));}}}

