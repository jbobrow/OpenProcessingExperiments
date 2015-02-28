

int x =0;
void setup()
{
  size(450, 400, OPENGL);
  smooth();
}

void draw()
{
  background(0); // reset the display window
  camera(width/2, height/2+50, 400, width/2, height/2, 50, 0, 1, 0); //Modified from P3D reference page
  lights();
  directionalLight(200, 200, 200, 200, -1, 0);
  noStroke();
  
 
  fill(#FFFFFF);
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(radians(45));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(100);
  popMatrix();
  
  fill(#DC4437);
  pushMatrix();
  translate(width/2, height/2+70, -70);
  rotateX(radians(45));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(100);
  popMatrix();
  
  fill(#4385F5);
  pushMatrix();
  translate(width/2-70, height/2-50, -50);
  rotateX(radians(45));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(100);
  popMatrix();
  
  fill(#109D59);
  pushMatrix();
  translate(width/2+70, height/2-50, -50);
  rotateX(radians(45));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(100);
  popMatrix();
  
  fill(#DC4437);
  pushMatrix();
  translate(width/2, height/2-170, -50);
  rotateX(radians(45));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(50);
  popMatrix();
  
  fill(#109D59);
  pushMatrix();
  translate(width/2-140, height/2+60, -80);
  rotateX(radians(45));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(50);
  popMatrix();
  
  fill(#4385F5);
  pushMatrix();
  translate(width/2+140, height/2+60, -80);
  rotateX(radians(45));
  //rotateY(radians(0));
  rotateZ(radians(45));
  box(50);
  popMatrix();
}

void mousePressed()
{
  x += 5;
  println(x);
  //kSize = 80;
  //sSize = 80;
  //hSize = 80;
}



