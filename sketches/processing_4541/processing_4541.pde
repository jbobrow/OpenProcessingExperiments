
float a=0;void setup(){size(600,300,P3D);background(33,31,106);}void draw(){translate(a*80,200);strokeWeight(5);rotateX(sin(a));stroke(222,171,31,30);rotateY(cos(a));fill(70);box(150-a*6);a+=0.005;}

