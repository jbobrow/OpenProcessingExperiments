
//Alvin Ha, 4-5 Computer Programming, Mr Simon
//Doubling Shapes

PImage img;
int y = 1;
PImage spongebob;


void setup()
{
  size(400, 400, P3D);
  smooth();
  frameRate(1);
}

void draw()
{

  noStroke();
  lights();
  for (int x = 1; x<=y; x++)
  {
    int lol = int(random(0, 401));
    int fall = int(random(0, 401));
    pushMatrix();
    translate(lol, fall, 0);
    rotateX(60);
    rotateY(50);
    fill(238, 255, 13);
    sphere(50);
    popMatrix();

       if (y>255)
    {
      spongebob=loadImage("face.jpg");
      image(spongebob, 50, 85);
    }
    if (y>255)
    {
      y = 0;
    }
  }
  y=y*2;
}
