
void draw(){float m=millis()*.0003,r=89*sin(m*5.1)*noise(m);stroke(255,80);if(m<1)background(0);point(49+r*sin(m),49+r*cos(m));}//#p5
