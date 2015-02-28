
float v,w;void setup(){size(400,400);}void draw(){fill(d(32,50),d(229,50),d(172,50),d(5,30));w=d(1,500);ellipse(200,200,w,w);v+=0.1;filter(11,6);}float d(float a,float m){return a+noise(v)*m;}

