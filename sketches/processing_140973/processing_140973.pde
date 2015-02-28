
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139453*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */


Player myplayer;
ScratchEnemy scratchenemy;

int gamestate = 0;
int MENU_STATE = 0;
int CONTROLS_STATE = 4;
int PLAY_STATE = 1;
int LOSE_STATE = 2;
int WIN_STATE = 3;

PImage menu;
PImage losescreen;
PImage winscreen;
PImage controlscreen;

float scoretimer = 30;


int gamemode = 0;

// We use these variables both to keep track of whether a key is pressed down
boolean isUpDown = false;
boolean isDownDown = false;
boolean isLeftDown = false;
boolean isRightDown = false;


boolean faceUp = false;
boolean faceDown = false;
boolean faceLeft = false;
boolean faceRight = false;

PImage bg;
// Boom variables


//---------------------------------------------\\
//-----------------Main Setup-------------------\\
//-----------------------------------------------\\

void setup()
{
  size(950, 950);

  menu = requestImage("menuscreen.jpg");
  losescreen = requestImage("losescreen.jpg");
  winscreen = requestImage("winscreen.jpg");
  controlscreen = requestImage("controlscreen.jpg");



  frameRate(30);
  // dungeon = requestImage("background.png");
  bg = requestImage("Backgroundimg.png");

  //class setups
  myplayer = new Player();
  scratchenemy = new ScratchEnemy();
  //border = new Border();


  // Set the spawn position.
  myplayer.x = 450;
  myplayer.y = 200;

  scratchenemy.x = width/2;
  scratchenemy.y = height/2;

  // Set the initial direction to be down. Directions should always be of 1 length.
  // Here it is 1 length because we are just pointing down 1 in the y.
  myplayer.directionX = 0;
  myplayer.directionY = 1;

  // Speed of forward and back movement (how many pixels to move each frame)
  myplayer.speed = 3;
}


//-----------------------------------------------------------\\
//--------------    MAIN          DRAW   ---------------------\\
//=============================================================\\

void draw()
{
  // Clear the screen
  if (gamestate == PLAY_STATE)
  {
    background(255);
    image(bg, 0, 0, width, height);

    float PBcollision = dist(myplayer.x, myplayer.y, scratchenemy.x, scratchenemy.y);

    if (PBcollision < 20)
    {
      gamestate = LOSE_STATE;
    }

    scoretimer = scoretimer - (1.0/30.0);



    fill(255);
    textSize(50);
    textAlign(CENTER, TOP);

    text ("Time Remaining: " + (int)scoretimer, width/2, 20);


    if (scoretimer < 0)
    {
      gamestate = WIN_STATE;
    }


    scratchenemy.draw(myplayer.x, myplayer.y);


    // draws the player
    myplayer.draw();



    //float player to charizard
    float distanceP2C = dist(myplayer.x, myplayer.y, scratchenemy.x, scratchenemy.y);
    //distance Charizard to Bullet
  }
  imageMode(CORNER);
  if (gamestate == MENU_STATE)
  {

    if (key == 'z')
    {
      gamestate = PLAY_STATE;
    }
    if (key == ' ')
    {
      gamestate = CONTROLS_STATE;
    }
    image(menu, 0, 0, width, height);
  }

  if (gamestate == LOSE_STATE)
  {
    image(losescreen, 0, 0, width, height);
    if (key == 'z')
    {
      gamestate = MENU_STATE;
    }
  }

  if (gamestate == WIN_STATE)
  {
    image(winscreen, 0, 0, width, height);
    if (key == 'z')
    {
      gamestate = PLAY_STATE;
    }
  }

  if (gamestate == CONTROLS_STATE)
  {
    image(controlscreen, 0, 0, width, height);
    if ( key == 'z')
    {
      gamestate = MENU_STATE;
    }
  }
}



//--------------------------------------------------\\
//----------------KeyPressed and Released------------\\
//----------------------------------------------------\\
void keyPressed()
{
  //basic motion
  if (key == 'w' || key == 'W')
  {
    isUpDown = true;
    myplayer.sprite.setAnimation(0, 1, true);
  }

  if (key == 's' || key == 'S')
  {
    isDownDown = true;
    myplayer.sprite.setAnimation(2, 3, true);
  }

  if (key == 'a' || key == 'A')
  {
    isLeftDown = true;
    myplayer.sprite.setAnimation(4, 5, true);
  }

  if (key == 'd' || key == 'D')
  {
    isRightDown = true;
    myplayer.sprite.setAnimation(6, 7, true);
  }
}



void keyReleased()
{
  // Reset our key states to 0 when released
  if (key == 'w' || key == 'W')
  {
    isUpDown = false;
    myplayer.sprite.setAnimation(8, 8, true);
  }

  if (key == 's' || key == 'S')
  {
    isDownDown = false;
    myplayer.sprite.setAnimation(9, 9, true);
  }

  if (key == 'd' || key == 'D')
  {
    isRightDown = false;
    myplayer.sprite.setAnimation(10, 10, true);
  }

  if (key == 'a' || key == 'A')
  {
    isLeftDown = false;
    myplayer.sprite.setAnimation (11, 11, true);
  }
}





//-----------------------------------------------\\
//---------------Animated-------------------------\\
//-----------------Sprite--------------------------\\
//--------------------------------------------------\\
class AnimatedSprite
{
  int frameRow;
  int frameColumn;
  int frameWidth;
  int frameHeight;
  int startFrame;
  int endFrame;
  float currentFrame;
  boolean loop = true;
  float frameSpeed = 12.0;
  PImage spriteSheet;
  PImage img;


  AnimatedSprite(String filename, int widthOfOneFrame, int heightOfOneFrame)
  {
    this.spriteSheet = requestImage(filename);
    this.frameWidth = widthOfOneFrame;
    this.frameHeight = heightOfOneFrame;
  }

  void setAnimation(int start, int end, boolean looping)
  {
    if (start != this.startFrame || end != this.endFrame)
    {
      this.startFrame = start;
      this.endFrame = end;
      this.currentFrame = this.startFrame;
    }

    this.loop = looping;
  }

  void draw()
  {
    if (this.spriteSheet.width <= 0)
    {
      return;
    }



    // Increment currentFrame by the frameRate related to current fps)
    this.currentFrame += (this.frameSpeed / frameRate);
    if ((int)this.currentFrame > this.endFrame)
    {
      if (this.loop == true)
      {
        this.currentFrame = this.startFrame;
      }
      else
      {
        this.currentFrame = this.endFrame;
      }
    }

    int colCount = this.spriteSheet.width / this.frameWidth;
    this.frameColumn = (int)this.currentFrame ;
    if (colCount > 0)
    {
      this.frameColumn =(int)((int)this.currentFrame % colCount);
      this.frameRow = (int)(this.currentFrame / colCount);
    }
    this.img = this.spriteSheet.get(
    this.frameColumn * this.frameWidth, 
    this.frameRow * this.frameHeight, 
    this.frameWidth, 
    this.frameHeight);

    image(this.img, 0, 0, frameWidth, frameHeight);
  }
}






//-----------------------------------------------------\\
//-----------------PLAYER CLASS-------------------------\\
//=======================================================\\

class Player
{
  float x = 0.0;
  float y = 0.0;
  float rotation = 0.0;
  float speed = 5;
  float directionX;
  float directionY;
  float s = 2.0;

  boolean alive = true;
  boolean doesXtouch = false;
  boolean doesYtouch = false;



  // player has an animated sprite
  AnimatedSprite sprite;

  Player()
  {
    this.sprite = new AnimatedSprite("playersheet2 (2).png", 16, 22);
  }



  void draw()
  {


    if (this.x > 878)
    {
      this.speed = 0;
      faceLeft = true;
      this.x = 877;
    }

    else if (this.x < 85)
    {
      this.speed = 0;
      faceRight = true;
      this.x = 86;
    }

    else if (this.y >  910)
    {
      this.speed = 0;
      faceUp = true;
      this.y = 909;
    }
    else if (this.y < 77)
    {
      this.speed = 0;
      faceDown = true;
      this.y = 78;
    }

    if (isUpDown)
    {
      this.y -= this.speed;
      this.directionX = 0;
      this.directionY= -1;
      faceUp = true;
      faceDown = false;
      faceLeft = false ;
      faceRight = false;
    }

    else if (isDownDown)
    {
      this.y += this.speed;
      this.directionX = 0;
      this.directionY= 1;
      faceDown = true;
      faceUp = false;
      faceLeft = false;
      faceRight = false;
    }   

    else if (isRightDown)
    {
      this.x += this.speed;
      this.directionX = 1;
      this.directionY= 0;
      faceRight = true;
      faceLeft = false;
      faceUp = false;
      faceDown = false;
    }
    else if (isLeftDown)
    {
      this.x -= this.speed;
      this.directionX = -1;
      this.directionY= 0;
      faceLeft = true;
      faceRight = false; 
      faceUp = false;
      faceDown = false;
    }

    // apply transformations
    imageMode(CENTER);
    pushMatrix();
    translate(this.x, this.y);
    scale(2);

    // draw and animate the animated sprite
    this.sprite.draw();

    popMatrix();

    imageMode(CORNER);
  }
}


//------------------------------------------------\\
//------------Basic Enemy class -------------------\\
//--------------------------------------------------\\

class ScratchEnemy
{
  float x = 0;
  float y = 0;
  float w = 26;
  float h = 30;
  float speed = 6;
  float directionX = 0;
  float directionY = 1;

  float easing = 0.01;

  boolean faceLeft = false;
  boolean faceRight = false;
  boolean faceUp = false;
  boolean faceDown = false;


  float distanceP2C = dist(myplayer.x, myplayer.y, 
  this.x, this.y);

  PImage img;
  PVector position = new PVector(100, 100);

  //bullet timer variables
  float timer = 0.0;
  float time = 1;
  float increment = 0.1;
  float timerplay = 1;

  AnimatedSprite sprite;

  ScratchEnemy()
  {
    this.img = requestImage("charizard1.png");
    this.sprite = new AnimatedSprite("charizard1.png", 30, 26);
  }



  void draw(float targetx, float targety)
  {
    float toX = targetx - this.x;
    float toY = targety - this.y;

    this.x += (toX * this.easing);
    this.y += (toY * this.easing);

    //collisions
    if (this.x > 850)
    {
      this.speed = -this.speed;
      faceLeft = true;
      this.x = 849;
    }

    else if (this.x < 65)
    {
      this.speed = -this.speed;
      faceRight = true;
      this.x = 66;
    }

    else if (this.y >  890)
    {
      this.speed = -this.speed;
      faceUp = true;
      this.y = 888;
    }
    else if (this.y < 70)
    {
      this.speed = -this.speed;
      faceDown = true;
      this.y = 71;
    }

    //facing booleans
    if (faceDown == true)
    {
      this.y += this.speed;
      this.sprite.setAnimation(5, 6, true);
    }

    if (faceUp == true)
    {
      this.y -= this.speed;
      this.sprite.setAnimation(0, 1, true);
    }

    if (faceLeft == true)
    {
      this.x -= this.speed;
      this.sprite.setAnimation(3, 4, true);
    }

    if (faceRight == true)
    {
      this.x += speed;
      this.sprite.setAnimation(7, 8, true);
    }

    pushMatrix();

    translate(this.x, this.y);
    scale(2);
    this.sprite.draw();

    popMatrix();
  }
}


//-------------------------------------\\
//------NOTES and Needed Additions-------\\
//-----------------------------------------\\

// add orb-enemy collisions
// add enemy attacks
// add 

//--------------------------------\\
//------------Finished Product-----\\
//----------------------------------\\



