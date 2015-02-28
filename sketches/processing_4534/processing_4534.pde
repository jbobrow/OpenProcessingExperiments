
int d=300;float x,y,z,a=0;void setup(){size(d,d,P3D);}void draw(){x=noise(a);y=noise(a,a);z=noise(a,a,a);lights();fill(255*x,10*y,255*z);noStroke();translate(d*x,d*y);sphere(50+z*50);a+=0.007;}

