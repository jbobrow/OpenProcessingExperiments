
// Jeffrey C. CP1 Doubling Shapes October 19, 2012
// URL: http://www.openprocessing.org/user/21148
void setup()
{
  size(600,600,P3D);
  smooth();
  
  strokeWeight(.2);
  stroke(255,100,3);
  frameRate(2);
}
float x = 0;
float y = 1;
void draw()
{
  background(255);
  lights();
  
  if(y < 2048)
    {
      while(x<=y)
      {
        fill(int(random(175,255)),int(random(150,250)),int(random(0,60)));
    int size = int(random(5,50));
    int offsetX= int(random(0,400));
    int offsetY= int(random(0,400));
    translate(offsetX,offsetY,0);
    sphere(30);
    translate(-offsetX,-offsetY,0);
    x++;
      }
    }
    y*=2;
}

