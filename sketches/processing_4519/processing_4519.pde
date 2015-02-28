
int d=300;float a=0;void setup(){size(d,d,P3D);}void draw(){lights();noStroke();translate(d*noise(a),d*noise(a,a),-d*noise(a,a,a));sphere(50+noise(a)*50);a+=0.007;}

