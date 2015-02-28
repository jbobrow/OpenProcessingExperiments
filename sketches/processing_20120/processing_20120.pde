
/*
Code by Diana Lange
www.diana-lange.de

This is an exercise to teach myself how to write a class. 

You can grab a ball and shoot with it.

Controls:

1 / 2 / 3 = toggle between color sets
Space = change background color
M = show / hide connections
N = show / hide crash location
B = create new set of balls
Right = add new ball
Left = remove a ball
Any key = pause

http://www.vimeo.com/19564417

*/

import processing.video.*;

MovieMaker mm;

boolean saveMov = false, showConnections = false, showCrashPoint = false, colorSetOne = true, colorSetTwo = false, colorSetThree = false, whiteBG = true, newColors = false;
int frameCounter = 0, movieLength = 1200;

float minS = 0.4, maxS = 1.5;
int amount = 30, numOfRecursition = 0;

ArrayList ballsList;

void setup ()
{
  size (800, 600);
  smooth();
  frameRate (25);
  
  ballsList = new ArrayList (amount);

  createBalls();
  checkOverLay();
}

void draw ()
{
  if (whiteBG) background (247);
  else background (5);

  moveBalls ();

  if (saveMov == true)
  {
    mm.addFrame();
    frameCounter++;
  }

  if (frameCounter >= movieLength)
  {
    saveMov = false;
    mm.finish();
    exit();
  }
}


void moveBalls ()
{
  for (int i = 0; i < amount; i++)
  {
    Ball checkBall = (Ball) ballsList.get(i);

    PVector mp = new PVector (mouseX, mouseY);
    boolean mouseisOverEllipse = checkBall.mouseDistance(mp.x, mp.y);
    boolean mouseIsPressed = checkBall.checkMousePress (mouseisOverEllipse, mousePressed);
    boolean mouseIsReleased_ = checkBall.checkMouseRelease (mouseisOverEllipse, mouseIsReleased);
    if (newColors) checkBall.createColorList();

    checkBall.shootWithMouse (mouseisOverEllipse, mouseIsPressed, mouseIsReleased_);
    checkBall.checkDistance (i, mouseIsPressed);
    if(keyPressed == false) checkBall.move(mouseIsPressed, mp);
    checkBall.display(mouseisOverEllipse, mouseIsPressed);
  }
  mouseIsReleased = false;
  newColors = false;
}

void createBalls()
{

  for (int i = 0; i < amount; i++)
  {
    float maxEllipseSize = (width+height) / 20;
    int ellipseSize = (int) random (50, maxEllipseSize);
    PVector startPoint = new PVector (random (ellipseSize/2, width-ellipseSize/2), random (ellipseSize/2, height-ellipseSize/2));
    PVector startSpeed = new PVector (random (-maxS, maxS), random (-maxS, maxS));

    float s = minS;

    if (startSpeed.x <= s && startSpeed.x >= 0) startSpeed.x = s+0.01;
    if (startSpeed.x < 0 && startSpeed.x >= -s) startSpeed.x = -s-0.01;
    if (startSpeed.y <= s && startSpeed.y >= 0) startSpeed.y = s+0.01;
    if (startSpeed.y < 0 && startSpeed.y >= -s) startSpeed.y = -s-0.01;

    int ellipseNum = (int) random (4, 10);
    ballsList. add ( new Ball (startPoint, startSpeed, ellipseNum, ellipseSize));
  }
}

void checkOverLay ()
{
  boolean overLayFound = false;
  for (int i = 0; i < amount; i++)
  {
    Ball checkBall = (Ball) ballsList.get(i);
    
    PVector cb =  checkBall.location;
    for (int j = 0; j < amount; j++)
    {
      Ball nextBall = (Ball) ballsList.get(j);
      
      PVector nb = nextBall.location;

      float distance = PVector.dist(cb, nb);
      float overLaydistance = checkBall.ellipseSize/2 + nextBall.ellipseSize/2;
      if (distance < overLaydistance && i != j)
      {
        float maxEllipseSize = (width+height) / 20;
        int ellipseSize = (int) random (50, maxEllipseSize);
        PVector startPoint = new PVector (random (ellipseSize/2, width-ellipseSize/2), random (ellipseSize/2, height-ellipseSize/2));
        PVector startSpeed = new PVector (random (-maxS, maxS), random (-maxS, maxS));

        float s = minS;

        if (startSpeed.x <= s && startSpeed.x >= 0) startSpeed.x = s+0.01;
        if (startSpeed.x < 0 && startSpeed.x >= -s) startSpeed.x = -s-0.01;
        if (startSpeed.y <= s && startSpeed.y >= 0) startSpeed.y = s+0.01;
        if (startSpeed.y < 0 && startSpeed.y >= -s) startSpeed.y = -s-0.01;

        int ellipseNum = (int) random (4, 10);
        ballsList. add ( new Ball (startPoint, startSpeed, ellipseNum, ellipseSize));
        numOfRecursition ++;
        overLayFound = true;
      }
    }
  }

  if (overLayFound == true && numOfRecursition < 40) checkOverLay ();
}


