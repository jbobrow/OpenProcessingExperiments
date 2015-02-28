
int youX = 50;
int youY = 100;
int flyUp = 0;
int lives = 3;
PFont font;
PImage space;
int squareX = 1200;
int squareY = 300;
int dodge = 0;
int level = 0;
int squareWidth = 150;
int squareHeight = 150;
int youSize = 50;
int speed = 6;
int gameState = 0;
int bgt = 80;
int bgc = 0;

void setup()
{
  size(650, 650);
  font = loadFont("DejaVuSerif-Bold-24.vlw");
  frameRate(40);
  space = loadImage("space.jpg");
  space.resize(650, 650);
}
void draw()
{
  //title screen
  if (gameState==0)
  {
    background(space);
    lives=3;
    level=0;
    speed=6;
    dodge=0;
    fill(255);
    textFont(font, 20); 
    text("Taiyou Productions Presents:", 10, 100);
    textFont(font, 60); 
    text("Asteroid Field!", 70, 260);
    textFont(font, 20);
    text("Left Click to play!", 200, 360);
  }
  //gameplay
  if (gameState==1)
  {
    if (bgt<10)
    {
      if (bgc==0)
      {
        background(255, 0, 0);
      }
      else if (bgc==1)
      {
        background(0, 255, 0);
      }
    }
    else
    {
      background(space);
    }
    //controls for movement and direction constraints
    if (flyUp==0)
    {
      youY+=20;
    }
    if (flyUp==1)
    {
      youY-=20;
    }
    if (youY>550)
    {
      youY=550;
    }
    if (youY<50)
    {
      youY=50;
    }
    //screen text
    textFont(font, 20); 
    fill(255);
    text("Lives: "+lives, 10, 30);
    text("Asteroids dodged: "+level, 200, 30);
    rect(youX, youY, youSize, youSize);

    //check collision
    if (isColliding(youX, youY, youSize, squareX, squareY, squareWidth, squareHeight)==true)
    {
      bgt=0;
      bgc=0;
      squareX=1200;
      lives-=1;
    }
    //dodge popup
    if (dodge<80)
    {
      textFont(font, 80);
      text("DODGE!", squareWidth, squareHeight);
      dodge++;
    }
    bgt++;
    rect(squareX, squareY, 150, 150);
    //object speed
    squareX-=speed;
    //loop object
    if (squareX<-200)
    {
      bgt=1;
      bgc=1;
      squareX=1200;
      level++;
      speed+=level/2;
      squareY=int(random(0, 500));
    }
    //check lives
    if (lives==0)
    {
      gameState=2;
    }
    if (level==5)
    {
      gameState=3;
    }
  }
  //gameover
  if (gameState==2)
  {
    background(0);
    bgt=40;
    text("Game Over", 250, height/2);
    text("Asteroids dodged: "+level, 200, 400);
  }
  //makes sure that it doesn't send you to the title screen by accident at game state 3
 if(gameState!=3)
 {
 key='1';
 }
 //win!
  if (gameState==3)
  {
    background(0);
    text("You made it to the wormhole! You win!", 100, 200);
    text("You can keep going! See how long you can last!", 50, 250);
    text("Left Mouse: Continue", 50, 350);
    text("Space: Title Screen", 50, 380);
    bgt=40;
    if (key==' ')
    {
      key=1;
      gameState=0;
    }
  }
}

void mousePressed()
{
  flyUp = 1;
  //used togo from title screen to game
  if (gameState==0)
  {
    gameState=1;
  }
}

void mouseReleased()
{
  flyUp = 0;
}

void mouseClicked()
{
  //game over to title screen
  if (gameState==2)
  {
    gameState=0;
  }
  //win screen. from here you can continue the game or go to the title screen
  if (gameState==3)
  {
    level++;
    gameState=1;
  }
}

// used for collision
//http://www.openprocessing.org/sketch/20795
//i feel so dumb. my original collision checking method wasn't working because I had
//the square set to mouseX and mouseY instead of youX and youY
//so the variables that are used for collision weren't being used in play
boolean isColliding(
float youX, 
float youY, 
float youSize, 
float squareX, 
float squareY, 
float squareWidth, 
float squareHeight)
{
  float circleDistanceX = abs(youX - squareX - squareWidth/2);
  float circleDistanceY = abs(youY - squareY - squareHeight/2);

  if (circleDistanceX > (squareWidth/2 + youSize)) { 
    return false;
  }
  if (circleDistanceY > (squareHeight/2 + youSize)) { 
    return false;
  }

  if (circleDistanceX <= (squareWidth/2)) { 
    return true;
  }
  if (circleDistanceY <= (squareHeight/2)) { 
    return true;
  }

  float cornerDistance_sq = pow(circleDistanceX - squareWidth/2, 2) +
    pow(circleDistanceY - squareHeight/2, 2);

  return (cornerDistance_sq <= pow(youSize, 2));
}


