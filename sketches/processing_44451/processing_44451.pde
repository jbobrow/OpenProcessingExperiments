
//Homework 11
//copyright Christina Lee Pittsburgh, PA 15289

color black = color(0);
color pink = color(255, 0, 255);
float initialX, initialY, initialZ, pinitialZ, starter, deltaX, deltaY, deltaZ;
float sliderX, sliderY, sliderZ;
float rotationValueX, rotationValueY, rotationValueZ;
int stopX, stopY, stopWidth, stopHeight;
int resetX, resetY, resetWidth, resetHeight;
int barZx, barZy, barZwidth, barZheight;
int barXx, barXy, barXwidth, barXheight;
int barYx, barYy, barYwidth, barYheight;

void setup()
{ 
  size(500, 500, P3D);
  initialX = width/2;
  initialY = height/2;
  initialZ = 0;
  stopX = 10;
  stopY = 10;
  stopWidth = 20;
  stopHeight = 20;
  resetX = 10;
  resetY = 70;
  resetWidth = 20;
  resetHeight = 20;
  deltaX = 0;
  deltaY = 0;
  deltaZ = 0;
  starter = PI/4;
  barZx = int(width*.1);
  barZy = int(height*.02);
  barZwidth = int(.8*width);
  barZheight = int(.02*height);
  barXx = int(.95*width);
  barXy = int(height*.1);
  barXwidth = int(.02*height);
  barXheight = int(.8*width); 
  barYx = int(width*.1);
  barYy = int(height*.95);
  barYwidth = int(.8*width);
  barYheight = int(.02*height);
}

void draw()
{ 
  setting();
  drawData();
  drawButtons();
  drawSliders();
  checkMousePress();
  rotateInitials();
  initials(initialX, initialY, initialZ);
}

void setting()
{  
  noStroke();
  background(black);
  textMode(SCREEN);
}


void drawData()
{
  fill(255, 255, 255);
  text("Distance:" + "\n" + "X: " + int(initialX-(width/2)) + "\n" + "Y: " + int(initialY-(height/2)) + "\n" + "Z: " + int(initialZ), width*.025, height*.3);
  text("Movement:" + "\n" + "X: " + int(deltaX) + "\n" + "Y: " + int(deltaY) + "\n" + "Z: " + int(deltaZ), width*.025, height*.47);
  text("Rotation:" + "\n" + "X: " + int(rotationValueX) + "\n" + "Y: " + int(rotationValueY) + "\n" + "Z: " + int(rotationValueZ), width*.025, height*.64);
}

void drawButtons()
{
  noStroke();
  fill(0, 255, 0);
  rect(stopX, stopY, stopWidth, stopHeight);
  rect(resetX, resetY, resetWidth, resetHeight);
  fill(255);
  text("STOP", stopX, 45);
  text("RESET", resetX, 105);
}

void mousePressed()
{
  if (mouseX < stopX + stopWidth && mouseX > stopX && mouseY > stopY && mouseY < stopY + stopHeight)
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
  }

  else if (mouseX < resetX + resetWidth && mouseX > resetX && mouseY > resetY && mouseY < resetY +resetHeight)
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    initialX = width/2;
    initialY = height/2;
    initialZ = 0;
    rotationValueX = 0;
    rotationValueY = 0;
    rotationValueZ = 0;
  }
}

void checkMousePress()
{

  if (mousePressed && mouseX >= barXx && mouseX <= barXx + barXwidth && mouseY >= barXy && mouseY <= barXy + barXheight)
  { 
    rotationValueX = mapMouseX(barXx, barXy, barXwidth);
  }

  else if (mousePressed && mouseX >= barYx && mouseX <= barYx + barYwidth && mouseY >= barYy && mouseY <= barYy + barYheight)
  {
    rotationValueY = mapMouseY(barYx, barYy, barYwidth);
  }

  else if (mousePressed && mouseX >= barZx && mouseX <= barZx + barZwidth && mouseY >= barZy && mouseY <= barZy + barZheight)
  {
    rotationValueZ = mapMouseZ(barZx, barZy, barZwidth);
  }
}

float mapMouseX(int x, int y, int width)
{

  float rotationValueX = int(map(mouseY, barXy, barXy + barXheight, -360, 360));
  if (rotationValueX < -360)
  {
    rotationValueX = -360;
  }
  else if (rotationValueX > 360)
  {
    rotationValueX = 360;
  }

  return rotationValueX;
}



float mapMouseY (int x, int y, int width)

{
  float rotationValueY = int(map (mouseX, barYx, barYx + barYwidth, -360, 360));
  if (rotationValueY < -360)
  {
    rotationValueY = -360;
  }
  else if (rotationValueY > 360)
  {
    rotationValueY = 360;
  }

  return rotationValueY;
}

float mapMouseZ (int x, int y, int width)
{
    float rotationValueZ = int(map (mouseX, barZx, barZx + barZwidth, -360, 360));
  if (rotationValueZ < -360)
  {
    rotationValueZ = -360;
  }
  else if (rotationValueZ > 360)
  {
    rotationValueZ = 360;
  }

  return rotationValueZ;
}


void drawSliders ()
{
  noStroke( );
  fill(255);
  rect(barZx, barZy, barZwidth, barZheight);
  rect(barXx, barXy, barXwidth, barXheight);
  rect(barYx, barYy, barYwidth, barYheight);
  stroke(0, 255, 0);
  strokeWeight(6);
  float x = map(rotationValueX, -360, 360, barXy, barXy+barXheight);
  line(barXx - 6, x, barXx + barXwidth + 6, x);
  float y = map(rotationValueY, -360, 360, barYx, barYx+barYwidth);
  line(y, barYy - 6, y, barYy + barYheight + 6);
  float z = map(rotationValueZ, -360, 360, barZx, barZx+barZwidth);
  line(z, barZy-6, z, barZy + barZheight +6);
  text("Z Axis", width*.47, barZheight+30);
  text("X" + "\n" + " " + "\n" + "a" + "\n" + "x" + "\n" + "i" + "\n" + "s", barXx-20, height*.47);
  text("Y Axis", width*.47, barYheight+455);
}

void rotateInitials()
{
  translate(initialX, initialY, initialZ);
  rotateX(radians(rotationValueX));
  rotateY(radians(rotationValueY));
  rotateZ(radians(rotationValueZ));
}

void initials(float x, float y, float z)
{ 
  pointLight(255, 255, 255, width/2, 0, width*.3);
  noStroke();
  fill(pink);
  starter = 45;
  while ( starter <= 315) {
    pushMatrix();
    rotateZ(radians(starter));
    translate(100, 0, starter*.3);
    sphere(20);
    starter = starter + 15;
    initialX = initialX + deltaX;
    initialY = initialY + deltaY;
    initialZ = initialZ + deltaZ;
    popMatrix();
  }
  
      fill(0, 255, 255);
    rotateX(radians(frameRate));
    sphere(10);
}



void keyPressed ()
{ 
  if (keyCode == UP)
  { 
    deltaY = deltaY - 0.5;
  }
  if (keyCode == DOWN)
  { 
    deltaY = deltaY +  0.5;
  }
  if (keyCode == RIGHT)
  {
    deltaX = deltaX + 0.5;
  }
  if (keyCode == LEFT)
  { 
    deltaX = deltaX - 0.5;
  }

  if (key == 'a')
  { 
    deltaZ = deltaZ - 0.5;
  }

  if (key == 'c')
  { 
    deltaZ = deltaZ + 0.5;
  }

  if (key == 's')
  {
    deltaZ = 0;
    deltaX = 0;
    deltaY = 0;
  }

  if (key == 'z')
  { 
    pinitialZ = initialZ;
    initialZ = -500;
  }

  if (key == 'x')
  { 
    initialZ = pinitialZ;
  }

  if (key == ' ')
  {
    initialZ = 0;
    initialX = width/2;
    initialY = height/2;
  }
}

