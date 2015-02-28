

int speed=1;                   //Speed
int xDirection=1;                    //Direction
int score=0;                   //Inital score
int xPosition;                      //Balls position
int lives=10;                   //lives you start with
int INTRO     = 0;              // Start screen
int RUN_GAME  = 1;              //Game
int gameState = INTRO;           //start
boolean lost=false;            //lost






//-----------------------------------------------------------------------------
void setup() {                  

  size (400,400);
  smooth();
  xPosition=width/2;              
  fill(#FE00FF);               //Makes the ball and text purple
  textSize(20);
  noStroke();  

 


}

void draw()  {                                    //Loops over and over again

  if (gameState == INTRO) {
    intro();
  }
  else if (gameState == RUN_GAME) {
    run_game();
  }
 
}
 //-----------------------------------------------------------------------------
void intro() {
  PImage z;
  z = loadImage("http://i1086.photobucket.com/albums/j443/MrLukeyD/Quickhanzz.jpg");
  z.resize(400, 400);

  background(z);
  



}


//-------------------------------------------------------------------------------
void run_game() {
  
// PImage y;
  //y = loadImage("http://i1086.photobucket.com/albums/j443/MrLukeyD/Background.jpg");
  //y.resize(400, 400);
  // I put in that picture but it made my program run choppy and inconsistant.
 
  background(0);
                                 
  ellipse(xPosition, height/2,40,40);                 // ball
  xPosition=xPosition+(speed*xDirection);                         
  if (xPosition > width-30 || xPosition<30)          //bounce      
  {
    xDirection=-xDirection;                                  
  }
  
  text("score = "+score,10,20);                  //Score
  text("lives = "+lives,width-100,20);            //remaining lives
 
  if (lives<=0)                                  
  {
    textSize(20);
    
    text("Click to Restart", 125,100);
    noLoop();                                   
    lost=true;
    textSize(20);
  }
}


//-----------------------------------------------------------------------------------
void mousePressed()                              
{
  if (dist(mouseX, mouseY, xPosition, 200)<=40)      
  {
    score=score+speed;                           //Increase the speed
    speed=speed+1;                               //Increase the Score
  }
 
 
  else                                           
  {
    if (speed<1)                                 
    {
    speed=speed-1;
    }
    lives=lives-1;                               //Lose a life
  }
 
 
  if (lost==true)                              
  {
    speed=1;                                     //Reset 
    lives=10;
    score=0;
    xPosition=width/2;
    xDirection=1;
    lost=false;
    loop();                                    
  }
}


//----------------------------------------------------------------------------------
void keyPressed() {
  if ( gameState == INTRO) {
    if (key == ENTER || key == RETURN) {
    gameState = RUN_GAME; // start the game         // Intro screen to Main
    }
  }
}



