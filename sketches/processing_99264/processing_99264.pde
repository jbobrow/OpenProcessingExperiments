
int xPos;                               // This is the X position of the ball
int yPos;                              // This is the Y position of the ball 
int cx=100;                          // This is the x-coordinate of bouncing ball one
int cy=5;                           // This y-coordinate of bouncing ball one
int cx2=150;                       // These are just duplicates that make the ball appear at each vaule 
int cy2 =35;                      // These are just duplicates that make the ball appear at each vaule 
int cx3= 200;                    // These are just duplicates that make the ball appear at each vaule 
int cy3= 80;                    // These are just duplicates that make the ball appear at each vaule 
int cx4= 250;                  // These are just duplicates that make the ball appear at each vaule 
int cy4= 150;                 // These are just duplicates that make the ball appear at each vaule 
int r=30;                    // This is the radius of bouncing ball
int vx=2;                   // This is the bouncing ball's directional movements on the x-axis
int vy=3;                  // This is the bouncing ball's directional movements on the y-axis
int speed=1;              // This tells us how fast is it moving?
int xDir=1;              // This what direction is the ball going?
int score=0;            // Inital starting score
int lives=10;          //  Number of lives you start with
boolean lost=false;   // Has the user lost yet?
int state=0;

void setup()             // This runs once the program has started
{
  size (400,400);       // This is the size of the window
  smooth();
  xPos=width/2;        // This is the ceenter position of the ball
  fill(255,0,0);      // This sets the colour of the ball and text to red
  textSize(14);      // This Sets the size of the text
}

void draw()                                      // This starts the loop over and over again
{
  background (0);                              // This sets the background black
  ellipse(xPos, height/2,40,40);              // This creates the ball
  xPos=xPos+(speed*xDir);                    // This keeps track of the ball's position 
  if (xPos > width-20 || xPos<20)           // Did the ball hit the side?
  {
    xDir=-xDir;                           // If so did it go in the oppistie direction
  }
  

ellipseMode(CENTER);                       // This changes ellipse mode

ellipse(cx, cy, r, r);                    //This draws a bouncing balls with variables

cy = cy + vy;                            //This sets cy variable to move the ball across the screen


if((cy>height-40)||(cy<0))             // This sets the condition to the bounce balls once it reaches the edge of the screen
{
  vy = vy * -1;
} 

cx = cx + vx;                        // This sets cx variable to the bouncing ball to  move across the screen


if((cx > width - 10)||(cx < 0)) // This sets the condition for the ball to boun once it reaches the edege of the screen
{
  vx = vx * -1;
}

  
ellipseMode(CENTER);                      // This changes ellipse mode         
                           
ellipse(cx2, cy2, r, r);                // This draws a bouncing balls with variables

cy2 = cy2 + vy;                        // This sets cy variable to move the ball across the screen


if((cy2>height-40)||(cy2<0))          // This sets the condition for the ball to boun once it reaches the edege of the screen
{
  vy = vy * -1;
}

cx2 = cx2 + vx;                     // This sets cx variable to the bouncing ball to  move across the screen



if((cx2 > width - 10)||(cx2 < 0)) {  // This sets the condition for the ball to boun once it reaches the edege of the screen
  vx = vx * -1;
}

 
  
  text("score = "+score,10,10);                  // This prints the score on the screen
  text("lives = "+lives,width-80,10);            // This tells the user how many remaining lives they have
  if (lives<=0)                                  // This Checks to see if the user has lost
  {
    textSize(20);
    text("Click to Restart", 125,100);
    noLoop();                                    // This stops the looping at the end of the draw function
    lost=true;
    textSize(13);
  }
}



void mousePressed()                              // This runs whenever the mouse is pressed
{
  if (dist(mouseX, mouseY, xPos, 200)<=20)      // Did the user hit the target
  {
    score=score+speed;                           // This Increases the speed
    speed=speed+1;                               // This adds on the Score
  }
  else                                           // Did they miss
  {
    if (speed<1)                                 // If speed is greater than 1 then this decreases the speed
    {
    speed=speed-1;
    }
    lives=lives-1;                               // This Takes away a life
  }
  if (lost==true)                                //If the user has lost the game the game will then reset and start again
  {
    speed=1;                                     // This reeset all variables to initial conditions
    lives=10;
    score=0;
    xPos=width/2;
    xDir=1;
    lost=false;
    loop();                                     // This starts the beginning loop of the  draw function again
  }
}
