
//Abby Zhang. One Hundred Random Shapes, Computer Programming 4/5
void setup()
{
  size (500,500,P3D);
  frameRate(10);
  noStroke();
  smooth();
  background(0);
}
void draw()
{
  int size =int(random(0,30));
  int offsetX = int(random(0,500));
  int offsetY = int(random(0,500));
  int x= int(random(0,255));
  translate(offsetX,offsetY,0);
  fill(0,x,x);
  sphere(size);
  int o= int (random(0,50));
  int p=int(random(0,255));
  fill(p,0,p);
  box(o);
  if (mousePressed==true)
  {
    background(0);
  }
}
/** 
Click mouse to clear the shapes
*/
