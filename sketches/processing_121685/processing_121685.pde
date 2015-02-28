
Player[] charmander = new Player[3];
Apples[] applesArray = new Apples[8];

PImage background;
PImage Menu;
PImage Lose;
PImage Win;
int PlayerCurrentFrame = 0;

float timer = 0;
float left = 0;
float right = 0;
float up = 0;
float down = 0;
int points = 0;
float countDown = 20;

boolean gameStarted = false;
boolean gameEnded = false;

class Player extends SpriteObject
{
  Player(String filename)
  {
    super(filename);
  }
  void update()
  {
    this.x += (right - left) * speed;
    this.y += (down - up) * speed;
  }
}


class Apples extends SpriteObject
{
  int AppleCurrentFrame = 0;
  float timer = 0;
  PImage[] applePieces = new PImage[4];

  Apples()
  {
    super();

    applePieces[0] = requestImage("apple1.png");
    applePieces[1] = requestImage("apple2.png");
    applePieces[2] = requestImage("apple3.png");
    applePieces[3] = requestImage("apple4.png");
    scaleX = 0.2;
    scaleY = 0.2;
    x = random(width);
    this.y = random(-100,-60);
  }

  Apples(String filename)
  {
    super(filename);
  }

  void update()
  {
    timer += 0.0167;
    if (timer > .1)
    {
      AppleCurrentFrame ++;
      timer = 0;
    }    
    if (AppleCurrentFrame >= 4)
    { 
      AppleCurrentFrame = 0;
    } 
    this.img = applePieces[AppleCurrentFrame];

    this.y += 2.0;
  }
}

void setup()
{
  size(500, 550);
  textSize(30);

  background = loadImage("backgroundPKMN.png");
  Menu = loadImage("PKMN Title.png");
  Win = loadImage("Winner.png");
  Lose = loadImage("Loser.png");
  charmander[0] = new Player ("charmander1.png");
  charmander[1] = new Player ("charmander2.png");
  charmander[2] = new Player ("charmander3.png");

  for (int i = 0; i < 8; i += 1)
  {
    applesArray[i] = new Apples();
  }
}

void GamePlay()
{

  image(background, width/2, height/2, width, height);

  for (int i = 0; i < 3; i += 1)
  {
    if (charmander [i].y < 300)
    {
      up = 0;
    }
    if (charmander [i].y > 510)
    {
      down = 0;
    }
    if (charmander [i].x > 475)
    {
      right = 0;
    }
    if (charmander [i].x < 10)
    {
      left = 0;
    }
    charmander [i].update();
  }
  charmander [PlayerCurrentFrame].render();

  for (int i = 0; i < 8; i += 1)
  {
    if (applesArray[i].isOverlapping(charmander[PlayerCurrentFrame]))
    {
      points ++;
      applesArray[i].x = random(width);
      applesArray[i].y = -25;
    }
    if (applesArray[i].y > 560)
    {
      applesArray[i].x = random(width);
      applesArray[i].y = -25;
    }
    applesArray[i].update();
    applesArray[i].render();
  }

  timer += 0.0167;
  countDown -= 0.0167;

  if (timer > .1)
  {
    PlayerCurrentFrame ++;
    timer = 0;
  }
  
  if (countDown <= 0)
  {
    gameEnded = true;
  }

  if (PlayerCurrentFrame >= 3)
  { 
    PlayerCurrentFrame = 0;
  } 

  textSize(25);
  text("SCORE: " + points, 20, 530);
  text("TIME:" + (int)countDown, 380, 530);
}

void MainMenu()
{
  image(Menu,0,0,width,height);
  
  if (keyCode == ' ' && gameStarted == false)
  {
    gameStarted = true;
  }
  if (gameStarted == true)
  {
    GamePlay();
  }
}

void Loser()
{
 image(Lose,width/2,height/2,width,height);
}

void Winner()
{
  image(Win,width/2,height/2,width,height);
}

void draw()
{
   MainMenu(); 
     
   if (gameEnded == true && points > 40)
  {
    Winner();
  }
  if (gameEnded == true && points < 40)
  {
    points = 0;
    Loser();
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
    if (keyCode == UP)
    {
      up = 0;
    }
    if (keyCode == DOWN)
    {
      down = 0;
    }
  }
}

void keyPressed()
{
  for (int i = 0; i < 3; i += 1)

    if (key == CODED)
    {
      if (keyCode == LEFT)
      {
        left = 1;
        charmander[i].scaleX = -0.4;
      }
      if (keyCode == RIGHT)
      {
        right = 1;
        charmander[i].scaleX = 0.4;
      }
      if (keyCode == UP)
      {
        up = 1;
      }
      if (keyCode == DOWN)
      {
        down = 1;
      }
    }
}

class SpriteObject
{
  float x = width/2;
  float y = 400;
  float w = -1.0;
  float h = -1.0;
  float speed = 5;
  float rotation = 0.0;
  float directionX;
  float directionY;
  float scaleX = 0.4;
  float scaleY = 0.4;
  PImage img;
  boolean loaded = false;

  SpriteObject()
  {
  }

  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }

  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.scaleX))
      && mouseX < (this.x + (this.w * 0.5 * this.scaleX))
      && mouseY > (this.y - (this.h * 0.5 * this.scaleY))
      && mouseY < (this.y + (this.h * 0.5 * this.scaleY)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }

  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.scaleX);
    float right = this.x + (this.w * 0.5 * this.scaleX);
    float top = this.y - (this.h * 0.5 * this.scaleY);
    float bottom = this.y + (this.h * 0.5 * this.scaleY);

    float otherLeft = other.x - (other.w * 0.5 * other.scaleX);
    float otherRight = other.x + (other.w * 0.5 * other.scaleX);
    float otherTop = other.y - (other.h * 0.5 * other.scaleY);
    float otherBottom = other.y + (other.h * 0.5 * other.scaleY);

    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }

  void update()
  {
    for (int i = 0; i < 3; i += 1)
      if (this.x > width - (this.w * this.scaleX * 0.5) && this.directionX > 0)
      {
        this.x = width - (this.w * this.scaleX * 0.5);
        this.directionX = -this.directionX;
      }
    if (this.x < (this.w * this.scaleX * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.scaleX * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.scaleY * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.scaleY * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.scaleY * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.scaleY * 0.5);
      this.directionY = -this.directionY;
    }
  }


  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }

    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.scaleX, this.scaleY);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



