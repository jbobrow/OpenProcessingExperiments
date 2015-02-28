
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/138340*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

// Here we actually create the variable "myTank" of type Tank
Tank myTank;
Target myBoogy;
// We use these variables both to keep track of whether a key is pressed down
boolean forwardKeyPressed = false;
boolean backwardKeyPressed = false;
boolean rightKeyPressed = false;
boolean leftKeyPressed = false;
PImage back;
PImage boogy;

// Bullet variables
int bulletCount = 10;
Bullet[] bullets = new Bullet[bulletCount];
int bulletIndex = 0;

void setup()
{
  size(800, 800);
  back = requestImage("back.png");
  myTank = new Tank();
  boogy = requestImage("boogy.png");
  myBoogy = new Target();
  // Set the spawn position. 
  myTank.x = 200;
  myTank.y = 200;

  // Set the initial direction to be down. Directions should always be of 1 length.
  // Here it is 1 length because we are just pointing down 1 in the y.
  myTank.directionX = 0;
  myTank.directionY = 1;

  // Speed of forward and back movement (how many pixels to move each frame)
  myTank.speed = 3;



  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i] = new Bullet();
    bullets[i].x = -1000;
    bullets[i].y = -1000;
  }
}

void draw()
{
  image(back, 0, 0, width, height);
  // Clear the screen
  // background(255);


  // myTank.lookAt(mouseX, mouseY);
  myTank.draw();
  myBoogy.draw();
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i].draw();
  }
}


void keyPressed()
{
  // We set forwardKeyPressed and backwardKeyPressed to true or false instead of setting
  // myTank position and rotation directly here. This allows us to have smooth
  // movement. Otherwise holding down a key only gets caled every second or so
  // and creates jerky movement because of Windows 7/Mac key repeat.
  // To get smooth movement you need to keep track of the states yourself.



  if (keyCode == UP)
  {
    //rightKeyPressed = false;
    forwardKeyPressed = true;
    backwardKeyPressed = false;
    //leftKeyPressed = false;
    // stop tank animation
    myTank.sprite.setAnimation(0, 0, true);
  }
  if (keyCode == DOWN) 
  {
    //rightKeyPressed = false;
    forwardKeyPressed = false;
    backwardKeyPressed = true;
    //leftKeyPressed = false;
    // stop tank animation
    myTank.sprite.setAnimation(0, 0, true);
  }

  if (keyCode == LEFT) {
    rightKeyPressed = false;
    //forwardKeyPressed = false;
    //backwardKeyPressed = false;
    leftKeyPressed = true;

    // stop tank animation
    myTank.sprite.setAnimation(0, 0, true);
  }
  if (keyCode == RIGHT) 
  {
    rightKeyPressed = true;
    //forwardKeyPressed = false;
    // backwardKeyPressed = false;
    leftKeyPressed = false;
    // stop tank animation
    myTank.sprite.setAnimation(0, 0, true);
  }
}

void keyReleased()
{
  // Reset our key states to 0 when released.
  if (keyCode == UP)
  {
    //rightKeyPressed = false;
    forwardKeyPressed = false;
    backwardKeyPressed = false;
    //leftKeyPressed = false;
    // stop tank animation
    myTank.sprite.setAnimation(0, 0, true);
  }
  if (keyCode == DOWN) 
  {
    //rightKeyPressed = false;
    forwardKeyPressed = false;
    backwardKeyPressed = false;
    // leftKeyPressed = false;
    // stop tank animation
    myTank.sprite.setAnimation(0, 0, true);
  }
  if (keyCode == LEFT) {
    rightKeyPressed = false;
    //forwardKeyPressed = false;
    //backwardKeyPressed = false;
    leftKeyPressed = false;

    // stop tank animation
    //myTank.sprite.setAnimation(0, 0, true);
  }
  if (keyCode == RIGHT) 
  {
    rightKeyPressed = false;
    //forwardKeyPressed = false;
    // backwardKeyPressed = false;
    leftKeyPressed = false;
    // stop tank animation
    // myTank.sprite.setAnimation(0, 0, true);
  }
  if (key == ' ') {
    {
      bullets[bulletIndex].x = myTank.x;
      bullets[bulletIndex].y = myTank.y;
      bullets[bulletIndex].speed = 10;
      bullets[bulletIndex].directionX = myTank.directionX;
      bullets[bulletIndex].directionY = myTank.directionY;
      bulletIndex += 1;

      if (bulletIndex >= bulletCount)
      {
        bulletIndex = 0;
      }
    }
  }
}

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

class Target
{
  float boogyX = 400;
  float boogyY = 200;
  //float x = 0.0;
  //float y = 0.0;
  boolean alive = false;
  boolean hit = false;
  float timer=1;

  Target() {
    this.alive = true;
    this.boogyX = 300;
    this.boogyY = 300;
    this.timer= 0;
  }

  void draw() {
    if (this.alive==true) {
      image(boogy, boogyX, boogyY, 64, 64);
    }
    if (this.hit==true&&timer<5) {
      this.timer+=.1;
      tint(255, 0, 0);
      image(boogy, boogyX, boogyY, 64, 64);
      noTint();
      if (timer>=5) {
        this.alive=false;
      }
    }
  }
}

class Tank 
{
  float x = 0.0;
  float y = 0.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 2.0;

  // Tank has an animated sprite
  AnimatedSprite sprite;

  Tank()
  {
    // 32 is the size of one frame in the 256x256 image
    this.sprite = new AnimatedSprite("toejam.png", 32, 32);
  }

  // function to rotate tank with keys




  /* void lookAt(float otherX, float otherY)
   {
   this.rotation = degrees(atan2(otherY-this.y, otherX-this.x));
   this.directionX = cos(radians(this.rotation));
   this.directionY = sin(radians(this.rotation));
   }*/

  void draw()
  {
    if (forwardKeyPressed)
    {
      this.x += 1* this.directionX;
      this.y += 1* this.directionY;
      myTank.sprite.setAnimation(0, 7, true);
    }
    // subtract to go backward
    if (backwardKeyPressed)
    {
      this.x -= 1* this.directionX;
      this.y -= 1* this.directionY;
      myTank.sprite.setAnimation(0, 7, true);
    }
    if (rightKeyPressed)
    {
      this.rotation += 5;
      //this.y -= 0;
    }
    if (leftKeyPressed)
    {
      this.rotation -= 5;
      //this.y -= 0;
    }
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
    // apply transformations
    imageMode(CENTER);
    pushMatrix();
    translate(this.x, this.y);
    rotate(radians(this.rotation));
    scale(this.s);

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
    this.img = requestImage("tomato.png");
  }

  void draw()
  {
    this.rotation = degrees(atan2(this.directionY, this.directionX));
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
    if (this.x > (myBoogy.boogyX -16) && this.x < (myBoogy.boogyX +16) && this.y > (myBoogy.boogyY -16) && this.y < (myBoogy.boogyY +16)) {
      myBoogy.hit = true;
    }
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



