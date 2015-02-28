
// Here we actually create the variable "myplayer" of type player
Player myplayer;
//PImage dungeon;

// We use these variables both to keep track of whether a key is pressed down
boolean isUpDown = false;
boolean isDownDown = false;
boolean isLeftDown = false;
boolean isRightDown = false;

boolean faceUp = false;
boolean faceDown = false;
boolean faceLeft = false;
boolean faceRight = false;

// Bullet variables
int bulletCount = 10;
Bullet[] bullets = new Bullet[bulletCount];
int bulletIndex = 0;

void setup()
{
  size(1200, 950);


  // dungeon = requestImage("background.png");

  myplayer = new Player();

  // Set the spawn position.
  myplayer.x = 200;
  myplayer.y = 200;

  // Set the initial direction to be down. Directions should always be of 1 length.
  // Here it is 1 length because we are just pointing down 1 in the y.
  myplayer.directionX = 0;
  myplayer.directionY = 1;

  // Speed of forward and back movement (how many pixels to move each frame)
  myplayer.speed = 3;

  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i] = new Bullet();
    bullets[i].x = -1000;
    bullets[i].y = -1000;
  }
}

void draw()
{
  // Clear the screen
  // image(dungeon, 0, 0, width, height);
  //background(255);


  myplayer.draw();
}


void keyPressed()
{
  // We set isUpDown and isDownDown to true or false instead of setting
  // myplayer position and rotation directly here. This allows us to have smooth
  // movement. Otherwise holding down a key only gets caled every second or so
  // and creates jerky movement because of Windows 7/Mac key repeat.
  // To get smooth movement you need to keep track of the states yourself.
  if (key == 'w')
  {
    isUpDown = true;

    // start tank animation from fram 0->7
    myplayer.sprite.setAnimation(4, 6, true);
  }
  if (key == 's')
  {
    isDownDown = true;

    // start tank animation from fram 0->7
    myplayer.sprite.setAnimation(10, 12, true);
  }

  if (key == 'a')
  {
    isLeftDown = true;

    myplayer.sprite.setAnimation(16, 18, true);
  }

  if (key == 'd')
  {
    isRightDown = true;

    myplayer.sprite.setAnimation(22, 24, true);
  }
}

void keyReleased()
{
  // Reset our key states to 0 when released.
  if (key == 'w')
  {
    isUpDown = false;

    // stop tank animation
    myplayer.sprite.setAnimation(0, 0, true);
  }
  if (key == 's')
  {
    isDownDown = false;

    // stop tank animation
    myplayer.sprite.setAnimation(7, 7, true);
  }
  if (key == 'd')
  {
    isRightDown = false;

    myplayer.sprite.setAnimation(19, 19, true);
  }
  if (key == 'a')
  {
    isLeftDown = false;

    myplayer.sprite.setAnimation (13, 13, true);
  }
  if (key == ' ')
  {
  }

  if (bulletIndex >= bulletCount)
  {
    bulletIndex = 0;
  }
}


// used to load animated images in a class
//this.sprite = new AnimatedSprite(playersheet2 (2).png", frame-width, frame-height);
//
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


class Player
{
  float x = 0.0;
  float y = 0.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 2.0;

  // player has an animated sprite
  AnimatedSprite sprite;

  Player()
  {
    // 32 is the size of one frame in the 256x256 image
    this.sprite = new AnimatedSprite("playersheet2 (2).png", 16, 22);
  }



  void draw()
  {
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
    // subtract to go backward
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
    scale(3);

    // draw and animate the animated sprite
    this.sprite.draw();

    popMatrix();

    imageMode(CORNER);
  }
}

// Bullet Class
class Bullet
{
  float x = 0.0;
  float y = 0.0;
  float w = 30.0;
  float h = 30.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;

  Bullet()
  {
    this.img = requestImage("energyball.png");
  }

  void draw()
  {
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;

    if (this.img.width > 0)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();

      imageMode(CORNER);
    }
  }
}


//-------------------------------------\\
//------NOTES and Needed Additions-------\\
//-----------------------------------------\\

//add collision mechanics
//add basic enemy types
//add attacks
//collisions with attacks, collisions with player
//re-do the player sprites for walking Right (d)



