
float a=0;void setup(){size(600,600,P3D);background(0);}void draw(){translate(300,300);strokeWeight(9);rotateY(cos(a));stroke(108,232,202,9);sphere(99);rotateX(sin(a));fill(9,50);sphere(200);a+=.01;}

