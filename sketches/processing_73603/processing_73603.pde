

float rotx = 0;
float roty = 0;
void setup ()
{

  size(300, 300, P3D);
}


void draw ()
{
  background(232, 252, 25);
  pointLight(255, 255, 255, 3*mouseX, 3*mouseY, -20); 
  camera(3*mouseX, 3*mouseY, -20, 0, 0, 0, 0, 1, 0);
  fill(255, 0, 0);
  translate(150, 150, 0);
  rotateX(rotx);
  rotateY(roty);
  sphere(50);
  noStroke();


  fill(0, 255, 0);
  translate(0, -100, -20);  
  sphere(5);
  translate(20, 200, -20);
  sphere(5);

  fill(0, 0, 255);
  translate(-20, -100, 100);
  sphere(5);
  translate(-60, 0, -100);
  sphere(5);  

  rotx = rotx + 0.05;
  roty = roty + 0.05;
}


