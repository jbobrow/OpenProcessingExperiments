
// Matheson G. Computer Programming 1 Mods:14/15
float x=0.5;
float y=-0.5;
float z=-1;
float w=1;
void setup()
{
  size(500, 500, P3D);
}
void draw()
{
  background(0);
  translate(250, 250, 50);
  rotateX(x);
  rotateY(y);
  x=x-0.01;
  y=y+0.01;
  lights();
  strokeWeight(2);
  stroke(0, 0, 255);
  fill(42, 191, 125);
  box(100); 
  translate(-250, -250, -50);
  rotateX(w);
  rotateY(z);
  translate(300, 300, 0);
  w=w+.01;
  z=z-.01;
  stroke(255, 0, 0);
  fill(255, 9, 0);
  sphere(50);
  rotateX(z);
  rotateY(w);
  translate(-150, -150, 0);
  w=w+.01;
  z=z-.01;
  stroke(0, 0, 255);
  fill(0, 0, 255);
  sphere(50);

  if (mousePressed==true)
  {
    translate(150, 150, 0);
  }
}
