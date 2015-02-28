
int z,x;int a=99;void setup(){size(a*2,a*2,P3D);}void draw(){background(a);translate(a,a,z++);for(x=0;x<a*10;x++){fill(x);ellipse(x*sin(x),x*cos(x),9,9);point(x*cos(x),x*sin(x));translate(0,0,-x/9);}}
 


