
//Mira A | Rotating Cube | CP1 | Mods 16/17

/**
Move mouse to adjust perspective. <br>
Hold the left mouse key to increase the speed of the x rotation. <br>
Hold the right mouse key to increase the speed of the y rotation. <br><br>
NOTE: Less opacity does not seem to function correctly on OpenProcessing.
*/

//rotation variables
float rotX = 0;
float rotY = 0;

void setup()
{
  size(300,300,P3D);
}

void draw()
{
  background(255);
  noStroke();
  camera(2*mouseX-300,2*mouseY-300,200,0,0,0,0,1,0);
  //inner cube, nonrotating
  boxone();
  //inner cube, rotating one
  boxtwo();
  //inner cube, rotating two
  boxthree();
  //outer cube, rotating one
  boxfour();
  //outer cube, rotating two
  boxfive();
  //mouse input
  input();
}

//an inner cube, nonrotating
void boxone()
{
  fill(74,76,95,200);
  box(100);
}

//an inner cube, rotating (one)
void boxtwo()
{
  //set
  rotateX(rotX);
  rotateY(rotY);
  //rotation
  rotX = rotX + 0.01;
  rotY = rotY - 0.01;
  //box
  box(100);
}

//an inner cube, rotating (two)
void boxthree()
{
  //set
  rotateX(rotX);
  rotateY(rotY);
  //cancel previous rotation
  rotY = rotY + 0.01;
  rotX = rotX - 0.01;
  //rotation
  rotX = rotX - 0.01;
  rotY = rotY + 0.01;
  //box
  box(100);
}

//an outer cube, rotating (one)
void boxfour()
{
  //set
  rotateX(rotX);
  rotateY(rotY);
  fill(74,76,95,15);
  //cancel previous rotation
  rotY = rotY - 0.01;
  rotX = rotX + 0.01;
  //rotation
  rotX = rotX + 0.02;
  rotY = rotY - 0.02;
  //box
  box(200);
}

//an outer cube, rotating (cube)
void boxfive()
{
  //set
  rotateX(rotX);
  rotateY(rotY);
  //cancel previous rotation
  rotY = rotY + 0.02;
  rotX = rotX - 0.02;
  //rotation
  rotX = rotX - 0.02;
  rotY = rotY + 0.02;
  box(200);
}

//mouse input affects rotation
void input()
{
  //increase speed of x rotation
  if (mousePressed == true && mouseButton == LEFT)
  {
    rotX = rotX - 0.05;
  }
  //increase speed of y rotation
   if (mousePressed == true && mouseButton == RIGHT)
  {
    rotY = rotY + 0.05;
  }
}
