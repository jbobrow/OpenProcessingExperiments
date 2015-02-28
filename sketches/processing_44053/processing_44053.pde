
//HW11 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 10/25/2011 - CMU
 
float x, y, z, deltaX, deltaY, deltaZ, zoom, barRotZX, barRotZY, barRotZWidth, barRotZHeight, rotZ,easing, sliderZ, zPos, easeZ, prevZ;
float barRotXX, barRotXY, barRotXWidth, barRotXHeight, rotX, sliderX, xPos, easeX;
float barRotYX, barRotYY, barRotYWidth, barRotYHeight, rotY, sliderY, yPos, easeY;
float buttonStopX, buttonStopY, buttonStopWidth, buttonStopHeight;
float buttonResetX, buttonResetY, buttonResetWidth, buttonResetHeight;
void setup()
{
  size(600,600,P3D);
  x = width/2;
  y = height/2;
  z = -200;
  deltaX= 0;
  deltaY= 0;
  deltaZ= 0;
  zoom = 0;
  easing = 0.2;
  barRotXX = width *.1;
  barRotXY = height * .02;
  barRotXWidth = width * .8;
  barRotXHeight = height * .03;
  rotX = 0;
  xPos = barRotXWidth/2;
  sliderX = 0;
  barRotYX = width *.95;
  barRotYY = height * .1;
  barRotYWidth = width * .03;
  barRotYHeight = height * .8;
  rotY = 0;
  yPos = barRotXWidth/2;
  sliderY = 0;
  barRotZX = width *.1;
  barRotZY = height * .95;
  barRotZWidth = width * .8;
  barRotZHeight = height * .03;
  rotZ = 0;
  zPos = barRotZWidth/2;
  sliderZ = 0;
  buttonStopX = width * .02;
  buttonStopY = height * .2;
  buttonStopWidth = 40;
  buttonStopHeight = 100;
  buttonResetX = width * .02;
  buttonResetY = height * .02;
  buttonResetWidth = 40;
  buttonResetHeight = 100;
  textMode(SCREEN);
}
 
void draw()
{
  
  prepScreen();
  drawText();
  drawSliders();
  initial();
  moveInitial();
  checkSlider();
  
}
 
void mousePressed()
{
  if(mouseX < buttonResetX + buttonResetWidth && mouseX > buttonResetX
  && mouseY < buttonResetY + buttonResetHeight && mouseY > buttonResetY)
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    x = width/2;
    y = height/2;
    z = -200;
    rotX = 0;
    rotY = 0;
    rotZ = 0;
  }
  else if(mouseX < buttonStopX + buttonStopWidth && mouseX > buttonStopX
  && mouseY < buttonStopY + buttonStopHeight && mouseY > buttonStopY)
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
  }
}
 
void prepScreen()
{
  background(255);
  drawButtons();
}

void checkSlider()
{
  if ( mousePressed && mouseX > barRotZX - 5 && mouseX < barRotZX  + barRotZWidth + 5
   && mouseY > barRotZY - 5 && mouseY < barRotZY + barRotZHeight + 5)
   {
     rotZ = easeSliderZ(mouseX);
     mapMouseZ( );
   }
   else if ( mousePressed && mouseX > barRotXX - 5 && mouseX < barRotXX  + barRotXWidth + 5
   && mouseY > barRotXY - 5 && mouseY < barRotXY + barRotXHeight + 5)
   {
     rotX = easeSliderX(mouseX);
     mapMouseX( );
   }
   else if ( mousePressed && mouseY > barRotYY - 5 && mouseY < barRotYY  + barRotYHeight + 5
   && mouseX > barRotYX - 5 && mouseX < barRotYX + barRotYHeight + 5)
   {
     rotY = easeSliderY(mouseY);
     mapMouseY( );
   }
}

void drawText()
{
  fill(0);
 // pushMatrix();
  //translate(-width/2,-height/2, 200);
  text("Distance", width * .02, height * .4);
  text("L/R: " + (int)x, width * .02, height * .43);
  text("U/D: " + (int)y, width * .02, height * .46);
  text("I/O: " + (int)z, width * .02, height * .49);
  text("Transition", width * .02, height * .55);
  text("X: " + deltaX, width * .02, height * .58);
  text("Y: " + deltaY, width * .02, height * .61);
  text("Z: " + deltaZ, width * .02, height * .64);
  text("Rotation", width * .02, height * .70);
  text("X: " + rotX, width * .02, height * .73);
  text("Y: " + rotY, width * .02, height * .76);
  text("Z: " + rotZ, width * .02, height * .79);
  //popMatrix();
}

void drawButtons()
{
  
  strokeWeight(1);
  //textSize(30);
  
  fill(0,255,0);
  rect(buttonResetX, buttonResetY, 40, 100);
  rect(buttonStopX, buttonStopY, 40, 100);
  fill(0);
  
  text("Reset", buttonResetX + 5, buttonResetY + buttonResetHeight / 2);
  text("Stop", buttonStopX + 10, buttonStopY + buttonStopHeight / 2);
  
  
  
}

void drawSliders()
{
  fill(255,0,0);
  strokeWeight(1);
  rect(barRotXX, barRotXY, barRotXWidth, barRotXHeight);
  rect(barRotYX, barRotYY, barRotYWidth, barRotYHeight);
  rect(barRotZX, barRotZY, barRotZWidth, barRotZHeight);
  sliderX = map( rotX, -360, 360, barRotXX, barRotXX+barRotXWidth) ;
  sliderY = map( rotY, -360, 360, barRotYY, barRotYY+barRotYHeight) ;
  sliderZ = map( rotZ, -360, 360, barRotZX, barRotZX+barRotZWidth) ;
  fill(0,255,0,100);
  rect( sliderX - 5, barRotXY - 5, 10,barRotXHeight + 10 );
  rect( barRotYX - 5, sliderY - 5,barRotYWidth + 10,10 );
  rect( sliderZ - 5, barRotZY - 5, 10,barRotZHeight + 10 );
  
  fill(0);
  text("RX", barRotXX + 10, barRotXY + 14);
  text("RZ", barRotZX + 10, barRotZY + 14);
  text("RY", barRotYX + 2, barRotYY + 24);
}

float easeSliderX(float mX)
{ 
  xPos += (mX - xPos) * easing;
  //println(zPos);
  return xPos;
}
float easeSliderY(float mX)
{ 
  yPos += (mX - yPos) * easing;
  //println(zPos);
  return yPos;
}
float easeSliderZ(float mX)
{ 
  zPos += (mX - zPos) * easing;
  //println(zPos);
  return zPos;
}
void mapMouseX()
{
  rotX = map(xPos, barRotXX, barRotXX + barRotXWidth, -360, 360);
}

void mapMouseY()
{
  rotY = map(yPos, barRotYY, barRotYY + barRotYHeight, -360, 360);
}

void mapMouseZ()
{
  rotZ = map(zPos, barRotZX, barRotZX + barRotZWidth, -360, 360);
}

 
void initial()
{
  strokeWeight(1);
  translate(x,y,z);
  rotateX(radians(rotY));
  rotateY(radians(rotX));
  rotateZ(radians(rotZ));
  
  for(int i = 0; i < 3; i++)
  {
    pushMatrix();
      fill(150 - 20 * i,0,0);
      translate(-width*.1*i, width * .1 * i, 0);
      rotateY(radians(i * 20));
      box(width * .1);
    popMatrix();
    pushMatrix();
      fill(150 + 20 * i,0,0);
      translate(width*.1*i, -width * .1 * i, 0);
      rotateY(radians(-i * 20));
      box(width * .1);
    popMatrix();
     
  }
   
  for(int j = 0; j < 2 ; j++)
  {
    fill(150,0,0,160);
    pushMatrix();
      translate(0, width * .3, -width * .1  * j);
      box(width * 2/3, width * .1, width * .1);
    popMatrix();
    pushMatrix();
      translate(0, -width * .3, width * .1  * j);
      box(width * 2/3, width * .1, width * .1);
    popMatrix();
    pushMatrix();
      translate(0, width * .3, width * .1  * j);
      box(width * 2/3, width * .1, width * .1);
    popMatrix();
    pushMatrix();
      translate(0, -width * .3, -width * .1  * j);
      box(width * 2/3, width * .1, width * .1);
    popMatrix();
  }
   
  strokeWeight(5);
  line(width * 1/3,-width * 1/3,0, -width * 1/3, width * 1/3,0);
   
  for(int k = 0; k < 4; k++)
  {
    line(-width * .1  * k, width * .3, width * .25, -width * .1 * k, .3* width, -width * .25);
    line(width * .1  * k, width * .3, width * .25, width * .1 * k,.3* width, -width * .25);
    line(-width * .1  * k, -width * .3, width * .25, -width * .1 * k, -.3* width, -width * .25);
    line(width * .1  * k, -width * .3, width * .25, width * .1 * k, -.3* width, -width * .25);
  }
}
 
void moveInitial()
{
  x = x + deltaX;
  y = y + deltaY;
  z = z + deltaZ;
   
}
  
void keyPressed()
{
  if(keyCode == LEFT)
  {
    deltaX = deltaX - .1;
  }
  else if(keyCode == RIGHT)
  {
    deltaX = deltaX + .1;
  }
  else if(keyCode == UP)
  {
    deltaY = deltaY - .1;
  }
  else if(keyCode == DOWN)
  {
    deltaY = deltaY + .1;
  }
  else if(key == 'a')
  {
    deltaZ = deltaZ - .1;
  }
  else if(key == 'c')
  {
    deltaZ = deltaZ + .1;
  }
  else if(key == 's')
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
  }
  else if(key == ' ')
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    x = width/2;
    y = height/2;
    z = -200;
    rotX = 0;
    rotY = 0;
    rotZ = 0;
  }
  else if(key == 'z')
  {
    prevZ = z;
    z = -500;
    
  }
  else if(key == 'x')
  {
    z = prevZ;
    
  }
    
}

