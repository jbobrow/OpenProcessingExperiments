
float e,x,t;void setup(){size(600,600);smooth();noFill();}void draw(){background(-1);for(e=1;e<600;e/=.99){beginShape();for(;x<6;x+=.1,curveVertex(x*100,e+e*noise(x,t+e/60)/6));endShape();t+=x=1E-5;}}

