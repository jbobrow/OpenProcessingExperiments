
//Copyright (C) Akash Levy
//First 3-D Attempt
int xOffset = 160, yOffset = 500, zOffset = 150;
float[] ballCoord = {0, 0, 0}, ballSpeed = {0, 0, 0};

void setup()
{
  size(500, 700, OPENGL);
}

void draw()
{
  background(255, 255, 255);
  translate(xOffset, yOffset, zOffset);
  
  //Draw ball
  translate(ballCoord[0], ballCoord[1], ballCoord[2]);
  sphere(10);
  translate(-ballCoord[0], -ballCoord[1], -ballCoord[2]);
  
  //Draw ground
  rotateX(radians(90)); //80 for ceiling
  rotateY(radians(0));
  rotateZ(radians(0));
  for (int i = 0; i < 10; i++)
  {
    for (int j = 0; j < 10; j++)
    {
      box(20, 20, 1);
      translate(20, 0, 0);
    }
    translate(-200, 20, 0);
  }
  translate(0, -200, 0);
  
  //Draw ceiling
  translate(0, 0, 300);
  for (int i = 0; i < 10; i++)
  {
    for (int j = 0; j < 10; j++)
    {
      box(20, 20, 1);
      translate(20, 0, 0);
    }
    translate(-200, 20, 0);
  }
  translate(-200, -200, 0);
  
  //Move ball
  ballSpeed[1] = -1;
  for (int i = 0; i < 3; i++)
    ballCoord[i] += ballSpeed[i];
}


