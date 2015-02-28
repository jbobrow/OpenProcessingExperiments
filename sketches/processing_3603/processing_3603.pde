
float o,t=320;void setup(){size(640,640,P3D);}void draw(){background(0);lights();translate(t,t,0);rotateX(o+=.01);rotateY(o);for(float i=0;i<3;i+=.1){fill(t,0,0);rotateX(i+.1*o);rotateY(i);box(t);}}

