
int j,d=200;float a,i,k=0;void setup(){size(d,d,P3D);i=0.01;}void draw(){lights();noStroke();k=sin(a);fill(255*cos(a),255*k,255*k);background(255);translate(d/4,d/4);sphere(k*d/2);a+=i;filter(15,5);}

