
float d=127,f=0;void setup(){size(256,256,P3D);}void draw(){float e=cos(2*PI*(f+=1)/d);background(0);stroke(0);strokeWeight(18+10*e);float a=mouseX,b=mouseY;translate(a,b,-d/1.1-d*e);sphere(d);}

