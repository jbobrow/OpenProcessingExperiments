
int win = 0;

PImage player;
PImage trainer1;
PImage trainer2;
PImage trainer3;
PImage field;

float playerX = 265;
float playerY = 500;
float myhorizontalspeed = 0;
float myverticalspeed = 0;

//First trainer's starting position
float trainer1xstart = 0;
//First trainer's position on Y axis
float trainer1yposition = 100;
float trainer1SVision = trainer1yposition + 51; 

float trainer2xstart = 600;
float trainer2yposition = 260;
float trainer2SVision = trainer2yposition + 51;

float trainer3xstart = 0;
float trainer3yposition = 410;
float trainer3SVision = trainer3yposition + 51;

 
void setup()
{
  size(600,600);
  player = loadImage("player.png");
  trainer1 = loadImage("trainer1.png");
  trainer2 = loadImage("trainer2.png");
  trainer3 = loadImage("trainer3.png");
  field = loadImage("field.png");
}
 
void draw() 
{

  if (win == 0)
  {
    image(field,0,0);
    playerX += myhorizontalspeed;
    playerY += myverticalspeed;

    
    //trainers' speed
    trainer1xstart += 8;
    trainer2xstart += -2;
    trainer3xstart += 5;
    
    //how long the trainer takes to come back around
    if (trainer1xstart > width) 
    {
      trainer1xstart = -50;
    }
    if (trainer2xstart < -10)
    {
      trainer2xstart = width;
    }
    if (trainer3xstart > width) 
    {
      trainer3xstart = -30;
    }
    
    float trainer1FVision = trainer1xstart + 68;
    float trainer2FVision = trainer2xstart + 68;
    float trainer3FVision = trainer3xstart + 68;
   
    image(player,playerX,playerY);
    image(trainer1,trainer1xstart,trainer1yposition);
    image(trainer2,trainer2xstart,trainer2yposition);
    image(trainer3,trainer3xstart,trainer3yposition);
   
    //if player goes too far to the side, he reappears on the other side
    if (playerX > width)
    {
      playerX = 0;
    }
    
    //if you cross this line you win
    if (playerY < 80)
    {
      win = 1;
    }     
    //Prevents character from disappearing at the bottom of screen
    if (playerY > 525)
    {
      playerY = 525;     
    }
     
    if (playerY < trainer1SVision && playerY > trainer1yposition ) 
    {
      if (playerX < trainer1FVision && playerX > trainer1xstart)
      {
        win = -1;
      }
    }
    if (playerY < trainer2SVision && playerY > trainer2yposition )
    {
      if (playerX < trainer2FVision && playerX > trainer2xstart) 
      {
        win = -1;
      }
    }     
    if (playerY < trainer3SVision && playerY > trainer3yposition )
    {
      if (playerX < trainer3FVision && playerX > trainer3xstart) 
      {
        win = -1;
      }
    }   
    
    if (isOverlappingRect(
      playerX, playerY, playerX + 56, playerY + 75, 
      trainer1xstart, trainer1yposition, trainer1FVision, trainer1SVision) == true)
    {
      win = -1;
    }  
    if (isOverlappingRect(
      playerX, playerY, playerX + 56, playerY + 75, 
      trainer2xstart, trainer2yposition, trainer2FVision, trainer2SVision) == true)
    {
      win = -1;
    }  
    if (isOverlappingRect(
      playerX, playerY, playerX + 56, playerY + 75, 
      trainer3xstart, trainer3yposition, trainer3FVision, trainer3SVision) == true)
      
    {
      win = -1;
      
    }      
  }
  
  if (win == 1)
  {
    background(#3B00F2);
    textSize(30);
    text("Your Pokemon are all healed up!",60,280);
  }
  if (win == -1)
  {
    background(0);
    textSize(30);
    fill(255);
    text("Ash is out of usable pokemon.",80,280);
    text("He fled the battle.", 175,315);
  }
}
   
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      myverticalspeed = -3;
    }
    if (keyCode == DOWN){
      myverticalspeed = 3;
    }
    if (keyCode == LEFT) {
      myhorizontalspeed = -3;
    }
    if (keyCode == RIGHT){
      myhorizontalspeed = 3;
    }
  }
}
 
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN)
    {
      myverticalspeed = 0;
    }
    if (keyCode == LEFT || keyCode == RIGHT)
    {
      myhorizontalspeed = 0;
    }
  }
}

boolean isOverlappingRect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}




