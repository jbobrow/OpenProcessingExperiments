
float m=99,o,i,a;void setup(){size(198,198,P3D);}void draw(){translate(m,m);rotateX(o+=.04*PI);rotateY(o/7);i=0;beginShape();while(i++<3*m){a=25*sin(i/(3*m))*sin(i/m);vertex(a,a,i*.2-m);}endShape();}

