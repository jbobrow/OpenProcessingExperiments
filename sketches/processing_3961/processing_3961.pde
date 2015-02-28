
float a,c=0;int d=480;void setup(){size(d,d,P3D);colorMode(1,1);}void draw(){c=noise(a);ambientLight(c,c,c);noStroke();translate(d/2,d/2);rotateY(a);rotateX(a);rotateZ(a); box(200);a+=0.01;}

