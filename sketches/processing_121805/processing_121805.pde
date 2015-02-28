

//map
PImage collisionImage;
PImage displayImage;

PImage collisionImage2;
PImage displayImage2;

PImage collisionImage3;
PImage displayImage3;

PImage collisionImage4;
PImage displayImage4;

PImage collisionImage5;
PImage displayImage5;

//player
PImage RStand, LStand, RMove, LMove, RLand, LLand, RJump, LJump;
PImage URStand, ULStand, URMove, ULMove, URLand, ULLand, URJump, ULJump;
PImage currentMan;


float playerX = 50;
float playerY = 650;
float nextX;
float nextY;
float playerVelocityY = 0;
float playerVelocityX = 0;
float shootDirectionX = 1;
float shootDirectionY = 0;
float playerSpeed = 1.5;
float playerJumpSpeed = -35;
float playerSize = 80;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround = true;
boolean onTop = false;
float gravity = 0.5;


float angle = 0;
float x = 0;
float speed = 1;
Enemy mother;
int shotCount = 10;
Shot[] shots = new Shot[shotCount];
Shot kid;
int shotIndex;
float timer = 0;
float shotTimer = 0;

float health = 100;
float MAX_HEALTH = 100;
float rectWidth = 50;
float jmanHealth = 100;
float jmanMaxHealth = 100;
float jmanRectWidth = 100;

PFont arial;
PFont hobo;
float gameState = 0;

SpriteObject door;



// Bullet Class
class Bullet extends SpriteObject
{
  Bullet(String filename)
  {
    super(filename);
  }
    
  void update()
  {
    this.rotation = degrees(atan2(this.directionY, this.directionX));
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}
 
int bulletCount = 10;
Bullet[] bullets = new Bullet[bulletCount];
int bulletIndex = 0;


class Shot extends SpriteObject
{
  Shot(String filename)
  {
    super(filename);
  }

  void update()
  {
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}


class Enemy extends SpriteObject
{
  Enemy(String filename)
  {
    super(filename);
  }
  
    void update()
  {
    super.update();
    this.y += this.directionY * this.speed;
    this.x += this.directionX * this.speed;
  }
}



boolean isRectOverlapping(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



void setup()
{
  
  size(500, 800);
  
  mother = new Enemy("mom.png");
  mother.x = 400;
  mother.y = 50;
  mother.scaleX = 0.15;
  mother.scaleY = 0.15;
  mother.speed = 3;
  mother.directionX = -1;
  
 for (int t = 0; t < shotCount; t += 1)
  {
    shots[t] = new Shot("Enemy.png");
    shots[t].x = -1000;
    shots[t].y = -1000;
    shots[t].scaleX = 0.1;
    shots[t].scaleY = 0.1;
  }

  
  for (int i = 0; i < bulletCount; i += 1)
  {
    bullets[i] = new Bullet("bullet.png");
    bullets[i].x = -1000;
    bullets[i].y = -1000;
    bullets[i].scaleX = 0.1;
    bullets[i].scaleY = 0.1;
  }
  
  arial = createFont("Arial Black", 64);
  hobo = createFont("Hobo Std", 64);
  
  collisionImage = requestImage("level1.png");
  displayImage = requestImage("level1detail.png");
  
  collisionImage2 = requestImage("level2.png");
  displayImage2 = requestImage("level2detail.png");
  
  collisionImage3 = requestImage("level3.png");
  displayImage3 = requestImage("level3detail.png");
  
  collisionImage4 = requestImage("level4.png");
  displayImage4 = requestImage("level4detail.png");

  collisionImage5 = requestImage("level5.png");
  displayImage5 = requestImage("level5detail.png");  
  
  RStand = requestImage("JmanRightBot.png");
  LStand = requestImage("JmanLeftBot.png");
  RMove = requestImage("JmanRightMotionBot.png");
  LMove = requestImage("JmanLeftMotionBot.png");
  RLand = requestImage("JmanRightLandBot.png");
  LLand = requestImage("JmanLeftLandBot.png");
  RJump = requestImage("JmanRightJumpAirBot.png");
  LJump = requestImage("JmanLeftJumpAirBot.png");
  URJump = requestImage("JmanRightJumpAirTop.png");
  ULJump = requestImage("JmanLeftJumpAirTop.png");
  currentMan = loadImage("JmanRightBot.png");
  
  door = new SpriteObject("door.png");
  door.x = 31.5;
  door.y = 33;
  door.scaleX = 0.2;
  door.scaleY = 0.4;

}


void draw()
{
  
  background(0);
  
  shotTimer += 0.0167;
  
  
  if (gameState == 0)
  {
    background(0);
    fill(0, 255, 0);
    textFont(hobo);
    textSize(100);
    text("Jello", 150, 200);
    text("Man", 150, 350);
    textFont(arial);
    textSize(32);
    text("Left-Click", 162, 500);
    text("To Start", 172, 540);
  }
  
  if (gameState == 1)
  {
    background(0);
    fill(0, 255, 0);
    textFont(arial);
    textSize(32);
    text("Dodge the Mother", 75, 150);
    text("and the Kids who", 75, 200);
    text("are trying to eat", 75, 250);
    text("you before escaping", 75, 300);
    text("to the nearest", 75, 350);
    text("Jello Box.", 75, 400);
    
    text("Space Bar = Jump", 100, 500);
    text("Left Arrow = Move Left", 50, 550);
    text("Right Arrow = Move Right", 40, 600);
  }
  
  if (gameState == 2)
  {
    textFont(hobo);
    textSize(100);
    text("You", 160, 200);
    text("Died", 150, 300);
    textSize(50);
    text("Left-Click", 145, 500);
    text("To Restart", 130, 550);
    
     playerX = 50;
     playerY = 650;
     playerVelocityX = 0;
     playerVelocityY = 0;
     jmanHealth = 100;
      
     mother.y = 50;
     mother.x = 400;
    
  }
  

  
  if (onTop == false)
  {
    playerVelocityY += gravity;
  }
  else
  {
    playerVelocityY -= 10;
  }
  playerVelocityX = (rightKey - leftKey) * playerSpeed;
  
  nextY = playerY + playerVelocityY;
  nextX = playerX + playerVelocityX;
  
  onGround = false;
  onTop = false;
  

  if (gameState == 3)
  {
    collideWithLevel(collisionImage);
    imageMode(CORNER);
    image(displayImage, 0, 0, width, height);
    
    door.update();
    door.render();
   
    nextX += 20;   
    playerX += 20;
    playerY += 20;
    nextY += 20;
  
    float imgWidth = playerSize - 40;
    float imgHeight = playerSize - 35;
  
    float imgleft = playerX;
    float imgtop = nextY;
    float imgright = playerX + imgWidth;
    float imgbottom = nextY + imgHeight;
    
    if (door.isOverlappingImg(imgleft, imgtop, imgright, imgbottom) == true)
    {
      gameState += 1;
      playerX = 50;
      playerY = 650;
      playerVelocityX = 0;
      playerVelocityY = 0;
      health = 100;
      jmanHealth = 100;
    }  
    
    nextX -= -20;
    playerX -= 20;
    playerY -= 20;
    nextY -= -20;

  for (int t = 0; t < shotCount; t += 1)
  {
    shots[t].update();
    shots[t].render();
    if ( shots[t].isOverlappingImg(imgleft, imgtop, imgright, imgbottom) == true)
    {
     jmanHealth -= 40;
     shots[t].x = -1000;
     shots[t].y = -1000;
     shots[t].directionX = 0;
     shots[t].directionY = 0;
    }
  }
  if (jmanHealth < 25)
  {
    fill(255, 0, 0);
  } 
  else if (jmanHealth < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
    noStroke();
  float drawJmanWidth = (jmanHealth / jmanMaxHealth) * jmanRectWidth;
  rect(390, 10, drawJmanWidth, 25);
  
  stroke(0);
  noFill();
  rect(390, 10, jmanRectWidth, 25);
    
  mother.update();
  mother.render();
   
  
  if (jmanHealth > 0)
  {
  playerX += playerVelocityX;
  playerY += playerVelocityY;
  
     imageMode(CORNER);
     if (playerVelocityY < 0)
  {
    if (currentMan == RStand)
    {
      image(RJump, playerX, playerY, playerSize, playerSize);
    }
    else
    {
      image(LJump, playerX, playerY, playerSize, playerSize);
    }
  }
  
  if (playerVelocityY <= 5 && playerVelocityY >= 0)
  {
    image(currentMan, playerX, playerY, playerSize, playerSize);
  }
  
  if (playerVelocityY > 5)
  {
    if(currentMan == RStand)
    {
      image(URJump, playerX, playerY, playerSize, playerSize);
    }
    else
    {
      image(ULJump, playerX, playerY, playerSize, playerSize);
    }
  }
   }
 else if (jmanHealth < 0)
 {
   gameState = 2;
 }
  
    if (shotTimer > 0.25)
  {
    if (random(0, 1) < 0.25)
    {
      shots[shotIndex].x = mother.x;
      shots[shotIndex].y = mother.y;
      shots[shotIndex].speed = 5;
      shots[shotIndex].directionY = 1;
      shotIndex += 1;
      if (shotIndex >= shotCount)
      {
        shotIndex = 0;
      }
    }
    shotTimer = 0;
  }
    
  }
  
  if (gameState == 4)
  {
    collideWithLevel(collisionImage2);
    imageMode(CORNER);
    image(displayImage2, 0, 0, width, height);
    
    door.update();
    door.render();    
    
    nextX += 20;   
    playerX += 20;
    playerY += 20;
    nextY += 20;
  
    float imgWidth = playerSize - 40;
    float imgHeight = playerSize - 35;
  
    float imgleft = playerX;
    float imgtop = nextY;
    float imgright = playerX + imgWidth;
    float imgbottom = nextY + imgHeight;
    
    if (door.isOverlappingImg(imgleft, imgtop, imgright, imgbottom) == true)
    {
      gameState =     5;
      playerX = 50;
      playerY = 650;
      playerVelocityX = 0;
      playerVelocityY = 0;
      health = 100;
      jmanHealth = 100;
    } 
    
    nextX -= -20;
    playerX -= 20;
    playerY -= 20;
    nextY -= -20;

    
  for (int t = 0; t < shotCount; t += 1)
  {
    shots[t].update();
    shots[t].render();
    if ( shots[t].isOverlappingImg(imgleft, imgtop, imgright, imgbottom) == true)
    {
     jmanHealth -= 40;
     shots[t].x = -1000;
     shots[t].y = -1000;
     shots[t].directionX = 0;
     shots[t].directionY = 0;
    }
  }
    if (jmanHealth < 25)
  {
    fill(255, 0, 0);
  } 
  else if (jmanHealth < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
    noStroke();
  float drawJmanWidth = (jmanHealth / jmanMaxHealth) * jmanRectWidth;
  rect(390, 10, drawJmanWidth, 25);
  
  stroke(0);
  noFill();
  rect(390, 10, jmanRectWidth, 25);
  
  mother.update();
  mother.render();
    
   
  if (jmanHealth > 0)
 {
   
  playerX += playerVelocityX;
  playerY += playerVelocityY;
  
     imageMode(CORNER);
     if (playerVelocityY < 0)
  {
    if (currentMan == RStand)
    {
      image(RJump, playerX, playerY, playerSize, playerSize);
    }
    else
    {
      image(LJump, playerX, playerY, playerSize, playerSize);
    }
  }
  
  if (playerVelocityY <= 5 && playerVelocityY >= 0)
  {
    image(currentMan, playerX, playerY, playerSize, playerSize);
  }
  
  if (playerVelocityY > 5)
  {
    if(currentMan == RStand)
    {
      image(URJump, playerX, playerY, playerSize, playerSize);
    }
    else
    {
      image(ULJump, playerX, playerY, playerSize, playerSize);
    }
  }
 }
 else if (jmanHealth < 0)
 {
   gameState = 2;
 }
    if (shotTimer > 0.25)
  {
    if (random(0, 1) < 0.25)
    {
      shots[shotIndex].x = mother.x;
      shots[shotIndex].y = mother.y;
      shots[shotIndex].speed = 5;
      shots[shotIndex].directionY = 1;
      shotIndex += 1;
      if (shotIndex >= shotCount)
      {
        shotIndex = 0;
      }
    }
    shotTimer = 0;
  }
  }

  if (gameState == 5)
  {
    collideWithLevel(collisionImage3);
    imageMode(CORNER);
    image(displayImage3, 0, 0, width, height);
    
    door.update();
    door.render();    
    
    nextX += 20;   
    playerX += 20;
    playerY += 20;
    nextY += 20;
  
    float imgWidth = playerSize - 40;
    float imgHeight = playerSize - 35;
  
    float imgleft = playerX;
    float imgtop = nextY;
    float imgright = playerX + imgWidth;
    float imgbottom = nextY + imgHeight;
    
    if (door.isOverlappingImg(imgleft, imgtop, imgright, imgbottom) == true)
    {
      gameState += 1;
      playerX = 50;
      playerY = 650;
      playerVelocityX = 0;
      playerVelocityY = 0;
      health = 100;
      jmanHealth = 100;
    } 
    
    nextX -= -20;
    playerX -= 20;
    playerY -= 20;
    nextY -= -20;

    
  for (int t = 0; t < shotCount; t += 1)
  {
    shots[t].update();
    shots[t].render();
    if ( shots[t].isOverlappingImg(imgleft, imgtop, imgright, imgbottom) == true)
    {
     jmanHealth -= 40;
     shots[t].x = -1000;
     shots[t].y = -1000;
     shots[t].directionX = 0;
     shots[t].directionY = 0;
    }
  }
    if (jmanHealth < 25)
  {
    fill(255, 0, 0);
  } 
  else if (jmanHealth < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
    noStroke();
  float drawJmanWidth = (jmanHealth / jmanMaxHealth) * jmanRectWidth;
  rect(390, 10, drawJmanWidth, 25);
  
  stroke(0);
  noFill();
  rect(390, 10, jmanRectWidth, 25);
  
  mother.update();
  mother.render();
    
   
  if (jmanHealth > 0)
 {
   
  playerX += playerVelocityX;
  playerY += playerVelocityY;
  
     imageMode(CORNER);
     if (playerVelocityY < 0)
  {
    if (currentMan == RStand)
    {
      image(RJump, playerX, playerY, playerSize, playerSize);
    }
    else
    {
      image(LJump, playerX, playerY, playerSize, playerSize);
    }
  }
  
  if (playerVelocityY <= 5 && playerVelocityY >= 0)
  {
    image(currentMan, playerX, playerY, playerSize, playerSize);
  }
  
  if (playerVelocityY > 5)
  {
    if(currentMan == RStand)
    {
      image(URJump, playerX, playerY, playerSize, playerSize);
    }
    else
    {
      image(ULJump, playerX, playerY, playerSize, playerSize);
    }
  }
 }
 else if (jmanHealth < 0)
 {
   gameState = 2;
 }
    if (shotTimer > 0.25)
  {
    if (random(0, 1) < 0.25)
    {
      shots[shotIndex].x = mother.x;
      shots[shotIndex].y = mother.y;
      shots[shotIndex].speed = 5;
      shots[shotIndex].directionY = 1;
      shotIndex += 1;
      if (shotIndex >= shotCount)
      {
        shotIndex = 0;
      }
    }
    shotTimer = 0;
  }
  }
  
    if (gameState == 6)
  {
    collideWithLevel(collisionImage4);
    imageMode(CORNER);
    image(displayImage4, 0, 0, width, height);
    
    door.update();
    door.render();    
    
    nextX += 20;   
    playerX += 20;
    playerY += 20;
    nextY += 20;
  
    float imgWidth = playerSize - 40;
    float imgHeight = playerSize - 35;
  
    float imgleft = playerX;
    float imgtop = nextY;
    float imgright = playerX + imgWidth;
    float imgbottom = nextY + imgHeight;
    
    if (door.isOverlappingImg(imgleft, imgtop, imgright, imgbottom) == true)
    {
      gameState += 1;
      playerX = 50;
      playerY = 650;
      playerVelocityX = 0;
      playerVelocityY = 0;
      health = 100;
      jmanHealth = 100;
    } 
    
    nextX -= -20;
    playerX -= 20;
    playerY -= 20;
    nextY -= -20;

    
  for (int t = 0; t < shotCount; t += 1)
  {
    shots[t].update();
    shots[t].render();
    if ( shots[t].isOverlappingImg(imgleft, imgtop, imgright, imgbottom) == true)
    {
     jmanHealth -= 40;
     shots[t].x = -1000;
     shots[t].y = -1000;
     shots[t].directionX = 0;
     shots[t].directionY = 0;
    }
  }
    if (jmanHealth < 25)
  {
    fill(255, 0, 0);
  } 
  else if (jmanHealth < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
    noStroke();
  float drawJmanWidth = (jmanHealth / jmanMaxHealth) * jmanRectWidth;
  rect(390, 10, drawJmanWidth, 25);
  
  stroke(0);
  noFill();
  rect(390, 10, jmanRectWidth, 25);
  
  mother.update();
  mother.render();
    
   
  if (jmanHealth > 0)
 {
   
  playerX += playerVelocityX;
  playerY += playerVelocityY;
  
     imageMode(CORNER);
     if (playerVelocityY < 0)
  {
    if (currentMan == RStand)
    {
      image(RJump, playerX, playerY, playerSize, playerSize);
    }
    else
    {
      image(LJump, playerX, playerY, playerSize, playerSize);
    }
  }
  
  if (playerVelocityY <= 5 && playerVelocityY >= 0)
  {
    image(currentMan, playerX, playerY, playerSize, playerSize);
  }
  
  if (playerVelocityY > 5)
  {
    if(currentMan == RStand)
    {
      image(URJump, playerX, playerY, playerSize, playerSize);
    }
    else
    {
      image(ULJump, playerX, playerY, playerSize, playerSize);
    }
  }
 }
 else if (jmanHealth < 0)
 {
   gameState = 2;
 }
    if (shotTimer > 0.25)
  {
    if (random(0, 1) < 0.25)
    {
      shots[shotIndex].x = mother.x;
      shots[shotIndex].y = mother.y;
      shots[shotIndex].speed = 5;
      shots[shotIndex].directionY = 1;
      shotIndex += 1;
      if (shotIndex >= shotCount)
      {
        shotIndex = 0;
      }
    }
    shotTimer = 0;
  }
  }
  if (gameState == 7)
  {
    collideWithLevel(collisionImage5);
    imageMode(CORNER);
    image(displayImage5, 0, 0, width, height);
    
    door.update();
    door.render();    
    
    nextX += 20;   
    playerX += 20;
    playerY += 20;
    nextY += 20;
  
    float imgWidth = playerSize - 40;
    float imgHeight = playerSize - 35;
  
    float imgleft = playerX;
    float imgtop = nextY;
    float imgright = playerX + imgWidth;
    float imgbottom = nextY + imgHeight;
    
    if (door.isOverlappingImg(imgleft, imgtop, imgright, imgbottom) == true)
    {
      gameState += 1;
      playerX = 50;
      playerY = 650;
      playerVelocityX = 0;
      playerVelocityY = 0;
      health = 100;
      jmanHealth = 100;
    } 
    
    nextX -= -20;
    playerX -= 20;
    playerY -= 20;
    nextY -= -20;

    
  for (int t = 0; t < shotCount; t += 1)
  {
    shots[t].update();
    shots[t].render();
    if ( shots[t].isOverlappingImg(imgleft, imgtop, imgright, imgbottom) == true)
    {
     jmanHealth -= 40;
     shots[t].x = -1000;
     shots[t].y = -1000;
     shots[t].directionX = 0;
     shots[t].directionY = 0;
    }
  }
    if (jmanHealth < 25)
  {
    fill(255, 0, 0);
  } 
  else if (jmanHealth < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
    noStroke();
  float drawJmanWidth = (jmanHealth / jmanMaxHealth) * jmanRectWidth;
  rect(390, 10, drawJmanWidth, 25);
  
  stroke(0);
  noFill();
  rect(390, 10, jmanRectWidth, 25);
  
  mother.update();
  mother.render();
    
   
  if (jmanHealth > 0)
 {
   
  playerX += playerVelocityX;
  playerY += playerVelocityY;
  
     imageMode(CORNER);
     if (playerVelocityY < 0)
  {
    if (currentMan == RStand)
    {
      image(RJump, playerX, playerY, playerSize, playerSize);
    }
    else
    {
      image(LJump, playerX, playerY, playerSize, playerSize);
    }
  }
  
  if (playerVelocityY <= 5 && playerVelocityY >= 0)
  {
    image(currentMan, playerX, playerY, playerSize, playerSize);
  }
  
  if (playerVelocityY > 5)
  {
    if(currentMan == RStand)
    {
      image(URJump, playerX, playerY, playerSize, playerSize);
    }
    else
    {
      image(ULJump, playerX, playerY, playerSize, playerSize);
    }
  }
 }
 else if (jmanHealth < 0)
 {
   gameState = 2;
 }
    if (shotTimer > 0.25)
  {
    if (random(0, 1) < 0.25)
    {
      shots[shotIndex].x = mother.x;
      shots[shotIndex].y = mother.y;
      shots[shotIndex].speed = 5;
      shots[shotIndex].directionY = 1;
      shotIndex += 1;
      if (shotIndex >= shotCount)
      {
        shotIndex = 0;
      }
    }
    shotTimer = 0;
  }
  }
  
  if (gameState == 8)
  {
    background(0);
    fill(0, 255, 0);
    textFont(hobo);
    textSize(100);
    text("You", 150, 200);
    text("Win!", 150, 300);
    textFont(arial);
    textSize(50);
    text("Click To", 140, 500);
    text("Restart", 150, 550);
    
  }
  

}

void mouseReleased()
{

  
  if ((gameState == 0 || gameState == 2) && mouseButton == LEFT)
  {
    gameState = 1;
  }
  else if (gameState == 1 && mouseButton == LEFT)
  {
    gameState = 3;
  }
  else if (gameState == 8 && mouseButton == LEFT)
  {
    gameState = 0;
  }

}
     


void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 0;
      currentMan = LStand;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 0;
      currentMan = RStand;
    }
    if (keyCode == UP)
    {
      upKey = 0;
    }
    if (keyCode == DOWN)
    {
      downKey = 0;
    }
  }
}
 
void keyPressed()
{
  if (key == ' ')
  {
    if (onGround == true)
    {
      playerVelocityY = playerJumpSpeed;
      //shootDirectionY = -1;
      //shootDirectionX = 0;
    }
    else if (onTop == true)
    {
      playerVelocityY = -playerJumpSpeed;
      //shootDirectionY = 1;
      //shootDirectionX = 0;
    }
  }
 
 
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 1;
      currentMan = LMove;
      shootDirectionX = -1;
      shootDirectionY = 0;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 1;
      currentMan = RMove;
      shootDirectionX = 1;
      shootDirectionY = 0;
    }
    if (keyCode == UP)
    {
      upKey = 1;
    }
    if (keyCode == DOWN)
    {
      downKey = 1;
    }
  }
}



void collideWithLevel(PImage collisionImage)
{
    if (collisionImage.width > 0)
    {
     nextX += 20;
     playerX += 20;
     playerY += 20;
     nextY += 20;
    collisionImage.loadPixels();
    for (int y = 0; y < collisionImage.height; y += 1)
    {
      for (int x = 0; x < collisionImage.width ; x += 1)
      {
        color pixelColor = collisionImage.pixels[y*collisionImage.width+x];
     
        float platformSize = 10;
        float platformX = x * platformSize;
        float platformY = y * platformSize;
        
        float collideWidth = playerSize - 40;
        float collideHeight = playerSize - 35;
        //playerY += 20;
         
        boolean collided = isRectOverlapping(nextX, playerY, nextX + collideWidth, playerY + collideHeight,
          platformX, platformY, platformX + platformSize, platformY + platformSize);
           
        if (collided == true && red(pixelColor) == 0)
        {
           // moving left and character is currently on the right side of the wall
          if (playerVelocityX < 0 && playerX + collideWidth >= platformX + platformSize)
          {
            playerVelocityX = 0;
          }
          // moving right and character is currently on the left side of the wall
          if (playerVelocityX > 0 && playerX < platformX)
          {
            playerVelocityX = 0;
          }
        }
         
         //playerY -= 20; 
        collided = isRectOverlapping(playerX, nextY, playerX + collideWidth, nextY + collideHeight,
          platformX, platformY, platformX + platformSize, platformY + platformSize);
        
           
        if (collided == true && red(pixelColor) == 0)
        {
          // bottom
          if (playerVelocityY > 0 && playerY + collideHeight < platformY)
          {
            playerVelocityY = 0;
            onGround = true;
          }
          // top
          if (playerVelocityY < 0 && playerY > platformY + platformSize)
          {
            onTop = true;
            playerVelocityY = 0;
          }
        }
      }
    }
    nextX -= 20;
    playerX -= 20;

    nextY -= 20;
    playerY -= 20;
  }
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float scaleX = 1.0;
  float scaleY = 1.0;
  PImage img;
  boolean loaded = false;
       
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
  
    boolean isOverlappingImg(float imgleft, float imgtop, float imgright, float imgbottom)
  {
    float left = this.x - (this.w * 0.5 * this.scaleX);
    float right = this.x + (this.w * 0.5 * this.scaleX);
    float top = this.y - (this.h * 0.5 * this.scaleY);
    float bottom = this.y + (this.h * 0.5 * this.scaleY);;
         
    return !(left > imgright || right < imgleft || top > imgbottom || bottom < imgtop);
  }
    
  void update()
  {
    if (this.x > (width + 10) - (this.w * this.scaleX * 0.5) && this.directionX > 0)
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

boolean imgImgIntersect(float imgleft, float imgtop, float imgright, float imgbottom,
                          float imgotherLeft, float imgotherTop, float imgotherRight, float imgotherBottom) {
  return !(imgleft > imgotherRight || imgright < imgotherLeft || imgtop > imgotherBottom || imgbottom < imgotherTop);
}



