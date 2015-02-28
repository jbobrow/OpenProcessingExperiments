
//Rotating Cube project, computer programming 1
//Iam B
int g=int(random(0, 256));
int b=int(random(0, 256));
float x=.1;
float y=.1;
float z=.1;

void setup()
{
  size(500, 500, P3D);
  background(0);
  strokeWeight(3);
}
void draw()
{
  pointLight(255,255,255,250,500,500);
  if(mousePressed)
  {
    rotatingCube();
  }
  if(keyPressed==true)
  {
    drawingCube();
  }
  else
  {
    cube();
  }
}

void cube()
{
  background(0);
  translate(mouseX, mouseY, 0);
  stroke(255);
  fill(100, g, b,180);
  box(75);
  g=g+15;
  b=b+15;
  if (g>255)
  {
    g=int(random(0, 255));
  }
  if (b>255)
  {
    b=int(random(0, 255));
  }
  translate(0,0,0);
}

void rotatingCube()
{ background(0);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  stroke(255);
  fill(100, g, b,180);
  box(75);
  g=g+15;
  b=b+15;
  x=x+.1;
  y=y+.1;
  z=z+.1;
  if (g>255)
  {
    g=int(random(0, 255));
  }
  if (b>255)
  {
    b=int(random(0, 255));
  }
}

void drawingCube()
{
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  stroke(255);
  fill(100, g, b,180);
  box(75);
  g=g+15;
  b=b+15;
  x=x+.1;
  y=y+.1;
  z=z+.1;
  if (g>255)
  {
    g=int(random(0, 255));
  }
  if (b>255)
  {
    b=int(random(0, 255));
  }
}
