
import processing.opengl.*;

//Declaration of different float's and int's:

float duration;
int velocity;

int noteTimesValue;

//Paddles
float p1X; //Paddle 1 position on X-Axis
float p2X; //Paddle 2 position on Y-Axis
float w1, h1;

//Timer
int savedTime;
int totalTime = 60000;
int passedTime;

//Ball
int ball = 40;

float posX; //position of ball on X-Axis.
float posY; //position of ball on Y-Axis.

float speedX = 5; //moving X Position of ball.
float speedY = 8; //moving Y position of Ball.

int xHori = 1; //this is to move the ball on the X-Axis.
int yVert = 1; //this is to move the ball on the Y-Axis.

//Writing
PFont myChosenFont;
float y = 300;
float z = -100;
float x = 250;
float u = 5;

//Picture
PImage background;

PImage seg14;

PImage ending;

float r,g,b;
color tempColour, newColour;


void setup()
{
  size(500, 300, OPENGL);
  myChosenFont = loadFont("Verdana-Bold-48.vlw");
  textFont(myChosenFont, 40);
  textMode(MODEL);
  
  background = loadImage ("C:/Users/Dexter/Documents/Programming/TraceyTimoney_12146137_FinishedGame/data/bg.jpg"); 
  seg14 = loadImage("C:/Users/Dexter/Documents/Programming/TraceyTimoney_12146137_FinishedGame/data/segment14.jpg");
  ending = loadImage("C:/Users/Dexter/Documents/Programming/TraceyTimoney_12146137_FinishedGame/data/explosion.jpg");
  
  p1X = 10;
  p2X = 490;
  posX = width/2;
  posY = height/2;
  w1 = 20;
  h1 = 70;
  savedTime = millis();
  
  frameRate(60);
}
  
void draw ()
{
  background(0);
  drawTable(); //Background
  drawPaddles(); //Paddles
  drawBall(); //Ping Pong Ball
  gameTimer(); //Countdown Timer 
  ifYouMiss(); // reseting the ball to center
  gridDivision(); //dividing the screen into grids.
  
}

void drawTable() //This is the Background Function
{
  for (int i = 0; i < background.width; i++)
  {
    for (int j = 0; j < background.height; j++)
    if ((i < background.width/2) && (j < background.height/2)||(i> background.width/2) && (j > background.height/2))
    {
      tempColour = background.get (i, j);
      r = red(tempColour);
      g = green(tempColour);
      b = blue(tempColour);
      newColour = color(r,g,b);
      background.set(i, j, newColour);
    }
  }
  image (background, 0, 0, width, height);
  
  //Middle ellipses, for decoration purposes only.
  stroke (10);
  fill(0);
  ellipse(width/2, height/2, 40,40);
  fill(255);
  ellipse(width/2, height/2, 10,10); 
}

void gridDivision ()
{
  //Question 7B.
  float ellipseX, ellipseY;
  ellipseX = posX;
  ellipseY = posY;
    
  if ((ellipseX <= 125) && (ellipseY < 75))
    println ("Ellipse is in Segment Number 1");
    
  if ((ellipseX > 125 && ellipseX < 250) && (ellipseY <= 75))
    println ("Ellipse is in Segment Number 2");
    
  if ((ellipseX > 250 && ellipseX < 375) && (ellipseY <= 75))
    println ("Ellipse is in Segment Number 3");
    
  if ((ellipseX > 375 && ellipseX < 500) && (ellipseY <= 75))
    println ("Ellipse is in Segment Number 4");
       
  if ((ellipseX <= 125) && (ellipseX > 75 && ellipseY < 150))
    println ("Ellipse is in Segment Number 5");
    
  if ((ellipseX > 125 && ellipseX < 250) && (ellipseY > 75 && ellipseY < 150))
    println ("Ellipse is in Segment Number 6");
    
  if ((ellipseX > 250 && ellipseX < 375) && (ellipseY > 75 && ellipseY < 150))
    println ("Ellipse is in Segment Number 7");
   
  if ((ellipseX > 375 && ellipseX < 500) && (ellipseY > 75 && ellipseY < 150))
    println ("Ellipse is in Segment Number 8");
    
  if ((ellipseX <= 125) && (ellipseY > 150 && ellipseY < 225))
    println ("Ellipse is in Segment Number 9");
    
  if ((ellipseX > 125 && ellipseX < 250) && (ellipseY > 150 && ellipseY < 225))
    println ("Ellipse is in Segment Number 10");
    
  if ((ellipseX > 250 && ellipseX < 375) && (ellipseY > 150 && ellipseY < 225))
    println ("Ellipse is in Segment Number 11");
    
  if ((ellipseX >= 375 && ellipseX <= 500) && (ellipseY >= 150 && ellipseY <= 225))
    println ("Ellipse is in Segment Number 12");
    
  if ((ellipseX <= 125) && (ellipseY >= 225 && ellipseY <= 300))
    println ("Ellipse is in Segment Number 13");
    
  if ((ellipseX >= 125 && ellipseX <= 250) && (ellipseY >= 225 && ellipseY <= 300))
    println ("Ellipse is in Segment Number 14");
    
  if ((ellipseX >= 250 && ellipseX <= 375) && (ellipseY >= 225 && ellipseY <= 300))
    println ("Ellipse is in Segment Number 15");
    
  if ((ellipseX >= 375 && ellipseX  <= 500) && (ellipseY >= 225 && ellipseY <= 300))
    println ("Ellipse is in Segment Number 16");
  
   
  //Question 4D
  if ((ellipseX >= 125 && ellipseX <= 250) && (ellipseY >= 225 && ellipseY <= 300))
  {
    for (int i = 0; i < seg14.width; i++)
    {
      for (int j = 0; j < seg14.height; j++)
      if ((i < seg14.width/2) && (j < seg14.height/2)||(i> seg14.width/2) && (j > seg14.height/2))
      {
        tempColour = seg14.get (i, j);
        r = red(tempColour);
        g = green(tempColour);
        b = blue(tempColour);
        newColour = color(r,g,b);
        seg14.set(i, j, newColour);
      }
    }
    image (seg14, 0, 0, width, height); 
     
  } 
}


void drawPaddles() //This is where the coding for the Paddles lie
{
  //Question 2.
  
  //Paddle 1 has the appearance of the Red Lightsaber
  strokeWeight(20);
  stroke(255);
  strokeCap(ROUND);
  fill(0);
  line(p1X, posY + 35,p1X,posY + 60);
  
  strokeWeight(17);
  stroke(0);
  strokeCap(ROUND);
  fill(0);
  line(p1X, posY + 35,p1X,posY + 59);
  
  rectMode(CENTER);
  strokeWeight(1.5);
  stroke(255);
  fill(255,75,75);
  rect (p1X,posY, w1,h1 + u); 
    
  //Paddle 2 has the appearance of the Blue Lightsaber.
  strokeWeight(20);
  stroke(255);
  strokeCap(ROUND);
  fill(0);
  line(p2X, posY + 35,p2X,posY + 60);
  
  strokeWeight(17);
  stroke(0);
  strokeCap(ROUND);
  fill(0);
  line(p2X, posY + 35,p2X,posY + 59);
  
  strokeWeight(1.5);
  stroke(255);
  fill(75,75,255);
  rectMode(CENTER);
  rect(p2X,posY,20,70);
  
  //Coding for the paddle to hit the wall.
  if(posY == 30 || posY == height - 30)
  {
    speedY = speedY * -1;
  }
}

void drawBall() //This is where the coding for the Ball lies
{ 
   
  //Drawing Ball with the appearance of the Death Star.
  fill (150);
  noStroke();
  smooth();
  ellipse(posX,posY,ball,ball);
  
  strokeWeight(1.5);
  stroke(0,0,0,50);
  fill(130);
  smooth();
  ellipse(posX - 8, posY - 7, 10, 10);
  
  strokeWeight(1.5);
  stroke(0,0,0,50);
  line(posX - ball/2, posY, posX + ball/2, posY);
  
  
  
  //Moving Ball
  posX = posX + (speedX * xHori);
  posY = posY + (speedY * yVert);
  
  //Hitting ball of Top and Bottom
  if (posX > width || posX < 0) //On x - axis
  { 
    xHori *= -1;
  }
  
  if (posY > height || posY < 0) //On y - axis
  {
     yVert *= -1;
  }
  
    //For hitting the ball with Paddle 1.
   if ((posY > posY - 35 && posY < posY + 45) && (posX - 10 > p1X && posX - 10 < p1X + 25))
  {
    speedX = speedX * -1;
  }
  
  //For hitting the ball with Paddle 2.
  if ((posY > posY - 35 && posY < posY + 45) && (posX + 35 > p2X && posX + 35 < p2X + 45))
  {
    speedX = speedX * -1;
  }

}
 
void ifYouMiss() //This is where the coding for reseting the ball lies
{
  if ((posX - 10 < 0 ) || (posX + 10 > width))
  {
    posX = width/2;
    posY = height/2;
    xHori = 1;
    yVert = 1;
  }
}

void keyPressed() 
{
  //Question 1.
  if (keyCode == 'S')
  {
    if (looping)   noLoop();
    else           loop();
  }
  
  //Question 7A.
  float currentSpeedX, currentSpeedY;
  currentSpeedX = speedX;
  currentSpeedY = speedY;
  
  //Question 3.
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      currentSpeedX = currentSpeedX * xHori+ 5;
      currentSpeedY = currentSpeedY * yVert+ 5;
    }
    if (keyCode == LEFT)
    {
      currentSpeedX = currentSpeedX * xHori - 5;
      currentSpeedY = currentSpeedY * yVert - 5;
    }
  }
}

   
void gameTimer() //This is where the coding for the Timer lies
{
  passedTime  =  millis() - savedTime;
  if (passedTime > totalTime)
  {
    posX = 0;
    posY = 0;
    
    background(0);
    
    for (int i = 0; i < ending.width; i++)
    {
      for (int j = 0; j < ending.height; j++)
      if ((i < ending.width/2) && (j < ending.height/2)||(i> ending.width/2) && (j > ending.height/2))
      {
        tempColour = ending.get (i, j);
        r = red(tempColour);
        g = green(tempColour);
        b = blue(tempColour);
        newColour = color(r,g,b);
        ending.set(i, j, newColour);
      }
    }
    image (ending, 0, 0, width, height);   
     
    //Got this coding from: http://www.openprocessing.org/sketch/54577 and adjusted acordingly    background(0);
    rotateX(PI/5);
 
    //colouring
    stroke(3);
    strokeWeight(5);
    fill(255,255,0);
 
    //text 
    textAlign(CENTER);
    text("Times Up!", x, y, z);
    text("Thanks For Playing :)", x, y + 50, z);
    text("Play Again??", x, y + 100, z);
    text("Made by: Rebecca", x, y + 150, z);
    text(" Tracey-Timoney", x, y + 200, z);
    y--;  
  }
} 

