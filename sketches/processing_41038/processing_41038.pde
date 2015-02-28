
void setup() {
  size(450, 450, P3D);
  noStroke();
  textSize(5);
  background(0);
}


void draw() {
  directionalLight(25, 150, 175, 0, 1, -1);
  //=======Drawing the Prisms, order by Quadrants!=====
  pushMatrix();
  directionalLight(50,200,115, 1,2,0);
  translate(width/2+45, height/2-45,0);
  rotateY(.05);
  rotateX(.25);
  box(10,10,250);
  popMatrix();
  pushMatrix();
  directionalLight(50,200,115, -1,2,0);
  translate(width/2-45, height/2-45,0);
  rotateY(-.05);
  rotateX(.25);
  box(10,10,250);
  popMatrix();
  pushMatrix();
  directionalLight(50,200,115, -1,20,0);
  translate(width/2-45, height/2+45,0);
  rotateY(-.05);
  rotateX(-.25);
  box(10,10,250);
  popMatrix();
  pushMatrix();
  directionalLight(50,200,115, 1,20,0);
  translate(width/2+45, height/2+45,0);
  rotateY(.05);
  rotateX(-.25);
  box(10,10,250);
  popMatrix();
  //=======Sphere========
  pushMatrix();
  translate(width/2, height/2, 0);
  sphere(50);
  popMatrix();
  //========Shapes for Depth?========
  pushMatrix();
  triangle(width,height, width/2,3*height/4, 0, height);
  popMatrix();
  //=======Add Some Text======
  pushMatrix();
  rotateY(-1);
  translate(0, height/2,0);
  text("risensiren");
  popMatrix();
  pushMatrix();
  rotateX(.1);
  rotateY(1);
  translate(width/2,height/2,0);
  text("symmetryimagery");
  popMatrix();
  
}


