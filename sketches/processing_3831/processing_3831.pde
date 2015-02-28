
int w=792,z=99;void setup(){background(0);size(w,w);}void draw(){noStroke();fill(r(w),r(w),0,9);rotate(r(.04));rect(i(),i(),z,z);}
float r(float a){return random(-a,a);}float i(){return int(r(8))*z;}

