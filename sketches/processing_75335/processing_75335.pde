
//Dominique A., Hundred shapes, CP1, Mod 16-17

void setup()
{
  size(400,400,P3D);
  fill(17,188,112,150);
  noStroke();
  frameRate(3);
}
void draw()
{
  background(0);
  lights();
  int x = 1;
  while( x <= 100)
  {
    int size = int(random(5,50));
    int offsetX= int(random(0,400));
    int offsetY= int(random(0,400));
    translate(offsetX,offsetY,0);
    sphere(10);
    box(5);
    translate(-offsetX,-offsetY,0);
    x++;
  }
}
