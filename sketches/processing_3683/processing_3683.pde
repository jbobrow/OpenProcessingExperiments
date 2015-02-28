
int p=255;void setup(){size(510,510);background(p);}void draw(){fill(0,0);float h=r();float g=random(2*PI);stroke(r()/4,3);bezier(p,p,sin(g)*p+p,cos(g)*p+p,p,p,r(),r());}float r(){return random(p*2);}

