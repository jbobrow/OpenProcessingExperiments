
//import processing.opengl.*;

float y = 0.5;
void setup()
{
  size(500, 500, P3D);
  strokeWeight(1.5);
}
void draw()
{
  background(255);
  translate(width/2, height/2, 200); 
  rotateY(y);
  y += 0.02;
  noFill();
  stroke(255, 0, 0);
  box(100);
  fill(0, 0, 255);
  box(39);
  noStroke();
  fill(255, 0, 255);
  sphere(28);
}



