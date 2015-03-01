
float button1X = 426;
float button1Y = 240;
float button1Width = button1X +400;
float button1Height = button1Y + 100;
float button2X = 426;
float button2Y = 480;
float button2Width = button2X + 400;
float button2Height = button2Y + 100;
PFont f;
float up;
float down;
PImage bgImage;
float bgX;
float bgSpeed;
float ground = 561;

//new objects
Player player;
Obstacle obstacle;
StartButton startBut;
QuitButton quitBut;
Background background;



void setup()
{
  size (1280, 720);
  smooth();
  rectMode(CORNERS);
  
  f = loadFont("SegoePrint-48.vlw"); 
  bgImage = loadImage("game-background.jpg"); 
  
  player = new Player(2, ground, width/3);
  obstacle = new Obstacle(ground, 2, 20, 40, 160);
  startBut = new StartButton(width/3*2, height/3, 400, 100, "Start");
  quitBut = new QuitButton(width/3*2, height/3*2, 400, 100, "Quit");
  background = new Background(-5, bgImage); 
}

void draw()
{
  menu();
}




class Background
{
  float bgSpeed;
  float bgX;
  PImage bg;
  
  Background( float tempBgSpeed, PImage tempBg)
  {
    bgSpeed = tempBgSpeed;
    bg = tempBg;
  }
  
  void looping()
  {
      bgX += bgSpeed;
      bgX %= width;
      image(bg, int(bgX), 0, width, height);
      if (bgSpeed < 0)image(bg, int(bgX + width), 0, width, height);
      else if(bgSpeed > 0)image(bg, int(bgX - width), 0, width, height);
  }
}

class Button
{
  PVector ButtonUpLeft;
  PVector ButtonLowRight;
  float ButtonWidth;
  float ButtonHeight;
  String Message;
  color c;

  Button(float tempX, float tempY, float tempWidth, float tempHeight, String tempMessage)
  {
    ButtonUpLeft = new PVector(tempX, tempY);
    ButtonLowRight = new PVector(tempX + tempWidth, tempY + tempHeight);
    ButtonWidth = tempWidth;
    ButtonHeight = tempHeight;
    Message = tempMessage;
  }
  
  void interact()
  {
      if(intersectsButtonPressed())
      {
        background(0);;
      }
  }
  boolean intersectsButtonPressed()
  {
    if(mouseX > ButtonUpLeft.x && mouseX < ButtonLowRight.x && mousePressed)
    {
      if(mouseY > ButtonUpLeft.y && mouseY < ButtonLowRight.y && mousePressed)
      {
        return true;
      }
    }
    return false;
  }
  boolean intersectsButton()
  {
    if(mouseX > ButtonUpLeft.x && mouseX < ButtonLowRight.x)
    {
      if(mouseY > ButtonUpLeft.y && mouseY < ButtonLowRight.y)
      {
        return true;
      }
    }
    return false;
  }
  void display(color c)
  {
    rectMode(CORNERS);
    fill(c);
    rect(ButtonUpLeft.x, ButtonUpLeft.y, ButtonLowRight.x, ButtonLowRight.y, 10);
  }
  void txt(color c)
  {
    textFont(f);
    fill(c);
    textAlign(CENTER);
    text(Message, ButtonUpLeft.x + ButtonWidth/2, ButtonUpLeft.y + ButtonHeight/3*2);
  }
}


class StartButton extends Button
{
  StartButton(float tempX, float tempY, float tempWidth, float tempHeight, String tempMessage)
  {
    super(tempX, tempY, tempWidth, tempHeight, tempMessage);
  }
  void interact()
  {
    if(intersectsButtonPressed())
    {
      background.looping();
    }
    else
    {
      background(0);
    }
  }
  void highlight()
  {
    if (intersectsButton())
    {
      display(color(0, 255, 0));
      txt(color(0, 0, 255));
    }
    else
    {
      display(color(255, 255, 255));
      txt(color(0, 0, 0));
    }
  }
}


class QuitButton extends Button
{
  QuitButton(float tempX, float tempY, float tempWidth, float tempHeight, String tempMessage)
  {
    super(tempX, tempY, tempWidth, tempHeight, tempMessage);
  }
  void interact()
  {
    if(intersectsButtonPressed())
    {
      exit();
    }
  }
  void highlight()
  {
    if (intersectsButton())
    {
      display(color(0, 255, 0));
      txt(color(0, 0, 255));
    }
    else
    {
      display(color(255, 255, 255));
      txt(color(0, 0, 0));
    }
  }
}
    

void keyPressed()
{
  if (key == ' ')
  {
    up = -1;
  }
}

void keyReleased()
{
  if (key == ' ')
  {
    up = 0;
  }
}
int counter;
void game()
{
  background.looping();
  player.move();
  player.display();
  obstacle.move();
  obstacle.display();
  collisionDetection();
}

void collisionDetection()
{
  if(boxesIntersect()) endGame();
}

void endGame()
{
  background(0);
}
/*
float obstacleX;
float obstacleY;
float obstacleWidth;
float obstacleHeight;
float playerX;
float playerY;
float playerWidth;
float playerHeight;
*/

boolean boxesIntersect()
{
  if ((playerWidth > obstacleX && playerWidth < obstacleWidth) || (playerX > obstacleX && playerX < obstacleWidth))
  {
    if ((playerHeight > obstacleY && playerHeight <= obstacleHeight) || (playerY > obstacleY && playerY < obstacleHeight))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  else 
  {
    return false;
  }
}



boolean startButPressed = false;
boolean quitButPressed = false;

void menu()
{
  background(0);
  if (startBut.intersectsButtonPressed())
  {
    startButPressed = !startButPressed;
  }
  if (startButPressed)
  {
    game();
    
  }
  else
  {
   
  quitBut.interact();
  
  startBut.highlight();
  quitBut.highlight(); 
  }
}

float obstacleX;
float obstacleY;
float obstacleWidth;
float obstacleHeight;

class Obstacle
{
  //variables
  float x1, y1, x2, y2, vx;
  float maxSpeed;
  float minHeight;
  float maxHeight;
  
  Obstacle(float tempGround, float tempSpeedInc, float tempMaxSpeed, float tempMinHeight, float tempMaxHeight)
  {  
    
    x2 = -1;
    y2 = tempGround;
    x1 = x2 - 50;
    y1 = y2 - 50;
    
    vx = -tempSpeedInc;
    maxSpeed = tempMaxSpeed;
    minHeight = tempMinHeight;
    maxHeight = tempMaxHeight;
    
  }
  
  void move()
  {
    x2 += vx;
    x1 = x2 - 50;
    
    // obstacle is leaving the window 
    if(x2 < 0)
    {
      float k = int(random(-30, 30));
      float m = int(random(0, width + 51));
      x2 += width + m;
      x1 = x2 - 50;
      y1 += k;
      //if maximum speed is reached, stop increasing
      if(vx >= -maxSpeed)
      {
        vx -= 5;
      }
      
      // if smaller than minimum height make larger
      if (y2 - y1 < minHeight)
      {
        y1 -= 15;
      }
      
      //if larger than maximum height, make smaller
      if (y2 - y1 > maxHeight)
      {
        y1 += 15;
      }
    }
  }
  //display the obstacle rectangle
  void display()
  {
    rectMode(CORNERS);
    rect(x2, y2, x1, y1);
    obstacleX = x1;
    obstacleY = y1;
    obstacleWidth = x2;
    obstacleHeight = y2;
  }
}

float playerX;
float playerY;
float playerWidth;
float playerHeight;


class Player
{
  //variables
  PVector pos;
  float dir;
  PVector vel;
  float jumpSpd;
  float grav;
  float ground;
  
  Player( float spdMult, float tempGround, float xPos)
  {
  // 10 and 0.5 are base numbers, if they are not relative to each other ground starts glitching
  // FIX!  
  jumpSpd = 10 * spdMult;
  grav = 0.5 * spdMult;
  ground = tempGround;
  pos = new PVector(xPos, ground);
  vel = new PVector(0,0);
  }




void move()

{
  //only apply gravity above ground
  if (pos.y <= ground)
  {
    vel.y += grav;
  }
  else
  {
    vel.y = 0;
  }
  
  // if on ground and "jump" key is pressed set upwards velocity to jump speed
  if (pos.y >= ground && up !=0)
  {
    vel.y = -jumpSpd;
  }
  //check if player is leaving the window or going below ground
  PVector nextPos = new PVector(pos.x, pos.y);
  nextPos.add(vel);
  
  float offset = 0;
  if (nextPos.y > 0 && nextPos.y < height && nextPos.y <= ground)
  {
    pos.y = nextPos.y;
  }
}

// display the player rectangle
void display()
{
  rectMode(CORNERS);
  rect(pos.x -50 ,pos.y -50 ,pos.x, pos.y);
  playerX = pos.x - 50;
  playerY = pos.y - 50;
  playerWidth = pos.x;
  playerHeight = pos.y;
  }
}



