
//homework 10
// Copyright Caroline Record October 10, 2011 Pittsburgh, PA

//for the circle
float simplecount [] = new float [16];
float r=0;
float diam;
float diam2;
float z;

void setup()
{
  size (500, 500, P3D);
  background (0);
  noStroke();

  diam= width*.05;// diameter of all the cicles
  diam2= width*.03;// diameter of little circles
  z= width*.08;

  // assigning value to angle changer

  for (int i=0; i<simplecount.length; i++)
  {
    simplecount[i]=r;
    r=r+22.5;
  }
}
void draw()
{

  background (100);
  noLoop();
  directionalLight(200, 50, 100, 900, -700, -20); //lightling the clouds
  directionalLight(200, 0, 0, 400, 400, -50); //lighting the box

  //vertical stroke 

  for (float i= height*.2; i<height-height*.2; i=i+40)
  {
    pushMatrix();
    translate (width*.3, i);
    sphere (diam);
    translate(0, 0, z);
    sphere (diam2);
    popMatrix();
  }

  //diagonal stroke   
  for (float x =width*.45; x<width-width*.2; x=x+25)
  {    
    pushMatrix();
    translate(x, x);
    sphere (diam); 
    translate(0, 0, z);
    sphere (diam2);
    popMatrix();
  }
  //circular stroke   
  float centerX   = width*.5;
  float centerY   = height*.3;
  float amplitude = width*.18;
  for (int i=0; i<simplecount.length; i++)
  {
    float xPos = centerX + amplitude * sin(radians (simplecount[i]));
    float yPos = centerY + amplitude * cos(radians (simplecount[i]));

    pushMatrix();
    translate (xPos, yPos);
    sphere(diam);
    translate(0, 0, z);
    sphere (diam2);

    popMatrix();
  }
}




