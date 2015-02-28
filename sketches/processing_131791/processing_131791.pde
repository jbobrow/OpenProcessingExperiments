
// Original Author - "Pong" by Matthew Griffis & Anthony Marefat @ Game Design Dorkshop in 2013
// http://goo.gl/vCqAii
// *do not delete the line above

// [NOTE]Unfinished project
// need to add Publishers - raccoon; start key; when someone loses...
// Feb 3, 2014

import gifAnimation.*;
import spacebrew.*;

int Player1_Life=4, Player2_Life=4, Player3_Life=4;

String server="sandbox.spacebrew.cc";
String name="teamRaccoon_w";  //Client Name
String description ="Slider range";

Spacebrew sb;

// Keep track of our current place in the range
int player_slider; //sending value, a variable 

int level;  
PImage bgImage;
PImage Player1_Image;
PImage Player2_Image;
PImage Player3_Image; 
Gif raccoon;

//Array
PImage[] Player1_Nuts =new PImage[5];
PImage[] Player2_Nuts  =new PImage[5];
PImage[] Player3_Nuts =new PImage[5];

PImage Player1_lose;
PImage Player2_lose;
PImage Player3_lose;

//Ball Parameters
float ballX;
float ballY;
float ballXVel;
float ballYVel;
float ballSize; //Diameter (not radius).
float offScreenMargin; //Distance between edge of screen and paddle.
float ballMaxSpeed; //Ball can't go faster than this.
float ballMinSpeed; //Ball can't go slower than this.

//We'll use a float that increases every frame to time how long the ball stays in play:
//Paddle Parameters
int paddleWidth = 20;
int paddleHeight = 200;
int paddleSpeed = 5; //How quickly the paddle moves at your command.

//Left Paddle
int p1X;
int p1Y;

//Right Paddle
int p2X;
int p2Y;

//Bottom Paddle
int p3X;
int p3Y;

//Top Paddle
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

  size(900, 700); 

  ////////////////////
  sb = new Spacebrew( this );
  //
  sb.addPublish( "Play", "range", player_slider ); 
  //
  sb.addSubscribe( "Player_1", "range" ); 
  sb.addSubscribe( "Player_2", "range" ); 
  sb.addSubscribe( "Player_3", "range" ); 
  //
  sb.connect(server, name, description );
  ////////////////////

  bgImage=loadImage("bgImage.jpg");
  Player1_Image=loadImage("players/Player1.png");
  Player2_Image=loadImage("players/Player2.png");
  Player3_Image=loadImage("players/Player3.png");

  Player1_lose =loadImage("lose/Player1_lose.jpg");
  Player2_lose=loadImage("lose/Player2_lose.jpg");
  Player3_lose=loadImage("lose/Player3_lose.jpg");


  for (int i = 1; i <= 5; i = i+1) {
    Player1_Nuts[i-1]=loadImage("nuts/a-"+i+".png");
    Player2_Nuts[i-1]=loadImage("nuts/b-"+i+".png");
    Player3_Nuts[i-1]=loadImage("nuts/c-"+i+".png");
  }

  raccoon = new Gif(this, "raccoon.gif");
  raccoon.loop();

  frameRate(60); //60 frames per second (we use this knowledge for our timer).
  smooth(); 

  p1X = 10+50;                         //10 from the screen's left edge.
  p1Y = height/2-paddleHeight/2;    //This centers the paddle vertically.

  p2X = width-paddleWidth-10-50;       //10 from the screen's right edge.
  p2Y = height/2-paddleHeight/2;    //This centers the paddle vertically.

  p3X = width/2-paddleHeight/2;     //This centers the paddle horizontally.
  p3Y = height-paddleWidth-10-50;      //10 from the screen's bottom edge.

  p4X = width/2-paddleHeight/2;     //This centers the paddle horizontally.
  p4Y = 10;                         //10 from the screen's top edge.

  ballX=width/2; //Horizontal center.
  ballY=50; //Vertical center.

  ballXVel=random(-1, 1)>0?random(4, 6):random(-4, -6);
  ballYVel=random(4, 6);

  ballSize=100;
  offScreenMargin = 100;
  ballMaxSpeed = 15;
  ballMinSpeed = 1;
}

void draw() {

  //NOTICE THAT everything in the Draw function is encased inside a conditional
  //("if") statement. That's because we're only drawing certain things,
  //depending on the value of our game-controlling "level" variable.

  //TITLE SCREEN
  if (level==0) {
    image(bgImage, 0, 0);
    textSize(30);
    text("-Press Any Key to Start-", width/2-170, height/2+200);
    textSize(40);
    text("RACCOON'S ATTACK", width/2-200, height/2);
    if (keyPressed) level=1;
  }

  if (level==2) {
    fill(255, 0, 0);
    textSize(40);
    text("Raccoon Attack Victim Q_Q", width/2-250, height/2-250);
    if (keyPressed) level=0;
  }


  //GAME ON
  if (level==1) { //Now we draw the actual gameplay.
    image(bgImage, 0, 0);

    //so we add one to the variable every frame. We know that the Draw function
    //runs 60 times per second (because we set the frameRate above) so we
    //divide the variable by 60 when displaying it as text. That yields seconds.
    //Draw the Paddles (remember to flip the width and height for the
    //top and bottom paddles):

    fill(0, 0, 0, 0);
    rect(0, 0, width, paddleWidth);

    fill(100);
    noStroke();
    rect(p1X, p1Y, paddleWidth, paddleHeight);
    rect(p2X, p2Y, paddleWidth, paddleHeight);
    rect(p3X, p3Y, paddleHeight, paddleWidth);

    //Draw the ball:
    image(raccoon, ballX, ballY);

    Player1_Image.resize(75, 75);
    Player2_Image.resize(70, 70);
    Player3_Image.resize(70, 70);
    image(Player1_Image, p1X-10, p1Y+50);
    image(Player2_Image, p2X-40, p2Y+50);
    image(Player3_Image, p3X+60, p3Y-40);

    imageMode(CENTER);
    image(Player1_Nuts[Player1_Life], p1X-30, height/2);
    image(Player2_Nuts[Player2_Life], p2X+50, height/2);
    image(Player3_Nuts[Player3_Life], width/2, p3Y+50);
    imageMode(CORNER);

    //Update the Ball's position using its velocity:
    ballX+=ballXVel;
    ballY+=ballYVel;

    //If the ball goes too far offscreen, "reset" it to the center of the screen
    //with a new, random x- and yVel. We use an off-screen margin to prevent the
    //ball from reappearing too quickly(RESET):
    if (ballX>width+offScreenMargin || ballX<-offScreenMargin || ballY<-offScreenMargin || ballY>height+offScreenMargin) {

      imageMode(CENTER);
      if (ballX<-offScreenMargin) {
        if (Player1_Life>0) {
          Player1_Life--;
        }
        else {
          level=2;
          image(Player1_lose, width/2, height/2);
        }
      }

      if (ballX>width+offScreenMargin) {
        if (Player2_Life>0) {
          Player2_Life--;
        }
        else {
          level=2;
          image(Player2_lose, width/2, height/2);
        }
      }

      if (ballY>height+offScreenMargin) {
        if (Player3_Life>0) {
          Player3_Life--;
        }
        else {
          level=2;
          image(Player3_lose, width/2, height/2);
        }
      }
      imageMode(CORNER);

      ballX=width/2;
      ballY=50;
      ballXVel=random(-1, 1)>0?random(4, 6):random(-4, -6);
      ballYVel=random(4, 6);
    }


    //COLLISION DETECTION

    // PADDLE 1
    if (ballX <= p1X+paddleWidth && //Left edge of ball must be left of right edge of paddle.
    ballX+ballSize/2 >= p1X &&                  //Right edge of ball must be right of left edge of paddle. 
    ballY+ballSize/2 >= p1Y &&                  //Bottom edge of ball must be below top edge of paddle.
    ballY-ballSize/2 <= p1Y+paddleHeight&&
      ballXVel<0) 
    {     //Top edge of ball must be above bottom edge of paddle.
      ballXVel *= -1;      //Reverse (and accelerate) only the velocity that makes sense (not both vels).
    }

    // PADDLE 2
    if (ballX-ballSize/2 <= p2X+paddleWidth &&
      ballX+ballSize/2 >= p2X &&
      ballY+ballSize/2 >= p2Y &&
      ballY-ballSize/2 <= p2Y+paddleHeight&&
      ballXVel>0) 
    {
      ballXVel *= -1;
    }

    // PADDLE 3 (remember we must flip width and height)
    if (ballX-ballSize/2 <= p3X+paddleHeight &&
      ballX+ballSize/2 >= p3X &&
      ballY+ballSize/2 >= p3Y &&
      ballY-ballSize/2 <= p3Y+paddleWidth&&
      ballYVel>0) 
    {
      ballYVel *= -1;
    }

    // PADDLE 4 (remember we must flip width and height)
    if (
    ballY <= p4Y+paddleWidth&&
      ballYVel<0) 
    {
      ballYVel *= -1.1;
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

    //MOVEMENT 

    if (p1UP==true) {
      p1Y -= paddleSpeed;
      sb.send("Play", p1Y);
    }

    if (p1DOWN==true) {
      p1Y += paddleSpeed;
      sb.send("Play", p1Y);
    }

    if (p2UP==true) {
      p2Y -= paddleSpeed;
      sb.send("Play", p2Y);
    }
    if (p2DOWN==true) {
      p2Y += paddleSpeed;
      sb.send("Play", p2Y);
    }

    if (p3RIGHT==true) {
      p3X += paddleSpeed;
      sb.send("Play", p3X);
    }
    if (p3LEFT==true) {
      p3X -= paddleSpeed;
      sb.send("Play", p3X);
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

  //PADDLE THREE (DOWN)
  if (key==CODED) {
    if (keyCode==LEFT) {
      p3LEFT = true;
    }
    if (keyCode==RIGHT) {
      p3RIGHT = true;
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

  //PADDLE THREE (DOWN)
  if (key==CODED) {
    if (keyCode==LEFT) {
      p3LEFT = false;
    }
    if (keyCode==RIGHT) {
      p3RIGHT = false;
    }
  }
}

void onRangeMessage( String name, int value ) {

  println(name  + " received " + value );

  if (name.equals("Player_1"))
  {
    p1Y = value;
  } 
  else if (name.equals("Player_2"))
  {
    p2Y = value;
  }
  else if (name.equals("Player_3"))
  {
    p3X = value;
  }
}



