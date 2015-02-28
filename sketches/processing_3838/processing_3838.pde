
float m=150,z,t,a=1;void setup(){size(300,300,P3D);noStroke();background(0);}void draw(){a+=0.1*random(1);z=sin(a);t=cos(a);directionalLight(m*z,m*t,m,z,t,-1);translate(m,m,0);sphere(70);}

