
// Pokemon Emerald Male Sprite, found on the Spriters Resource
// Pokemon Emerald GBA, copyright Nintendo

Player myplayer;
AnimatedSprite sideanimation, upanimation, downanimation;

//0-2 = Move Up , 3-5 = Move Sides , 6-8 = move Down
//0 = UpStand, 3 = SideStand, 6 = DownStand
boolean faceUp, faceDown, faceLeft, faceRight;
boolean isUpDown, isDownDown, isLeftDown, isRightDown;
boolean movingUp, movingDown, movingLeft, movingRight;
float x = 0.0;
float y = 0.0;
float speed = 5;

int pct, pst, ptt; // various timers

void setup()
{
  size(500, 500);


  myplayer = new Player();
  myplayer.init("ruby_");
  faceUp = faceLeft = faceRight = false;
  faceDown = true;
  movingUp = movingDown = movingLeft = movingRight = false;

  myplayer.x = 250;
  myplayer.y = 250;

  pct = 0;
  pst = 0;
  ptt = 250;
}

void draw()
{
  background(255);
}

void keyPressed()
{

  if (key == 'w')
  {
    myplayer.y -= 5;
  }

  if (key == 's')
  {
    myplayer.y += 5;
  }

  if (key == 'a')
  {
    myplayer.x -= 5;
  }

  if (key == 'd')
  {
    myplayer.x += 5;
  }
}

void keyReleased()
{
  if (key == 'w')
  {
    myplayer.y = myplayer.y;
  }

  if (key == 's')
  {
    myplayer.y = myplayer.y;
  }

  if (key == 'a')
  {
    myplayer.x = myplayer.x;
  }

  if (key == 'd')
  {
    myplayer.x = myplayer.x;
  }
}






//---------------------------------------------\\
//                 PLAYER CLASS                  \\
//-------------------------------------------------\\

class Player




//-----------------------Start Borrowed Code, modded to work-------------\\
{
  String current_pose;   //Identifies which animation pose is playing

  //Identifies which way the player is facing
  int xfacing;
  int yfacing;

  int playhead;   //Identifies which subimage of the hero sprite is currently shown
  int ct, st, tt;   //Timer to control the speed of the hero's walking animation

  float x, y, xspeed;  //Hero's position

  //Variables to set up the hero's animation
  PImage[] sprites;
  int totalImages;
  int sidewalk_end, sidewalk_start;
  int upwalk_start, upwalk_end;
  int downwalk_start, downwalk_end;

  void init(String prefix)
  {
    totalImages = 9;
    sidewalk_start = 3;
    sidewalk_end = 5;
    upwalk_start = 0;
    upwalk_end = 2;
    downwalk_start = 6;
    downwalk_end = 8;

    //Holds the hero's sprite subimages in an image array
    sprites = new PImage[totalImages]; 

    for (int i = 0; i < totalImages; i++)
    {
      sprites[i] = loadImage(prefix + i + ".png");  //load images
    }

    //initiate values
    x = width/2;
    y = height/2+100;

    current_pose = "stand";
    playhead = 0;

    xfacing = 0;
    yfacing = -1;
    speed = 1;

    ct = 0;
    st = 0;
    tt = 150;
  }

  void update()
  {
    if (current_pose.equals("stand"))
    {
      pushMatrix();
      translate(x, y);
      scale(5);
      image(sprites[0], -sprites[0].width/2, -sprites[0].height+10);
      popMatrix();
    }

    if (current_pose.equals("walk"))
    {
      x += xspeed * xfacing;   //move hero indirection facing

        ct = millis();  //update timer
      if (ct - st > tt)  //if timer is up, advanceplayhead to next image
      {
        playhead += 1;

        if (playhead > sidewalk_end) //if it exceeds the last image, set playhead bacl
        {                     //to the first image of this pose
          playhead = sidewalk_start;
        }
        st = millis();
      }

      pushMatrix();
      translate(x, y);
      scale(5);
      image(sprites[playhead], -sprites[playhead].width/2, -sprites[playhead].height+10);
      popMatrix();
    }
  }
}

//------------End Borrowed Code---------------\\

//---------------------------------------------\\
//              Animatedsprite CLASS             \\
//-------------------------------------------------\\

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






