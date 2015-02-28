
int xPos;                      //Position of the ball
int speed=1;                   //How fast is it moving?
int xDir=1;                    //what direction is the ball going?
int score=0;                   //Inital score
int lives=5;                   //Number of lives you start with
int highscore=0;               //Highscore
int ehighscore=0;              //Earlier highscore

boolean lost=false;      

void setup()                   //Runs once when program launches
{
  size (400,400);
  smooth();
  xPos=width/2;                //Centers our ball
  fill(255,255,255);           //Makes the ball and text white
  textSize(20);                //Sets the size of our text
}

void draw()                                      //Loops over and over again
{
  background (0);                                //Black background
  ellipse(xPos, height/2,40,40);                 //Draw the ball
  xPos=xPos+(speed*xDir);                        //update the ball's position 
  if (xPos > width-20 || xPos<20)                //Did the ball hit the side?
  {
    xDir=-xDir;
  }
  fill(255,255,255);
  text("Score = "+score,10,50);                  //Print the score on the screen
  text("Lives left = "+lives,width-120,50);      //Print remaining lives
  if (lives<=0)                                  //Check to see if you lost
  {
    textSize(40);
    text("Click to Restart", 75,125);
    text("Your score : "+score,100,250);
    if (score > highscore)
 {
                                    ehighscore = highscore;
                                    highscore = score;
 }
 if (score > ehighscore)
 {
  fill(0,255,0); 
 }
 else
 {
  fill(255,0,0);
 }

    text("Your highscore : "+highscore,50,300); 
    noLoop();                                    //Stop looping at the end of the draw function
    lost=true;
    textSize(13);
    
  }
}

void mousePressed()                           
{
  if (dist(mouseX, mouseY, xPos, 200)<=20)     
  {
    score=score+1;                          
    speed=speed+1;                              
    fill(0,255,0);
    sleep(1000);
    fill(255,255,255);
  }
  else                                          
  {
    if (speed<1)                                
    {
    speed=speed-1;
    }
    lives=lives-1;     
    fill(255,0,0);
  }
  if (lost==true)                          
  {
    speed=1;                                    
    lives=5;
    score=0;
    xPos=width/2;
    xDir=1;
    lost=false;
    loop();                                  
  }
}
