
float y = 0;
float x = 0;

void setup(){
  size(300,300,P3D);
  smooth();  
}

void draw(){
  background(255);
  translate(150,150,0);
  rotateY(y+=0.83);
  pushMatrix();
  strokeWeight(5);
  fill(255,0,0);
  rotateX(x+=0.004);
  sphere(100);
  noFill();
   strokeWeight(5);
   popMatrix();
   box(150);
}
