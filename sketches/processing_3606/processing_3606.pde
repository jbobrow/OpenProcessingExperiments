
float o,t=320;void setup(){size(640,640,P3D);}void draw(){background(0);fill(0,0,t);lights();noStroke();translate(t,t,t*.8);rotateX(o+=.01);for(float i=0;i<3;i+=.2){rotateX(i+o);rotateY(i);box(-t);}}

