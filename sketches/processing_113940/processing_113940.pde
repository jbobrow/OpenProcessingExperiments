
//Ara Lee
//aral
//copyright Ara Lee, October 2013, Pittsburgh, PA
//hw6
//257

//variables
float transX, transY, transZ;
float rotX, rotY, rotZ;
float rotdX, rotdY, rotdZ;
color white, red;

void setup()
{
  size(600, 600, P3D);
  
  rotdX = 0;
  rotdY = 0;
  rotdZ = 0;
  
  white = color(255, 250);
  red = color(255, 80, 80, 255);
}

void draw()
{
  pushMatrix();
  prepScrn1();
  prepScrn2();
  drawInitial();
  popMatrix();
  stats();
}

void prepScrn1()
{
  background(0);
  translate(width*.55, height*.5, 0);
}

void prepScrn2()
{
  lights();
  
  translate(transX, 0, 0);
  rotateX(radians(rotX));
  rotX += rotdX;
  
  translate(0, transY, 0);
  rotateY(radians(rotY));
  rotY += rotdY;
  
  translate(0, 0, transZ);
  rotateZ(radians(rotZ));
  rotZ += rotdZ;
}

void drawInitial()
{  
  //left
  pushMatrix();
  fill(white);
  noStroke();
  translate(-60, -100, 20);
  sphere(50);
  popMatrix();
  
  pushMatrix();
  fill(white);
  noStroke();
  translate(-100, -50, 0);
  rotateY(.5);
  sphere(30);
  popMatrix();
  
  pushMatrix();
  fill(red);
  translate(-110, -20, 0);
  sphere(20);
  popMatrix();
  
  pushMatrix();
  fill(white);
  translate(-120, 10, 30);
  sphere(35);
  popMatrix();
  
  pushMatrix();
  translate(-110, 80, -20);
  sphere(60);
  popMatrix();
  
  pushMatrix();
  popMatrix();
  
  //right
  pushMatrix();
  fill(white);
  translate(0, -100, 0);
  sphere(20);
  popMatrix();
  
  pushMatrix();
  fill(red);
  translate(0, -80, 0);
  sphere(20);
  popMatrix();
  
  pushMatrix();
  fill(white);
  translate(20, -10, 40);
  sphere(55);
  popMatrix();
  
  pushMatrix();
  translate(40, 45, -10);
  sphere(30);
  popMatrix();
  
  pushMatrix();
  translate(50, 90, 10);
  sphere(40);
  popMatrix();
  
  //middle
  pushMatrix();
  translate(-60, 40, 0);
  sphere(30);
  popMatrix();
  
  pushMatrix();
  translate(-20, 30, -15);
  sphere(25);
  popMatrix();
}

void mouseDragged()
{
  if(mouseButton == LEFT)
  {
    if(mouseX > pmouseX)
    {
      transX += 7;
    }
    else if(mouseX < pmouseX)
    {
      transX -= 7;
    }
    else if(mouseY > pmouseY)
    {
      transY += 7;
    }
    else if(mouseY < pmouseY)
    {
      transY -= 7;
    }
  }
  else if(mouseButton == RIGHT)
  {
    if(mouseY > pmouseY)
    {
      transZ += 10;
    }
    else if(mouseY < pmouseY)
    {
      transZ -= 10;
    }
  }
}

void keyPressed()
{
  if(key == 'X')
  {
    rotdX += .2;
  }
  else if(key == 'x')
  {
    rotdX -= .2;
  }
  else if(key == 'Y')
  {
    rotdY += .2;
  }
  else if(key == 'y')
  {
    rotdY -= .2;
  }
  else if(key == 'Z')
  {
    rotdZ += .2;
  }
  else if(key == 'z')
  {
    rotdZ -= .2;
  }
  else if(key == ' ')
  {
    transX = 0;
    transY = 0;
    transZ = 0;
  }
  else if(key == 's')
  {
    rotX = 0;
    rotY = 0;
    rotZ = 0;
    rotdX = 0;
    rotdY = 0;
    rotdZ = 0;
  }
}

void stats()
{
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("Rotation", width-470, height-110);
  text("X: " + round(rotX), width-350, height-110);
  text("Y: " + round(rotX), width-250, height-110);
  text("Z: " + round(rotZ), width-150, height-110);
  
  text("Translation", width-470, height-85);
  text("X: " + round(transX), width-350, height-85);
  text("Y: " + round(transY), width-250, height-85);
  text("Z: " + round(transZ), width-150, height-85);
}


