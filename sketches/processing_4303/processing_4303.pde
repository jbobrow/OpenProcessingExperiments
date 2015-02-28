
float a=0;void setup(){size(600,600,P3D);}void draw(){noFill();strokeWeight(2);stroke(a-900,a,a*9,20);rotateY(20);sphere(a-50);fill(10,10);stroke(20,30,40,10);sphere(a-75);filter(BLUR,0.6);a+=1;}

