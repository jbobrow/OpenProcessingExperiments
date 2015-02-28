
/*
 do some crazy stuff
 */ 
float y =0;
float x = 0;
void setup(){
  size(300,300,P3D);
  smooth();
}

void draw(){
  background(255);
 translate(150,150,0);
 rotateY(y+=0.03); 
 pushMatrix();
 rotateX(x+=0.004);
 fill(255,24,3);
 strokeWeight(15);
 sphere(300);
 popMatrix();
 fill(250,0,38);
 strokeWeight(25);
 stroke(0,250,56);
 box(50);
