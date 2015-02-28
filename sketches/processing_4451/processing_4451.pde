
float a=0;void setup(){size(600,600,P3D);}void draw(){translate(300+tan(a)*99,300+tan(a)*99);strokeWeight(9);rotateY(sin(a));stroke(255,184,41,30);rotateX(tan(a));fill(0,200);box(200-a);a+=.05;}

