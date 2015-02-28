
//Laura R., Rotating Cube, Computer Programming 1, 14-15

 float y = .5;
 int r = 20;
 int g = 20;
 int b = 20;
 int s = 0;
 int w = 10;
void setup()
{
  size(500,500,P3D);
}
void draw()
{
  background(255,2247,155);
  s = s + 1;
  translate(250,250,0);
  fill(255);
  pointLight (r,g,b,60,-150,400);
  if (s % 60 == 0)
  {
   r = int(random(10,255));
   g = int(random(10,255));
   b = int(random(10,255));
  }
  rotateX(-.5);
  rotateY(y);
  box(150);
  y = y + .05; 
}
