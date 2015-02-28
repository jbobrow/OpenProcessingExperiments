
int xPos;                      //Position of the square
int speed=1;                   //How fast is it moving?
int xDir=1;                    //what direction is the ball going?
int score=0;                   //Inital score
int lives=5;                   //Number of lives you start with
boolean lost=false;            //Have you lost yet?

void setup()                   //Runs once when program launches
{
  background(60);
  size (400,400);
  smooth();
  xPos=width/2;                //Centers our square
  fill(204, 0, 0);              //Makes the ball and text green
  textSize(13);                //Sets the size of our text
}

void draw()                                      //Loops over and over again
{
  background(50, 50, 120);                       //blue background
  rect(xPos,height/2,40,40);                     //Draw the object
  xPos=xPos+(speed*xDir);                        //update the square's position 
  if (xPos > width-40 || xPos<0)                //Did the square hit the side?
  {
    xDir=-xDir;                                  //If it did reverse the direction
  }
  text("score = "+score,10,10);                  //Print the score on the screen
  text("lives = "+lives,width-80,10);            //Print remaining lives
  if (lives<=0)                                  //Check to see if you lost
  {
    textSize(20);
    text("Click to Restart", 125,100);
    noLoop();                                    //Stop looping at the end of the draw function
    lost=true;
    textSize(13);
  }
}

void mousePressed()                              //Runs whenever the mouse is pressed
{
  if (dist(mouseX, mouseY, xPos, 200)<=40)      //Did we hit the target?
  {
    score=score+speed;                           //Increase the speed
    speed=speed+1;                               //Increase the Score
  }
  else                                           //We missed
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
    lives=5;
    score=0;
    xPos=width/2;
    xDir=1;
    lost=false;
    loop();                                     //Begin looping draw function again
  }
}
