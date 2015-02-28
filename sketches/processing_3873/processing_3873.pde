
int a=255;int u,i;float z;void setup(){size(a,a,P3D);}void draw(){noStroke();filter(11);for(i=0;i<a/5;i++)for(u=0;u<a/5;u++){z=random(1);fill(0,a,0);translate(0,0,z/a);ellipse(i*10,u*10,10*z,10*z);}}


