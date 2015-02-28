
//Lucky Lui, computer programming 1, Rotating cubes
float rotatex=0;
float rotatey=0;

void setup()
{
  size(600,600,P3D);
}
void draw()
{
  background(0);
  strokeWeight(3);
  stroke(138,90,242);
 
  
  fill(138,90,242);
  translate(300,300,-200);
  rotateX(rotatex);
  rotateY(rotatey);
  lights();
  sphere(150);
  
  stroke(232,226,26);
  fill(39,240,228);
  rotateY(rotatey);
  translate(200,-50,-100);
  sphere(50);
  
  stroke(25,12,234);
  fill(232,53,26);
  translate(200,-50,-100);
  rotateX(rotatex);
  sphere(40);
  
  rotatex=rotatex+.01;
  rotatey=rotatey+.01;
}
