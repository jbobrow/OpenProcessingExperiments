
//Declare global variables
Platform[] platforms;
Otter playerOtter;

//Declare constant expressions
static final int PLATFORM_SIDE = 100;
static final int OTTER_WIDTH = 70;
static final int OTTER_HEIGHT = 100;

//We do not need to detect key "holding"
boolean keyHeld = false;
boolean paused = true;

//Keeps track of the order of new platforms
int order = 5;
int targetPlatform = 4;
int score;
int milliseconds, timeRemaining, previousSeconds;

//Stores the game's font for global use
PFont font;

PImage background; 
PImage lilly; 
PImage otter; 

//Array of characters for random selection
char[] letters = 
{
  'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'A', 
  'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Z', 'X', 'C', 
  'V', 'B', 'N', 'M'  
};

void setup()
{
  size(600, 600);
  background(255);
  
  background = loadImage("river.jpg"); //River (Background)
  lilly = loadImage("lilly.png"); //Lilly (Platforms)
  otter = loadImage("otter.gif"); //Character
  
  smooth();
  
  //No more than 5 platforms will be visible at any time
  platforms = new Platform[5];
  
  //Set up platforms
  for(int i = 0; i < platforms.length; i++)
  {
    platforms[i] = new Platform();
    
    if(i == 4) platforms[i].renew = true;
  }
  
  order = 4;
  
  font = loadFont("Impact-48.vlw");
  textFont(font, 64);
  
  //Set up the player's character
  playerOtter = new Otter();
  
  //Draw the scene
  updatePlatforms();
  
  milliseconds = 0;
  timeRemaining = 30 * 1000; //Time limit is 30 seconds
  previousSeconds = 60;
  
  //Pause the game until the player presses any key
  initialPause();
}

void draw()
{
  //Process user input
  letterDetect();
  
  if(paused == false)
  {
    updateTimer();
  }
}

void initialPause()
{
  fill(0);
  stroke(0);
  rect(150, 200, 310, 40);
  
  fill(88, 116, 224);
  textFont(font, 32);
  text("Press any key to start.", 160, 235);
}

void gameOver()
{
  fill(0);
  stroke(0);
  rect(150, 200, 350, 40);
  
  fill(88, 116, 224);
  textFont(font, 32);
  text("Game over! You scored: " + score, 160, 235);
  
  //Stop the game
  noLoop();
}

void updateTimer()
{
  //If there is a change in time, store the new time
  if(milliseconds > 0)
  {
    timeRemaining -= (millis() - milliseconds);
  }
  
  milliseconds = millis();
  
  //Update the timer after a second passes
  if(timeRemaining/1000 != previousSeconds)
  {
    //Redraw scene before overlaying the timer
    
    previousSeconds = timeRemaining/1000;
    updatePlatforms();
  }
  
  if(previousSeconds == 0)
  {
    //Game over
    gameOver();
  }
}

void showTime()
{
  fill(240, 10, 10);
  textFont(font, 32);
  text("Time Left: " + previousSeconds, 5, 30);
}

void updateScore(int change)
{
    if((score + change) >= 0) //Limit minimum score to 0
    {
       score += change;
    }  
    
    fill(240, 10, 10);
    textFont(font, 32);
    text("Score: " + score, 5, 60);
}

void updatePlatforms()
{
  stroke(255);
  fill(255);

  //Redraw everything
  image(background, 0, 0, 600, 600);

  for(int i = 0; i < platforms.length; i++)
  {
    platforms[i].update();
  }
  
  playerOtter.otterUpdate();
  showTime();
  updateScore(0);
}

void trackPlatforms()
{
  //Keep track of the position of each platform
  if(order > 0)
   {
     order--;
   }
   else
   {
     order = 4;
   }
   
   if(targetPlatform > 1)
   {
     targetPlatform--;
   }
   else
   {
     targetPlatform = 5;
   }
}

//If the user has pressed a key, determine wether or not it's the right one.
void letterDetect()
{
  if(paused == true && keyPressed)
  {
    paused = false;
  }
  else 
  {
    if(keyPressed == true && keyHeld == false)
    {
       keyHeld = true;
       String keypressed = key + "";
       String target = platforms[targetPlatform - 1].getTargetCharacter() + "";
       
       //If the key that the user presses matches the character of the next platform...
       if(key == platforms[targetPlatform - 1].getTargetCharacter() || keypressed.toUpperCase().equals(target))
       {
         //The correct key was pressed
         platforms[order].renew(order);
         
         updateScore(1);
         trackPlatforms();
         updatePlatforms();
       }
       else
       {
         //The wrong key was pressed
         
         if(paused == false)
         {
           updateScore(-1);
           updatePlatforms();
         }
       }
     }
     else if(keyPressed == false && keyHeld == true)
     {
       keyHeld = false;
     }
  }
}

class Otter
{
  //Declare fields
  int x, y;
  
  Otter()
  {
      //Initialise fields
      y = 460;
  }
  
  void otterUpdate()
  {
      x = platforms[order].x + 10; //Place the otter on top of the platform at the bottom of the screen
      image(otter, x, y, OTTER_WIDTH, OTTER_HEIGHT);
  }
}

class Platform
{
  //Declare fields
  int x, y;
  char targetCharacter;
  boolean renew = false;
  
  Platform()
  {
    //Initialise fields    
    
    setPosition();
    
    //Fixed y coordinate between y = 10 and y = 590
    y = 590 - (order * (580/5));
    
    //Decrement order to occupy the next row
    order--;
  }
  
  void renew(int index)
  { 
    //Once the lower platform leaves the screen, place it at the top
    setPosition();
    y = 590 - (5 * (580/5));
    renew = false;
    
    //Move each platform except for the one at the bottom down a row
    for(int i = 0; i < platforms.length; i++)
    {
      if(i != index)
      {
        platforms[i].y += 580/5;
        
        if(y == 590) renew = true;
      }
    }
  }
  
  void setPosition()
  {
    //Set target character to a random character
    targetCharacter = letters[int(random(letters.length))];
    
    //Random fixed x coordinate between x = 100 and x = 500
    x = 100 + ((int(random(3)) + 1) * (400/4));
  }
  
  void update()
  { 
    //Bright green
    stroke(26, 216, 154);
    fill(26, 216, 154);
    
    //Show the platform and it's associated character
    image(lilly, x, y, PLATFORM_SIDE, PLATFORM_SIDE);
    
    //Black
    stroke(0);
    fill(0);
    
    textFont(font, 64);
    text(targetCharacter, x + (PLATFORM_SIDE/2) - 15, y + (PLATFORM_SIDE*0.75));
  }
  
  //Accessor method for the "targetCharacter" field
  public char getTargetCharacter()
  {
    return targetCharacter;
  }
  
  //Accessor method for the "y" field
  public int getY()
  {
    return y;
  }
  
  //Mutator method for the "y" field
  public void setY(int ny)
  {
    y = ny;
  }
}


