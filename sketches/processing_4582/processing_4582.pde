
float a=0;void setup(){size(600,600,P3D);background(0);}void draw(){translate(300,300-a);rotateY(a);stroke(255,a,9,9);rotateY(a*10);fill(a,a);box(5-a,50+a,a);a+=0.1;if(a>85){a=-a*2;}}

