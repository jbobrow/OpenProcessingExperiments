
//Sarah C, CP1, 16/17, Rotating Cube

float rotX = -.5;
float rotY = .5;
float z = -50;
float zChange = .35;

void setup()
{
  size(500,500,P3D);
  background(0);
  smooth();
}

void draw()
{
  stroke(152,21,21);
  fill(0);
  translate(250,250,z);
  rotateX(rotX);
  rotateY(rotY);
  box(200,160,185);
  
  rotX = rotX - .05;
  rotY = rotY + .05;
  z = z + zChange;
  
  if (z > 120)
  {
    zChange = -.25;
  }
  
  if (z < -50)
  {
    zChange = .25;
  }
  
  //push the cube back by pressing the mouse 
  if (mousePressed == true)
  {
    rotX = rotX + .5;
    rotY = rotY + -.5;
    zChange = zChange - .25;
  }  
}
