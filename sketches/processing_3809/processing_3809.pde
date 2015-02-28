
float a=20f;int y,w=400,m=20;void setup(){size(400,400,P3D);}void draw(){background(255);a+=.001;for(y=1;y<w;y++){translate(420+y/m,50+y/m,-a);rotateZ(a);fill(100);stroke(100);ellipse(-m,y-m,m,m);}} 

