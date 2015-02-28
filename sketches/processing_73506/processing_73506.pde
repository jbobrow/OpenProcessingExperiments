
//Michelle Z, CP1 4-5, RotatingCubes

float rotateChange = 0;
int x = 0;
int x2 = 0;
int xChange = 5;
int xChange2 = 8;

void setup()
{
  size(600,600,P3D);
  smooth();
  noStroke();
}

void draw()
{
  background(0);
  pointLight(255,255,255,mouseX-600,mouseY,0);
  camera(-400,300,0,300,300,0,0,1,0);
  
  //upper left
  translate(150,150,-x);
  fill(13,178,209);
  rotateX(rotateChange);
  rotateY(rotateChange);
  box(15);
  rotateY(-rotateChange);
  rotateX(-rotateChange);
  
  fill(13,178,209,150);
  rotateY(rotateChange);
  rotateZ(rotateChange);
  box(30);
  rotateZ(-rotateChange);
  rotateY(-rotateChange);
  
  fill(13,178,209,130);
  rotateX(rotateChange);
  rotateZ(rotateChange);
  box(50);
  rotateZ(-rotateChange);
  rotateX(-rotateChange);
  
  fill(13,178,209,110);
  rotateX(-rotateChange);
  rotateY(rotateChange);
  box(95);
  rotateY(-rotateChange);
  rotateX(rotateChange);
  
  fill(13,178,209,90);
  rotateY(-rotateChange);
  rotateZ(rotateChange);
  box(170);
  rotateZ(-rotateChange);
  rotateY(rotateChange);
  translate(-150,-150,x);
  
  //upper right
  translate(450,150,x2);
  fill(13,178,209);
  rotateX(-rotateChange);
  rotateZ(rotateChange);
  box(15);
  rotateZ(-rotateChange);
  rotateX(rotateChange);
  
  fill(13,178,209,150);
  rotateX(rotateChange);
  rotateY(-rotateChange);
  box(30);
  rotateY(rotateChange);
  rotateX(-rotateChange);
  
  fill(13,178,209,130);
  rotateY(rotateChange);
  rotateZ(-rotateChange);
  box(50);
  rotateZ(rotateChange);
  rotateY(-rotateChange);
  
  fill(13,178,209,110);
  rotateX(rotateChange);
  rotateZ(-rotateChange);
  box(95);
  rotateZ(rotateChange);
  rotateX(-rotateChange);
  
  fill(13,178,209,90);
  rotateX(-rotateChange);
  rotateY(-rotateChange);
  box(170);
  rotateY(rotateChange);
  rotateX(rotateChange);
  translate(-450,-150,-x2);
  
  //bottom left
  translate(150,450,x);
  fill(13,178,209);
  rotateY(-rotateChange);
  rotateZ(-rotateChange);
  box(15);
  rotateZ(rotateChange);
  rotateY(rotateChange);
  
  fill(13,178,209,150);
  rotateX(-rotateChange);
  rotateZ(-rotateChange);
  box(30);
  rotateZ(rotateChange);
  rotateX(rotateChange);
  
  fill(13,178,209,130);
  rotateX(rotateChange);
  rotateY(rotateChange);
  box(50);
  rotateY(-rotateChange);
  rotateX(-rotateChange);
  
  fill(13,178,209,110);
  rotateY(rotateChange);
  rotateZ(rotateChange);
  box(95);
  rotateZ(-rotateChange);
  rotateY(-rotateChange);
  
  fill(13,178,209,90);
  rotateX(rotateChange);
  rotateZ(rotateChange);
  box(170);
  rotateZ(-rotateChange);
  rotateX(-rotateChange);
  translate(-150,-450,-x);
  
  //bottom right
  translate(450,450,-x2);
  fill(13,178,209);
  rotateX(-rotateChange);
  rotateY(rotateChange);
  box(15);
  rotateY(-rotateChange);
  rotateX(rotateChange);
  
  fill(13,178,209,150);
  rotateY(-rotateChange);
  rotateZ(rotateChange);
  box(30);
  rotateZ(-rotateChange);
  rotateY(rotateChange);
  
  fill(13,178,209,130);
  rotateX(-rotateChange);
  rotateZ(rotateChange);
  box(50);
  rotateZ(-rotateChange);
  rotateX(rotateChange);
  
  fill(13,178,209,110);
  rotateX(rotateChange);
  rotateY(-rotateChange);
  box(95);
  rotateY(rotateChange);
  rotateX(-rotateChange);
  
  fill(13,178,209,90);
  rotateY(rotateChange);
  rotateZ(-rotateChange);
  box(170);

  x = x + xChange;
  if ( x == 180 || x == -180)
  {
    xChange = xChange*-1;
  }
  x2 = x2 + xChange2;
  if (x2 == 304 || x2 == -304)
  {
    xChange2 = xChange2*-1;
  }
  rotateChange = rotateChange + random(0.03);
}
