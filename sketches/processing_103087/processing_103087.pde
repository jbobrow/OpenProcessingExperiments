
//Copyright (C) Akash Levy July 2013
//Cool Bot Initials :D

//Variable declarations
  boolean[] botOn = {false, false, false, false};
  float[] angle = {1,-1};
  float[] speed = {5,5};
  int currentX = 0, currentY = 0;
  float[] bot1Coord = {70.0,170.0};
  float[] bot2Coord = {330.0,170.0};
  float[] bot3Coord = {200.0,45.0};
  float[] bot4Coord = {200.0,305.0};
  float[] bot3Speed = {0.0,0.0};
  float[] bot4Speed = {0.0,0.0};
  int windowFrameRate = 60, iteration = 0;
  int oldMouseX = mouseX, oldMouseY = mouseY;
  float bot3Friction = 0.9975, bot4Friction = 0.9975;
  
//Setup  
void setup()
{
  size(400,400);
  rectMode(CENTER);
  stroke(0);
  frameRate(windowFrameRate);
}

void draw()
{
  //Background
  background(233, 255, 240);
  //background(128 * (1 - sin((float)iteration/30)), 128 * (1 - cos((float)iteration/30)), 128 * (1 + sin((float)iteration/30)));
  
  //Initials
  textAlign(CENTER);
  textSize(128);
  fill(128 * (1 + sin((float)iteration/30)), 128 * (1 + cos((float)iteration/30)), 128 * (1 - sin((float)iteration/30)));
  text("A", 160, 250);
  fill(128 * (1 + cos((float)iteration/30)), 128 * (1 + sin((float)iteration/30)), 128 * (1 - cos((float)iteration/30)));
  text("L", 240, 250);
  
  //Author
  fill(0);
  textAlign(LEFT);
  textSize(16);
  text("Author: Akash Levy", 5, 395);
  
  //Draw Bot 1
  translate(bot1Coord[0], bot1Coord[1]);
  fill(128,128,128);
  rect(0,30,20,100);
  fill(121,196,57);
  ellipse(0,0,60,60);
  fill(197,56,62);
  ellipse(-19,0,16,32);
  ellipse(19,0,16,32);
  line(-10,80,-20,90);
  line(10,80,20,90);
  translate(-bot1Coord[0], -bot1Coord[1]);
  
  //Draw Bot 2
  translate(bot2Coord[0], bot2Coord[1]);
  fill(128,128,128);
  rect(0,30,20,100);
  fill(121,196,57);
  ellipse(0,0,60,60);
  fill(197,56,62);
  ellipse(-19,0,16,32);
  ellipse(19,0,16,32);
  line(-10,80,-20,90);
  line(10,80,20,90);
  translate(-bot2Coord[0], -bot2Coord[1]);
  
  //Draw Bot 3
  translate(bot3Coord[0], bot3Coord[1]);
  fill(255,255,0);
  rect(0,30,20,100);
  fill(240,70,100);
  ellipse(0,0,60,60);
  fill(50,70,160);
  ellipse(-19,0,16,32);
  ellipse(19,0,16,32);
  line(-10,80,-20,90);
  line(10,80,20,90);
  translate(-bot3Coord[0], -bot3Coord[1]);
  
  //Draw Bot 4
  translate(bot4Coord[0], bot4Coord[1]);
  fill(255,255,0);
  rect(0,30,20,100);
  fill(240,70,100);
  ellipse(0,0,60,60);
  fill(50,70,160);
  ellipse(-19,0,16,32);
  ellipse(19,0,16,32);
  line(-10,80,-20,90);
  line(10,80,20,90);
  translate(-bot4Coord[0], -bot4Coord[1]);
  
  //Move Bot 1
  if (botOn[0])
  {
    if (bot1Coord[0] < -30)
      bot1Coord[0] = 430;
    if (bot1Coord[1] < -90)
      bot1Coord[1] = 430;
    if (bot1Coord[0] > 430)
      bot1Coord[0] = -30;
    if (bot1Coord[1] > 430)
      bot1Coord[1] = -90;
    angle[0] += random(-1,1)/5;
    bot1Coord[0] += speed[0]*sin(angle[0]);
    bot1Coord[1] += speed[0]*cos(angle[0]);
  }

  //Move Bot 2
  if (botOn[1])
  {
    if (bot2Coord[0] < -30)
      bot2Coord[0] = 430;
    if (bot2Coord[1] < -90)
      bot2Coord[1] = 430;
    if (bot2Coord[0] > 430)
      bot2Coord[0] = -30;
    if (bot2Coord[1] > 430)
      bot2Coord[1] = -90;
    angle[1] += random(-1,1)/5;
    bot2Coord[0] += speed[1]*sin(angle[1]);
    bot2Coord[1] += speed[1]*cos(angle[1]);
  }
  
  //Move Bot 3
  if (!botOn[2])
  {
    if (bot3Coord[0] < 30)
    {
      bot3Speed[0] *= -1;
      bot3Coord[0] = 30;
    }
    if (bot3Coord[1] < 30)
    {
      bot3Speed[1] *= -1;
      bot3Coord[1] = 30;
    }
    if (bot3Coord[0] > 370)
    {
      bot3Speed[0] *= -1;
      bot3Coord[0] = 370;
    }
    if (bot3Coord[1] > 310)
    {
      bot3Speed[1] *= -1;
      bot3Coord[1] = 310;
    }
    bot3Coord[0] += bot3Speed[0];
    bot3Coord[1] += bot3Speed[1];
    bot3Speed[0] *= bot3Friction;
    bot3Speed[1] *= bot3Friction;
  }
  
  //Move Bot 4
  if (!botOn[3])
  {
    if (bot4Coord[0] < 30)
    {
      bot4Speed[0] *= -1;
      bot4Coord[0] = 30;
    }
    if (bot4Coord[1] < 30)
    {
      bot4Speed[1] *= -1;
      bot4Coord[1] = 30;
    }
    if (bot4Coord[0] > 370)
    {
      bot4Speed[0] *= -1;
      bot4Coord[0] = 370;
    }
    if (bot4Coord[1] > 310)
    {
      bot4Speed[1] *= -1;
      bot4Coord[1] = 310;
    }
    bot4Coord[0] += bot4Speed[0];
    bot4Coord[1] += bot4Speed[1];
    bot4Speed[0] *= bot4Friction;
    bot4Speed[1] *= bot4Friction;
  }
  
  //New iteration
  oldMouseX = mouseX;
  oldMouseY = mouseY;
  iteration++;
}

boolean withinRectangle(float rectX, float rectY, float rectW, float rectH, int x, int y)
{
  if ((x < (rectX - rectW/2)) || (x > (rectX + rectW/2)) || (y < (rectY - rectH/2)) || (y > (rectY + rectH/2)))
    return false;
  else
    return true;
}

void mousePressed()
{
  if (withinRectangle(bot1Coord[0], bot1Coord[1]+30, 20, 100, mouseX, mouseY))
    botOn[0] = !botOn[0];
  if (withinRectangle(bot2Coord[0], bot2Coord[1]+30, 20, 100, mouseX, mouseY))
    botOn[1] = !botOn[1];
  if (withinRectangle(bot3Coord[0], bot3Coord[1]+30, 20, 100, mouseX, mouseY))
    botOn[2] = !botOn[2];
  if (withinRectangle(bot4Coord[0], bot4Coord[1]+30, 20, 100, mouseX, mouseY))
    botOn[3] = !botOn[3];
}

void mouseReleased()
{
  if (botOn[2])
  {
    bot3Speed[0] = (mouseX - oldMouseX)/2;
    bot3Speed[1] = (mouseY - oldMouseY)/2;
  }
  if (botOn[3])
  {
    bot4Speed[0] = (mouseX - oldMouseX)/2;
    bot4Speed[1] = (mouseY - oldMouseY)/2;
  }
  botOn[2] = false;
  botOn[3] = false;
}

void mouseDragged()
{
  if (botOn[2])
  {
    bot3Coord[0] += (mouseX-oldMouseX);
    bot3Coord[1] += (mouseY-oldMouseY);
  }
  if (botOn[3])
  {
    bot4Coord[0] += (mouseX-oldMouseX);
    bot4Coord[1] += (mouseY-oldMouseY);
  }
}


