

import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="teamRaccoon";
String description ="Client that sends and receives range messages. Range values go from 0 to 1023.";

Spacebrew sb;

int local_slider_val = 512;
int remote_slider_val = 512;

int level;  

PImage webImg;

//Ball Parameters
float ballX;
float ballY;
float ballXVel;
float ballYVel;
float ballSize; //Diameter (not radius).
float offScreenMargin; //Distance between edge of screen and paddle.
float ballMaxSpeed; //Ball can't go faster than this.
float ballMinSpeed; //Ball can't go slower than this.

//We'll use a float that increases every frame to time how long the ball stays
//in play:
float timeCount=0;
//Paddle Parameters
int paddleWidth = 20;
int paddleHeight = 100;
int paddleSpeed = 5; //How quickly the paddle moves at your command.

//We'll use an integer to track how many times you bounce the ball before
//losing it:

int score = 0;
//Left Paddle
int p1X;
int p1Y;

//Right Paddle
int p2X;
int p2Y;

//Top Paddle
int p3X;
int p3Y; 

//Bottom Paddle
int p4X;
int p4Y;

//We'll use booleans to enable and disable movement for each paddle:
boolean p1UP = false;
boolean p1DOWN = false;

boolean p2UP = false;
boolean p2DOWN = false;

boolean p3LEFT = false;
boolean p3RIGHT = false;

boolean p4LEFT = false;
boolean p4RIGHT = false;

void setup() {
 
  size(700, 700); 
  sb = new Spacebrew( this );
  sb.addPublish( "local_slider", "range", local_slider_val ); 
  sb.addSubscribe( "remote_slider", "range" ); 
  sb.connect(server, name, description );
  
  String url = "http://1.bp.blogspot.com/-4DhjS8URHbc/Uu6i4YjD1II/AAAAAAAAAlg/66hL2Qs1lQ0/s1600/field.png";
  webImg = loadImage(url, "png");
  
  frameRate(60); //60 frames per second (we use this knowledge for our timer).
  smooth(); 
  
  p1X = 10;                         //10 from the screen's left edge.
  p1Y = height/2-paddleHeight/2;    //This centers the paddle vertically.

  p2X = width-paddleWidth-10;       //10 from the screen's right edge.
  p2Y = height/2-paddleHeight/2;    //This centers the paddle vertically.

  p3X = width/2-paddleHeight/2;     //This centers the paddle horizontally.
  p3Y = 10;                         //10 from the screen's top edge.

  p4X = width/2-paddleHeight/2;     //This centers the paddle horizontally.
  p4Y = height-paddleWidth-10;      //10 from the screen's bottom edge.

  ballX=width/2; //Horizontal center.
  ballY=height/2; //Vertical center.
  
  ballXVel=random(-3, 3); //Random speed between the two values.
  ballYVel=random(-3, 3);
  
  ballSize=50;
  offScreenMargin = 500;
  ballMaxSpeed = 15;
  ballMinSpeed = 1;
}

void draw() {

  //NOTICE THAT everything in the Draw function is encased inside a conditional
  //("if") statement. That's because we're only drawing certain things,
  //depending on the value of our game-controlling "level" variable.
  
  //TITLE SCREEN
  if (level==0) {
    image(webImg, 0, 0);
    //background(0);
    textSize(30);
    text("-Press Any Key to Start-", width/2-160, height/2+200);
    textSize(40);
    text("RACCOON'S ATTACK", width/2-200, height/2);
    if (keyPressed) level=1; //Here we change the value of the level variable,
    //cueing the Draw function to move on to the next section, below.
  }

  //GAME ON
  if (level==1) { //Now we draw the actual gameplay.
    //background(0);
    image(webImg, 0, 0);
    //First, draw some UI elements:

    //"Score"
    textSize(32);
    text("Time: ", width/2-90, height/2-5);
    text(timeCount/60, width/2, height/2-5);
    text("Score: " + score, width/2-60, height/2+35);
    timeCount++; // We want to display the time passing, preferably in seconds,
    //so we add one to the variable every frame. We know that the Draw function
    //runs 60 times per second (because we set the frameRate above) so we
    //divide the variable by 60 when displaying it as text. That yields seconds.

    //Draw the Paddles (remember to flip the width and height for the
    //top and bottom paddles):
    rect(p1X, p1Y, paddleWidth, paddleHeight);
    rect(p2X, p2Y, paddleWidth, paddleHeight);
    //rect(p3X, p3Y, paddleHeight, paddleWidth);
    rect(p4X, p4Y, paddleHeight, paddleWidth);
    //Draw the ball:
    ellipse(ballX, ballY, ballSize, ballSize);

    //Update the Ball's position using its velocity:
    ballX+=ballXVel;
    ballY+=ballYVel;

    //If the ball goes too far offscreen, "reset" it to the center of the screen
    //with a new, random x- and yVel. We use an off-screen margin to prevent the
    //ball from reappearing too quickly:
    if (ballX>width+offScreenMargin || ballX<-offScreenMargin || ballY<-offScreenMargin || ballY>height+offScreenMargin) {
      ballX=width/2;
      ballY=height/2;
      ballXVel=random(-3, 3);
      ballYVel=random(-3, 3);
      //Also reset the timer and score counter:
      timeCount=0;
      score=0;
    }
    //COLLISION DETECTION!! Woo! We need to detect if the ball overlaps with the
    //paddle, then reverse the ball's direction appropriately. We'll have to do
    //this for each paddle. The commented notes in the first paddle are the same
    //for all the paddles.
    
    // PADDLE 1
    if (ballX-ballSize/2 <= p1X+paddleWidth && //Left edge of ball must be left of right edge of paddle.
    ballX+ballSize/2 >= p1X &&                  //Right edge of ball must be right of left edge of paddle. 
    ballY+ballSize/2 >= p1Y &&                  //Bottom edge of ball must be below top edge of paddle.
    ballY-ballSize/2 <= p1Y+paddleHeight) {     //Top edge of ball must be above bottom edge of paddle.
      ballXVel *= -1.2;      //Reverse (and accelerate) only the velocity that makes sense (not both vels).
      score++;                //Add one to the score.
    }

    // PADDLE 2
    if (ballX-ballSize/2 <= p2X+paddleWidth &&
    ballX+ballSize/2 >= p2X &&
    ballY+ballSize/2 >= p2Y &&
    ballY-ballSize/2 <= p2Y+paddleHeight) {
      ballXVel *= -1.2;
      score++;
    }

    // PADDLE 3 (remember we must flip width and height)
    if (ballX-ballSize/2 <= p3X+paddleHeight &&
    ballX+ballSize/2 >= p3X &&
    ballY+ballSize/2 >= p3Y &&
    ballY-ballSize/2 <= p3Y+paddleWidth) {
      ballYVel *= -1.2;
      score++;
    }

    // PADDLE 4 (remember we must flip width and height)
    if (ballX-ballSize/2 <= p4X+paddleHeight &&
    ballX+ballSize/2 >= p4X &&
    ballY+ballSize/2 >= p4Y &&
    ballY-ballSize/2 <= p4Y+paddleWidth) {
      ballYVel *= -1.2;
      score++;
    }

    // Limit the ball speed so it doesn't get too fast for the collision
    // detection by resetting it to the max when it gets bigger than the max:
    if (ballXVel > ballMaxSpeed) ballXVel = ballMaxSpeed;
    if (ballYVel > ballMaxSpeed) ballYVel = ballMaxSpeed;
    if (ballXVel < -ballMaxSpeed) ballXVel = -ballMaxSpeed;
    if (ballYVel < -ballMaxSpeed) ballYVel = -ballMaxSpeed;
    
    // Limit the ball speed so it doesn't go too slowly (this is a risk when
    // you use random with a range that includes zero). If the speed is too
    // small, we increase it:
    if (ballXVel > -ballMinSpeed && ballXVel < 0) ballXVel-=0.1;
    if (ballYVel > -ballMinSpeed && ballYVel < 0) ballYVel-=0.1;
    if (ballXVel < ballMinSpeed && ballXVel > 0) ballXVel+=0.1;
    if (ballYVel < ballMinSpeed && ballYVel > 0) ballYVel+=0.1;


    //MOVEMENT!!!!
    
    //As previously mentioned, we use booleans to control movement, switching
    //them on and off with the key press and release. We do this because if
    //we moved the paddles directly with the key press, holding down the button
    //would only move the paddle one increment. You'd have to keep tapping the
    //button to move, and there'd be no fluidity. That's because the operating
    //system doesn't recognize repeated calls to the key's function when you
    //hold it down. The boolean only has to be triggered once, though, and then
    //the conditional statements in the Draw function keep the paddle moving.
    
    if (p1UP==true) {
      p1Y -= paddleSpeed;
    }

    if (p1DOWN==true) {
      p1Y += paddleSpeed;
    }

    if (p2UP==true) {
      p2Y -= paddleSpeed;
    }
    if (p2DOWN==true) {
      p2Y += paddleSpeed;
    }

    if (p3LEFT==true) {
      p3X -= paddleSpeed;
    }
    if (p3RIGHT==true) {
      p3X += paddleSpeed;
    }

    if (p4LEFT==true) {
      p4X -= paddleSpeed;
    }
    if (p4RIGHT==true) {
      p4X += paddleSpeed;
    }
  }
}

void keyPressed() {
  //PADDLE ONE (LEFT)
  if (key=='w' || key=='W') {
    p1UP = true;
  }
  if (key=='s' || key=='S') {
    p1DOWN = true;
  } 

  //PADDLE TWO(RIGHT)
  if (key==CODED) {
    if (keyCode==UP) {
      p2UP = true;
    }
    if (keyCode==DOWN) {
      p2DOWN = true;
    }
  }

  //PADDLE THREE (TOP)
  if (key=='a' || key=='A') {
    p3LEFT = true;
  }
  if (key=='d' || key=='D') {
    p3RIGHT = true;
  }
  //PADDLE FOUR (DOWN)
  if (key==CODED) {
    if (keyCode==LEFT) {
      p4LEFT = true;
    }
    if (keyCode==RIGHT) {
      p4RIGHT = true;
    }
  }
}

void keyReleased() {
  //PADDLE ONE (Left)
  if (key=='w' || key=='W') {
    p1UP = false;
  }
  if (key=='s' || key=='S') {
    p1DOWN = false;
  }  


  //PADDLE TWO(RIGHT)
  if (key==CODED) {

    if (keyCode==UP) {
      p2UP = false;
    }
    if (keyCode==DOWN) {
      p2DOWN = false;
    }
  }

  //PADDLE THREE (TOP)
  if (key=='a' || key=='A') {
    p3LEFT = false;
  }
  if (key=='d' || key=='D') {
    p3RIGHT = false;
  }

  //PADDLE FOUR (DOWN)

  if (key==CODED) {
    if (keyCode==LEFT) {
      p4LEFT = false;
    }
    if (keyCode==RIGHT) {
      p4RIGHT = false;
    }
  }
}

