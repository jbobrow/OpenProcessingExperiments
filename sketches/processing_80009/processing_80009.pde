
float a=0;
void setup(){
size(600,600,P3D);
}
void draw(){translate(330,300);
strokeWeight(3);
rotateY(cos(a));
stroke(12,random(100),random(200),80);
rotateZ(sin(a));
fill(1,15);
box(370-a*20);
a+=0.05;
if (a>60){
  box(35-a*-20);
  box(35-a*20);
a+=0.05;
}
}


