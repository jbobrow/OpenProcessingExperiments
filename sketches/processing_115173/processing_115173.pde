
//Background
PImage neptune;
PImage earth;
PImage pluto;
PImage mars;
PImage saturn;
PImage Uranus;
PImage venus;

//Creates references of the cannon, ship and bullet objects
Cannon mainCannon;
Spaceship mainShip;
Bullet[] bullets;
boolean[] bulletActive;

int milliseconds;

void setup()
{
  size(600, 600);
  background(255);
  
  //Background
  neptune= loadImage ("neptune.png"); //neptune texture
  earth = loadImage ("earth.jpg"); //earth texture
  pluto = loadImage ("pluto.jpg"); //pluto texture
  mars = loadImage ("mars.jpg"); //mars texture
  saturn = loadImage ("saturn.png"); //saturn texture
  Uranus = loadImage ("Uranus.jpg"); //uranus texture
  venus = loadImage ("venus.jpg"); //venus texture
  
  mainCannon = new Cannon();
  bullets = new Bullet[6];
  bulletActive = new boolean[bullets.length];
  
  milliseconds = 0;
  
  smooth(); 
  
  mainShip = new Spaceship();
}

void draw()
{
  stroke(0, 0, 0);
  fill(0);
  rect(0, 0, height, width);
 
  if(keyPressed)
  {
    if(key == 'a')
    {
      createBullet();
    }
  }
  
  drawPlanets();
  mainCannon.update();
  updateBullets();
  mainShip.update();
  
  collisionCheck(mainShip.xPos, mainShip.yPos, mainShip.sWidth , mainShip.sHeight);
  
  //Handle the cannon reload action
  if(mainCannon.reload > 0)
  {
    mainCannon.reload -= (millis() - milliseconds);
  }
  
  milliseconds = millis();
}

void drawPlanets()
{
  //draws planets 
  image(neptune, 0, 10, 300, 300);
  image(earth, 270, 220, 200, 200);
  image(pluto, 260,50, 50, 50);
  image(mars, 400, 0, 300, 225);
  image(saturn, 20, 400, 215, 215);
  image(Uranus, 500, 400, 120, 120);
  image(venus, 300, 500, 190, 190);
}

//Find a bullet which is not currently in use and create it
void createBullet()
{
  if(mainCannon.reload < 1)
  {
    for(int i = 0; i < bullets.length; i++)
    {
      if(bulletActive[i] == false)
      {
        bullets[i] = new Bullet();
        bulletActive[i] = true;
        
        bullets[i].id = i;
        mainCannon.reload = 300;
        
        break;
      }
    }
  }
}

//Loop through each bullet, if it is active, update it
void updateBullets()
{
  for(int i = 0; i < bullets.length; i++)
  {
    if(bulletActive[i] == true) 
    {
      bullets[i].update();
    }
  }
}

//Loop through each active bullet, checking for collisions
//Parameters - The position and size of the target
void collisionCheck(float targetX, float targetY, float targetWidth, float targetHeight)
{
  for(int i = 0; i < bullets.length; i++)
  {
    if(bulletActive[i] == true) 
    {
      //Left, right, upper and bottom sides
      float targetL, targetR, targetU, targetB;
      float bulletL, bulletR, bulletU, bulletB;
      
      targetL = targetX;
      targetR = targetX + targetWidth;
      targetU = targetY;
      targetB = targetY + targetHeight;
      
      //Bullet: width - 2, Height - 10
      bulletL = bullets[i].xPos;
      bulletR = bullets[i].xPos + 2;
      bulletU = bullets[i].yPos;
      bulletB = bullets[i].yPos + 10;
      
      //If a collision is detected, reset the ship and destroy the current bullet
      if(!((bulletL > targetR) || (bulletR < targetL) || (bulletU > targetB) || (bulletB < targetU))) 
      {
        bulletActive[i] = false;
        mainShip = new Spaceship();
      }
    }
  }
}

class Cannon
{
  //Declare fields
  float xPos, yPos, speed;
  int cWidth, cHeight;
  float reload;
  
  Cannon()
  {
    //Initialise fields
    xPos = width / 2;
    yPos = height - 25;
    speed = 2;
    cWidth = 5;
    cHeight = 20;
    reload = 0;
  }
  
  void update()
  {
    stroke(90, 90, 90);
    fill(90);
    
    //When a directional key is pressed, move the cannon in the correct direction if it is still visible
    if(keyPressed)
    {
      if(keyCode == LEFT && xPos > 0) xPos -= speed;
      if(keyCode == RIGHT && xPos < width - cWidth) xPos += speed;
    }
    
    rect(xPos, yPos, cWidth, cHeight);
  }
}

class Bullet
{
  //Declare fields
  float xPos, yPos, speed;
  int id;
  
  Bullet()
  {
    //Initialise fields
    speed = 6;
    
    //Place a bullet at its starting location
    xPos = mainCannon.xPos + (mainCannon.cWidth / 2);
    yPos = mainCannon.yPos;
  }
  
  void update()
  {
    //If the bullet is on screen, update it.
    if(yPos < 0) 
    {
      bulletActive[id] = false; //Mark a bullet as inactive when it leaves the screen
    }
    else
    {
      stroke(242, 237, 130);
      fill(90);
    
      yPos -= speed;
  
      rect(xPos, yPos, 2, 10);
    } 
  }
}

class Spaceship
{
  //Declare fields
  float xPos, yPos, speed, sWidth, sHeight;
  boolean active;
  
  Spaceship()
  {
    //Initialise fields
    xPos = width - random(width);
    yPos = random(width / 2) + 10;
    speed = 2 - random(4);
    
    sWidth = 40;
    sHeight = 15;
    
    active = true;
  }
  
  void update()
  {
    if(active)
    {
      stroke(242, 237, 130);
      fill(90);
      
      if(xPos < -40) xPos = width;
      else if(xPos > width + 1) xPos = -20;  
      xPos += speed;
      
      rect(xPos, yPos, sWidth, sHeight);
    }
  }
}
