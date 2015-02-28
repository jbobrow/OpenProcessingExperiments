
float a;
float b;
float c;
float d;
float e;

void setup() {size(1000,1000, P3D);}

void draw() {
background(0);
frameRate(30);
noStroke();
lightSpecular(192, 192, 192);
directionalLight(204, 204, 204, 0, 0, -1);
b = 500;
e = 0;
d = 0; 
translate(300,700);
specular(128, 128-d, 128-d);
sphere(b/2);
branch(b);}

void branch(float h) {
if (h > 50) {
d += 0.00001;
h = h*0.5;



pushMatrix();
translate(h+h/2,0,0);
fill(255-d,255-d,d);
sphere(h/2);
branch(h);
popMatrix();

pushMatrix();
translate(0, -h-h/2,0);
fill(d,255-d,255-d);
sphere(h/2);
branch(h);
popMatrix();

pushMatrix();
translate(0, 0, h+h/2);
fill(d,255-d,255-d);
sphere(h/2);
branch(h);
popMatrix();

pushMatrix();
translate(0, 0, -h-h/2);
fill(255-d,d,d);
sphere(h/2);
branch(h);
popMatrix();

}}
