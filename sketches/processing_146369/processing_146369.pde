

int mainRotate = 0;
int smallRotate = 0;
float kSize = 100;
void setup()
{
  size(450, 400, OPENGL);
  smooth();
}

void draw()
{
  background(0); // reset the display window
 // camera(width/2, height/2+50, 400, width/2, height/2, 50, 0, 1, 0); //Modified from P3D reference page
  lights();
  directionalLight(200, 200, 200, 200, -1, 0);
  noStroke();
  
  pushMatrix();
  translate(width/2,height/2,0);
  rotateZ(radians(mainRotate));
  rotateX(radians(5));
  
 
  fill(#FFFFFF);
  pushMatrix();
  //translate(width/2, height/2, 0);
  rotateX(radians(50));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(kSize);
  popMatrix();
  
  fill(#DC4437);
  pushMatrix();
  translate(0, 0+70, -70);
  rotateX(radians(50));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(kSize);
  popMatrix();
  
  //blueB
  fill(#4385F5);
  pushMatrix();
  translate(0-70, 0-45, -55);
  rotateX(radians(50));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(kSize);
  popMatrix();
  
  
  //greenB
  fill(#109D59);
  pushMatrix();
  translate(70,-45, -55);
  rotateX(radians(50));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(kSize);
  popMatrix();
  
  
  //redS
  fill(#DC4437);
  pushMatrix();
  translate(0, -150, -50);
  rotateX(radians(50));
  rotateY(radians(-smallRotate));
  rotateZ(radians(45));
  //rotateZ(radians(-x));
  box(50);
  popMatrix();
  
  fill(#109D59);
  pushMatrix();
  translate(-125, 65, -55);
  rotateX(radians(50));
  //rotateY(radians(0));
  rotateZ(radians(45));
  rotateZ(radians(-smallRotate));
  box(50);
  popMatrix();
  
  //BlueS
  fill(#4385F5);
  pushMatrix();
  translate(125, 65, -55);
  rotateX(radians(50-smallRotate/2));
  rotateY(radians(-smallRotate/2));
  rotateZ(radians(45));
 // rotateZ(radians(-x));
  box(50);
  popMatrix();
  popMatrix();
   mainRotate += 2;
   smallRotate += 3;
   //kSize = kSize*0.9999;
   kSize = constrain(kSize * 1.02, 75, 99);
}

void mousePressed()
{
  kSize = 75;
}


