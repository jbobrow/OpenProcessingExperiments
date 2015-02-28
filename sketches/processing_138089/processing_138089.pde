
//This is my modified version of a simple ball game. This version actually simulates
//a bouncing ball that becomes more difficult to control as it speeds up. Set a high score!
//Original code by Steve Dickie.


int yPos;                      //Position of the ball
int speed=1;                   //How fast is it moving?
int yDir=1;                    //what direction is the ball going?
int score=0;                   //Inital score
int lives=10;                   //Number of lives you start with
boolean lost=false;            //Have you lost yet?

void setup()                   //Runs once when program launches
{
  size (600,600);
  smooth();
  yPos=height/2;                //Centers our ball
  fill(#FEFF00);               //Makes the ball and text yellow
  textSize(18);                //Sets the size of text
}

void draw()                                      //Loops over and over again
{
  background (0);                                //Black background
  ellipse(width/2, yPos,40,40);                 //Draw the ball
  yPos=yPos+(speed*yDir);                        //update the ball's position 
  if (yPos > height-20 || yPos<20)                //Did the ball hit the side?
  {
    yDir=-yDir;                                  //If it did reverse the direction
  }
  text("score = "+score,20,30);                  //Print the score on the screen
  text("lives = "+lives,width-100,30);            //Print remaining lives
  if (lives<=0)                                  //Check to see if you lost
  {
    textSize(20);
    text("Try Again? (Click to Reset)", 125,100);
    noLoop();                                    //Stop looping at the end of the draw function
    lost=true;
    textSize(18);
  }
}

void mousePressed()                              //Runs whenever the mouse is pressed
{
  if (dist(mouseX, mouseY, 300, yPos)<=20)      //Did we hit the target?

  {
    score=score+speed;                           //Increase the speed
    speed=speed+1;                               //Increase the Score
  }
  else                                           // missed
  {
    if (speed<1)                                 //If speed is greater than 1 decrease the speed
    {
    speed=speed-1;
    }
    lives=lives-1;                               //Take away one life
  }
  if (lost==true)                                //If we lost the game, reset now and start over 

  {
    speed=1;                                     //Reset all variables to initial conditions
    lives=10;
    score=0;
    yPos=height/2;
    yDir=1;
    lost=false;
    loop();                                     //Begin looping draw function again
  }
}




