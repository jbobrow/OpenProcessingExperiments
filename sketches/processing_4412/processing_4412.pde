
float a=0;void setup(){size(600,600,P3D);}void draw(){translate(300,300);strokeWeight(3);rotateY(cos(a));stroke(229,0,54,20);rotateZ(sin(a));fill(1,150);box(200-a*10);a+=0.005;if (a>20){a=20;}}

