
//Julie O, CompProg Mods 4/5, 100 Random Shapes

int d = 10;

int offsetX = 10;
int offsetY = 10;
float r = 93;
float g = 174;
float b = 45;

void setup()
{
  size(400,400,P3D);
  background(0);
  smooth();
  frameRate(.5);
}

void draw()
{
  background(0);
  //pointLight(198,226,255,200,200,400);
  lights();
  int d = int(random(7,24));
  int sphereNumber = 1;
  while(sphereNumber<101)
  {
    //sphere(d); //ellipse(int(random(0,400)),int(random(0,400)),7.5,20);
    int offsetX = int(random(5,400));
    int offsetY = int(random(5,400));
    println(offsetX + " " + offsetY);
    sphereNumber++;
    translate(offsetX,offsetY,0);
    sphere(d);
    translate(-offsetX,-offsetY,0);
  }
 // while(sphereNumber>=101)
  {
   // background(0);
    //sphereNumber = 1;
  }
  stroke(r,g,b);
  fill(255-r,255-g,255-b);
  if(r<2)
  {
    r = 75;
  }
  if(g<2)
  {
    g = 150;
  }
  if(b<2)
  {
    b = 225;
  }
  r = r + (int(random(-74,175)));
  if(r>249)
  {
    r = 75;
  }
  g = g + (int(random(-150,105)));
  if(g>250)
  {
    g = 150;
  }
  b = b + (int(random(-225,30)));
  if(b>250);
  {
    b = 225;
  }
}
 
