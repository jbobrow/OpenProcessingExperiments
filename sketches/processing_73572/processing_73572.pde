
//Di T,RotatingCube,CP1, 14-15
float rx = .3;
float ry = .8;

void setup()
{
 size(500,500,P3D);
 noStroke();
}
void draw()
{
 
  pointLight(0,250,100,0,0,500); 
 
  background(0);
  translate(mouseX, mouseY,0);
  rotateX(rx);
  rotateY(ry);
  rx = rx + .05;
  ry = ry + .05;
    box(100);
  {
    fill(0,250,100,200);
  }
  
  translate(100,0,0);
  sphere(25);

  translate(-200,0,0);
  sphere(25);

  translate(100,0,100);
  sphere(25);
  
  translate(0,0,-200);
  sphere(25);
  
  translate(0,100,100);
  sphere(25);
  
  translate(0,-200,0);
  sphere(25);
    
}
