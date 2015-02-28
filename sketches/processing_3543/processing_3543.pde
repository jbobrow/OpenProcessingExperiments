
float a;int h,i;void setup(){size(508,508,P3D);i=508;}void draw(){h++;translate(i/2,i);beginShape();a=random(-h,h);fill(h/2);vertex(a,0,-h);vertex(a/4,-h,-h);vertex(-a,0,-h);endShape();if(h>i)h=0;}

