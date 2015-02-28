
float a;int c,_=200;void setup(){size(_,_);colorMode(HSB,_);}void draw(){background(c++%_,99,_);fill((c+30)%_,99,_);for(int i=0;i<24;i++){ellipse(99+4*i*cos(i*a),99+4*i*sin(i*a),25,25);a+=.0001;}}

