
// HW7 Computing for the Arts with Processing
// Copyright 2012 Tony Zhang
// with code from http://wiki.processing.org/index.php/Robot_class

// Keyboard input: Menu options, spacebar to fire laser.
// Mouse input: Move mouse to move spaceship.
// Time will be added after hitting 20 and 40 targets!
// WARNING: Do not collide spaceship with targets. Moving the spaceship outside of the white boundary will erase your score.

int count, shotsFired;
int startTime, gameTime;
int gamePhase;
float easingCircleX, easingCircleY, distX, distY, easingCoefficient;
float t, s;
color targetColor;
float mxOffset, originalX;
float x, y, diam, xSpeed, ySpeed;
int x1, y1;
PImage ship;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.Rectangle;
Robot robot;
Rectangle r;

void setup( )
{
  size( 400, 700 );
  textSize( 12 );
  textAlign( CENTER );
  fill( 255 );

  count = 0;
  shotsFired = 0;
  startTime = 0;
  gamePhase = 0; 

  ship = loadImage("ship.png");

  easingCircleX = width/2; 
  easingCircleY = height/2;
  easingCoefficient = .06;

  noCursor();
  smooth();

  //target initial settings
  xSpeed = random(1, 4);
  ySpeed = random(-4, -1);
  x = random( width*.25, width*.75 );
  y = random( 0, height*.4 );
  diam = random( 10, 50 );
  targetColor = color( random( 255), random(255), random(255) );
  
  mxOffset = 0;
  originalX = 0; 

  //mouse wrapping setup
  try { 
    robot = new Robot();
  } 
  catch (AWTException e) {
    e.printStackTrace();
  }
}

void draw( )
{
  back( ); //background

  if ( gamePhase == 0 )
  {
    showInstructions( );
  }
  else if ( gamePhase == 1 )
  {
    playGame( );
  }
  else 
  {
    score( );
  }
}

void score( ) //game over screen
{
  fill( 255, 0, 0 );
  text("GAME OVER", width/2, height*.2 );
  text("You hit " + count + " targets.", width/2, height/2);
  text("You fired " + shotsFired + " times.", width/2, .6*height);
  text("Press Enter to Restart", width/2, height*.8);
}

void back( ) //background
{
  pushStyle();
  fill(0, 0, 0, 50); 
  rect(0, 0, width, height);
  popStyle();
}

void levelTwo( ) //receive more time if you hit 20 targets!
{
  if (count > 20)
  {
    text("Speed Up!", width/2, height*.13);
    gameTime = 70000;
  }
  if (count > 40)
  {
    gameTime = 90000;
  }
}

void checkTime( ) //time remaining
{
  fill( 255, 0, 0 );
  text( "Time Remaining: " + ( gameTime/1000 - ((millis( ) - startTime))/1000), .5*width, .04*height );
  if ( (millis( )-startTime) > gameTime )
  {
    gamePhase = 2;
  }
}

void showScore( ) //current score
{
  fill( 255 );
  text( "Targets Destroyed " + count, .5*width, height*.97);
}

void checkLaserhit( ) //did the laser hit the target? (does the x position of the laser coincide with the x position of the target?
{
  if (keyPressed == true && key == ' ' && mouseY > y)
  {
    float d = dist( x, x, easingCircleX, easingCircleX);
    if ( d <= (diam/2)+3 )
    {
      count++;
      fill( 255, 0, 0, 150);
      rect( 0, 0, width, height );
      xSpeed = random(1, 4);
      ySpeed = random(-4, 1);
      x = random( width*.25, width*.75 );
      y = random( 20, height*.4 );
      diam = random( 10, 50 );
      targetColor = color( random( 255), random(255), random(255) );
    }
  }
}

void checkHit( ) //did you crash your spaceship into the target?
{
  float d = dist( x, y, easingCircleX-15, easingCircleY);
  float c = abs(d);
  if ( c <= (diam/2)+7)
  {
    fill( 255, 0, 0 );
    rect( 0, 0, width, height );
    gamePhase = 2;
    xSpeed = random(1, 4);
    ySpeed = random(-4, -1);
    x = random( 100, width*.75 );
    y = random( 0, height*.64 );
    diam = random( 10, 50 );
    targetColor = color( random( 255), random(255), random(255) );
  }
}

void drawSpaceship( ) //eased spaceship
{
  distX = mouseX - easingCircleX; 
  distY = mouseY - easingCircleY;
  easingCircleX = easingCircleX + (distX * easingCoefficient);
  easingCircleY = easingCircleY + (distY * easingCoefficient);
  image(ship, easingCircleX-15, easingCircleY);
}

void fireLaser( ) //the number of times the laser is fired will be counted. the lower the better!
{
  pushStyle();
  stroke(255);
  strokeWeight(3);
  line(easingCircleX, easingCircleY, easingCircleX, 0);
  shotsFired++;
  popStyle();
}

void drawBoundary( ) //wrapping boundary for the spaceship
{
  pushStyle();
  stroke(255);
  strokeWeight(1);
  line(.125*width, .07*height, .875*width, .07*height);
  line(.125*width, .93*height, .875*width, .93*height);
  line(.125*width, .07*height, .125*width, .93*height);
  line(.875*width, .07*height, .875*width, .93*height);
  popStyle();
}

void drawTarget( ) //size and color of the targets
{
  fill(targetColor) ;
  ellipse( x, y, diam, diam );
}

void moveTarget( ) //bounce target
{
  x = x + xSpeed;
  y = y + ySpeed;
  if (x - diam*.5 < 0 || x + diam*.5 > width)
  {
    xSpeed = -xSpeed;
  }

  if (y - diam*.5 < 0 || y + diam*.5 > height)
  {
    ySpeed = -ySpeed;
  }
}

void wrapShip( ) //wrapping of the ship. for wrapping horizontally, the mouse position will be changed by the sketch.
{
  r = frame.getBounds( );
  mxOffset = r.x - originalX;

  if (easingCircleX > width*.877) //hits right
  {
    easingCircleX = width*.126;
    int i = int(easingCircleY+20);
    t = r.width;
    int g = int (t-330+mxOffset);
    robot.mouseMove(g, i);
    count = 0;
  }

  else if (easingCircleX < .124*width) //hits left
  {
    easingCircleX = width*.874;
    int i = int(easingCircleY);
    t = r.width;
    int g = int (t - 60 + mxOffset);
    robot.mouseMove(g, i);
    count = 0;
  }

  if (easingCircleY > height*.92) //hits bottom
  {
    easingCircleY = 50;
    count = 0;
  }

  else if (easingCircleY < 50) //hits top
  {
    easingCircleY = height*.92;
    count = 0;
  }
}

void playGame( )
{
  drawBoundary( );
  drawTarget( );
  moveTarget( );
  levelTwo( );
  drawSpaceship( );
  wrapShip( );
  checkLaserhit( );
  checkHit( );
  showScore( );
  checkTime( );
}

void showInstructions( ) //menu screen
{
  text( "Select Difficulty", width/2, height*.21 ); 
  text("Press 1 - Easy", width/2, height*.5 );
  text("Press 2 - Medium", width/2, height*.57 );
  text("Press 3 - Hard", width/2, height*.64 );
}

void keyPressed( ) //menu selection and gun controls
{
  if (key == '1' && gamePhase == 0)
  {
    gamePhase = 1;
    startTime = millis();
    gameTime = 60000;
    count = 0;
    shotsFired = 0;
  }
  if (key == '2' && gamePhase == 0)
  {
    gamePhase = 1;
    startTime = millis();
    gameTime = 30000;
    count = 0;
    shotsFired = 0;
  }
  if (key == '3' && gamePhase == 0)
  {
    gamePhase = 1;
    startTime = millis();
    gameTime = 10000;
    count = 0;
    shotsFired = 0;
  }
  if (gamePhase == 1 && key == ' ')  
  {
    fireLaser();
  }
  if (key == ENTER && gamePhase == 2)
  {
    gamePhase = 0;
  }
  if (key == 'd' )
  {
   println (r.width+"  "+ r.x + "  " + mouseX);  
  }
}


