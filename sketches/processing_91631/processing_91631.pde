
float y =0;
float x = 0;
void setup(){
  size(300,300,P3D);
  smooth();
}
 

void draw(){
 
  background(10,10,0);
 translate(150,150,0);
 rotateY(y+=0.002);
 pushMatrix();
 rotateX(x+=0.04);
 fill(29,10,206);
 strokeWeight(3);
 stroke(250,83,5);
 sphere(100);
 popMatrix();
 fill(29,10,206);
 strokeWeight(10);
 stroke(250,83,5);
 box(150);
 rotateX(x+=0.03);
 box(150);
 rotateY(y+=0.02);
 box(150);

}
