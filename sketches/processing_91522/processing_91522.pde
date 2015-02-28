
/*
rubix cube in space
*/
float y1=0;
float x1=0;
float y2=0;
float x2=0;

void setup(){
  size(300,300,P3D);
  smooth();
}
  
void draw(){
  background(255);
translate(150,150,0);

//sphere
pushMatrix();
strokeWeight(1);
fill(255,0,0);
rotateY(y1+=0.03);
rotateX(x1+=0.04);
sphere(350);
popMatrix();
fill(55);

//box
fill(255);
strokeWeight(5);
rotateY(y2-=0.03);
rotateX(x2-=0.004);
box(50);

}
