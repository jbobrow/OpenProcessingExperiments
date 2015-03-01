
float rotation=0;

void setup(){

size(500,500,P3D);





}

void draw(){ background(0)

translate(250,250,0);

noStroke();

fill(237,232,7);

sphere(100);

fill(237,232,7);

rotateY(rotation);

translate(150,10,0);

fill(0,0,255);

sphere(20);

rotation=rotation+0.05
}
