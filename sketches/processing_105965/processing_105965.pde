
//3d basics
//you can work with light and cameras

void setup (){
  size (500, 500, P3D);
  smooth();
}

void draw(){
  background (200, 100, 0);
  translate (width/2, height/2, 0);
  float mov = map(mouseX, 0, width/2, 0, 1);
  
  rotateX(mov); rotateY(mov);
  rotateZ(mov);
  fill(45, 34, 67, 35);
  //noStroke();
  
  //box
  //box(100, 200, 50);
  
  //Sphere
  
  lights(); //see processing.org for details about lighting
  sphereDetail(mouseX/8); //default 30, be careful. the more detail added the more memory needed to render.
  sphere(100);
}
