
float a=5;float b=10;float c=9;void setup(){size(600,600,P3D);background(0);}void draw(){translate(10+a*10,550-c*2,c);rotateZ(a*0.7);stroke(99+c,b,a,9);fill(a,1);box(a*3);a+=0.01;b+=0.5;c+=0.05;}

