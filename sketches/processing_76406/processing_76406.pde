
//Allison Wong, Doubling Shapes, CP1 mods 4-5
//http://allisonprogrammingsite.webs.com/

int x = 2;
int y = 1;
void setup()
{
  size(400,400,P3D);
  smooth();
  fill(255,100,3);
  strokeWeight(5);
  stroke(19,178,191);
  frameRate(5);
}
void draw()
{
  background(0);
  lights();
  if(y < 4500)
    {
      while(x<=y)
      {
    int size = int(random(5,50));
    int offsetX= int(random(0,400));
    int offsetY= int(random(0,400));
    translate(offsetX,offsetY,0);
    sphere(15);
    translate(-offsetX,-offsetY,0);
    x++;
      }
    }
    y = y * 2;
}
