
float spotb;
float spot;
float ran;
float ranb;
float ranc;
void setup()
{
  size(600, 600, P3D);
  background(255);
  smooth();
  frameRate(60);
  spot=width/2;
  spotb=height/2;
  ran=255;
  ranb=255;
  ranc=255;
}

void draw()
{
  noStroke();
  lights();
  lightSpecular(ran, ranb, ranc);
  directionalLight(ran, ranb, ranc, -10, -20, -20);
  shininess(2);
  translate(spot, spotb, 0);
  specular(ran, ranb, ranc);
  sphere(20);
  if (key=='w')
  {
    spotb=spotb-1;
  }
  if (key=='s')
  {
    spotb=spotb+1;
  }
  if (key=='a')
  {
    spot=spot-1;
  }
  if (key=='d')
  {
    spot=spot+1;
  }
  if (key=='g')
  {
    ran=9;
    ranb=222;
    ranc=21;
  }
  if (key=='p')
  {
    ran=24;
    ranb=7;
    ranc=224;
  }
  if (key=='b')
  {
    ran=18;
    ranb=181;
    ranc=224;
  }
  if (key=='r')
  {
    ran=134;
    ranb=4;
    ranc=24;
  }
  if (key=='f')
  {
    ran=234;
    ranb=21;
    ranc=21;
  }
}


