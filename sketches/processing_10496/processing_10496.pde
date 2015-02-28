
float x=0;

void setup(){
size(800,600, P3D);
}

void draw(){
background(255);
translate(width/2, height/2);
sphereDetail(20);
x+=.01;
if(mouseX > width/2)
x+=-.02;
pushMatrix();
rotateX(x);
fill(50,75);
sphere(100);
popMatrix();

pushMatrix();
scale(2);
rotateY(x);
fill(50,75);
sphere(100);
popMatrix();

pushMatrix();
scale(2.5);
rotateZ(x);
fill(50,75);
sphere(100);
popMatrix();
}

