

float rotation=0;

void setup(){

size(500,500,P3D);

background(255,0,255)

}

void draw(){

rotateX(rotation);

rotation=rotation+0.1

translate(250,250,0);

fill(mouseX,mouseY,0);

noStroke();

lights();

translate(58, 48, 0);

sphere(28);














}
