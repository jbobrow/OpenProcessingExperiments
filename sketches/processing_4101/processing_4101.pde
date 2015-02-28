
float a=0;float b=0;void setup(){size(600,600,P3D);background(0);}void draw(){stroke(200-a,a,a);translate(300,300,a);sphere(100);fill(a,a,a,a);rotateZ(a);box(b);a+=0.1;b+=0.1;if (a>50){a=0;}}

