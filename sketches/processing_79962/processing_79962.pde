
float a=0;

void setup(){
  size(600,600,P3D);
}
void draw(){
  background(0);
  translate(330,300);
  strokeWeight(3);
  rotateY(cos(a));
  stroke(2,18,200,39);
  rotateZ(sin(a));
  fill(1,15);
  box(350-a*5);
  a+=0.005;
  if (a>20){a=20;}
}
