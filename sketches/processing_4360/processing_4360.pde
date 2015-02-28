
float a=0;
void setup(){
size(600,600,P3D);
background(0);
}

void draw(){
translate(300+noise(a)*60,300+noise(a)*60);
strokeWeight(3);
rotateY(cos(a));
stroke(108,232,202,5);
rotateZ(sin(a));
fill(150,150);
sphere(150-a*9);
fill(1,150);
sphere(200-a*10);
a+=0.005;
if (a>20){
  a=19;
}
}

