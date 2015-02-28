
PImage a;
int c=0;
PImage b;

void setup()
  {
    size (500, 300);
    smooth ();
    frameRate(30);
    b=loadImage ("hexagon.jpg");
  }

void draw()
  {
    a=get();
    tint(250);
    image(a, 2, 1, 496, 496);
    rect(499,100,50,300);
    if(c%90>random(1,90)&&c%90<random(1,90))image(b, 1, 1, random(50, 450), random(50, 450));
    c++; 
  }

