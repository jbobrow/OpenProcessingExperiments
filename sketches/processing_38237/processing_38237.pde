

import ddf.minim.*;

Minim minim;
AudioInput in;

// All of my insane-o images that need to be loaded in
PImage panda;
PImage yak;
PImage bamboo;
PImage bamboo2;
PImage title;
PImage directions;
PImage gameOver;
PImage backgroundImage;

// my booleans to be used later...
boolean pandaHere = false;
boolean yakHere = false;

/* my lovely collection of ints that also need to be
 seen globally */
int lives = 5;
int currentTime;
int yakTime;
int pandaTime;
int level = 0;

void setup()
{
  size(600, 500);
  smooth();
  background(20,100,100);

  // for the audio:
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 600);

  // loading in the images
  panda = loadImage("panda.png");
  yak = loadImage("yak.png");
  bamboo = loadImage("bamboo.png");
  bamboo2 = loadImage("bamboo2.png");
  title = loadImage("title.png");
  directions = loadImage("directions.png");
  gameOver = loadImage("gameOver.png");
  backgroundImage = loadImage("backgroundImage.png");
}

void draw()
{ 
  /* my program runs on a system of levels in order to
   display different screens. Certain keypresses or events
   cause the different level numbers to be activated, thus
   moving the game along to the next level */
  checkLevels();
}

void checkLevels()
{
  // when the level # is set to 0, show the title screen
  if(level == 0)
  {
    drawTitleScreen();
  }

  // when the level # is set to 1, show the directions
  if(level == 1)
  {
    drawDirectionsScreen();
  }

  // when the level # is set to 2, run the game
  if(level == 2)
  {
    currentTime = millis()/1000;

    // draw the various components
    drawPanda();
    drawYak();
    drawBamboo();
    drawLives();

    /* check the various components to see if anything needs
     to be changed/removed/etc. */
    checkYell();
    checkYak();
    checkPanda();
  }
}

void drawTitleScreen()
{
  // generates the actual title screen image
  image(title,0,0,width,height);
}

void drawDirectionsScreen()
{
  // generates the actual directions screen image
  image(directions,0,0,width,height);
}

void drawPanda()
{ 
  /* generates a random number so that the panda is drawn at an unexpected time
   when the random number matches the target number */
  int randomNumber = int(random(175));
  int targetNumber = 10;

  /* if the random number matches the target number and there isn't already a 
   panda on the screen, draw a panda! */
  if (randomNumber == targetNumber && pandaHere == false && yakHere == false)
  {
    /* Draw a panda and indicate that there is a panda drawn so no more are drawn.
     I have this split into an 'if' and an 'else' statement so that there is a
     random chance of the panda appearing in the top or bottom row of bamboo. */
    if((int(random(1,3))) == 1)
    {
      // for the panda appearing in the bottom row:
      image(panda, random(50, width-50), height-200, 100, 125);
      pandaHere = true;
    }
    else
    {
      // for the yak appearing in the top row:
      image(panda, random(50, width-50), height-325, 60, 75);
      pandaHere = true;
    }
    pandaTime = millis()/1000;
  }
}

void checkPanda()
{
  // check if there is a panda there, and if he has been there for 3 seconds
  if(pandaHere == true && currentTime-pandaTime == 3)
  {
    /* if the panda has been there for 3 seconds, this is BAD so the player loses a life,
     the panda is erased, and the background redrawn */
    lives--;
    pandaHere = false;
    image(backgroundImage,0,0,width,height);
    drawBamboo();
  }
}

void drawYak()
{
  /* Follows the exact same system as generating a panda.
   Generates a random number so that the yak is drawn at an unexpected time
   when the random number matches the target number. */
  int randomNumber = int(random(300));
  int targetNumber = 10;

  /* if the random number matches the target number and there isn't already a 
   yak on the screen, draw a yak */
  if (randomNumber == targetNumber && pandaHere == false && yakHere == false)
  {
    /* Draw a yak and indicate that there is a yak drawn so no more are drawn.
     I have this split into an 'if' and an 'else' statement so that there is a
     random chance of the yak appearing in the top or bottom row of bamboo. */
    if((int(random(1,3))) == 1)
    {
      // for the yak appearing in the bottom row:
      image(yak, random(50, width-50), height-200, 100, 125);
      yakHere = true;
    }
    else
    {
      // for the yak appearing in the top row:
      image(yak, random(50, width-50), height-325, 60, 75);
      yakHere = true;
    }
    yakTime = millis()/1000;
  }
}

void checkYak()
{
  // check if there is a yak there, and if he has been there for 3 seconds
  if (yakHere == true && currentTime-yakTime == 3)
  {
    /* if the yak has been there for 3 seconds, this is GOOD,
     the yak is erased, and the background redrawn */
    yakHere = false;
    image(backgroundImage,0,0,width,height);
    drawBamboo();
  }
}

// check if there is a panda or yak on the screen and if the yell is loud enough
void checkYell()
{
  /* "yell" is the sound read in from the user, and the targetYell is the
   threshhold they need to exceed in order to scare away the panda */
  int yell = int(50 + in.left.get(1)*50);
  int targetYell = 75;

  // check if the panda is there and if the yell is loud enough
  //if (mousePressed && pandaHere == true)
  if((pandaHere == true) && ( yell > targetYell))
  {
    /* redraw the background so it looks like the panda ran away, and then
     indicate that there is no more panda so that more can be drawn */
    image(backgroundImage,0,0,width,height);
    drawBamboo();
    pandaHere = false;
  }
  // check if the yak is there and if the yell was loud enough
  //if (mousePressed && yakHere == true)
  if((yakHere == true) && (yell > targetYell))
  {
    /* if there was a yak on the screen and the player yelled loud enough,
     this is BAD so the player loses a life */
    image(backgroundImage,0,0,width,height);
    drawBamboo();
    yakHere = false;
    lives--;
  }
}

// draw the bamboo foreground behind which the damn pandas hide
void drawBamboo()
{
  image(bamboo,0, height-125, width, 125);
  image(bamboo2,0,height-285,width,85);
}

// shows the player how many lives he/she has left
void drawLives()
{
  textSize(40);
  text(lives, width-50, height-30);

  // if the number of lives reaches zero, it's game over
  if (lives == 0)
  {
    level = 3;
    gameOver();
  }
}

void gameOver()
{
  // draws the actual Game Over screen
  image(gameOver,0,0,width,height);
}

// keyPressed function to handle the player input
void keyPressed()
{
  /* this will handle input from the title screen when the player
   presses the spacebar to enter into the directions screen */
  if(key == ' ' && level == 0)
  {
    level = 1;
  }

  /* this will handle input when the player is on the directions screen
   and presses the 's' button to start the game */
  if(key == 's' && level == 1)
  {
    level = 2;
    // need to draw the background so that the directions screen is erased
    image(backgroundImage,0,0,width,height);
  }

  /* this will handle input when the player is on the Game Over screen
   and presses the 'r' button to restart the game. The number of lives is set
   back to 5 and the level is set back to 0 so that the title screen
   is reinitiated. */
  if(key == 'r' && level == 3)
  {
    level = 0;
    lives = 5;
  }
}


