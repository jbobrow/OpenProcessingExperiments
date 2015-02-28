
float x= 0;
float y= 0;

void setup(){
  size(500,300,P3D);
smooth();
}

  void draw(){
background(255);
translate(150,150,0);

//SPHERE
rotateY(y+=0.03);
pushMatrix();
strokeWeight(1);
fill(255,0,0);
rotateX(x+=0.004);
sphere(300);

//BOX
fill(0,0,250);
strokeWeight(5);
popMatrix();
fill(0,230,0);
box(100);
}
