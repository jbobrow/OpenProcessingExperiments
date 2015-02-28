
/* Do some crazy stuff!
*/
float y =0;
float x=0;
float y2 =0;
float x2=0;

void setup(){
size(300,300, P3D);
smooth();
}

void draw(){
  background(255);
  translate(150,150,0);
  
//SPHERE
  pushMatrix();
  rotateY(y+=0.03);
  rotateX(x+=0.004);
  noFill();
  strokeWeight(1);
  fill(123,56,208);
  sphere(250);
  popMatrix();
  
//BOX
rotateY(y2-=0.03);
rotateX(x2-=0.004);
  strokeWeight(5);
  fill(random(255),random(255),random(255));
  box(50);
  
  
}
