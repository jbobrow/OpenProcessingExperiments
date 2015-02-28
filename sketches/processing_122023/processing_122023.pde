
//tank sprite credit: xnaresources.com
//bullet sprite credit: d9rad from spriters-resource.com
//factory sprite credit: OpenTTD Wiki page (Open source game based on 
//  Transport Tycoon; visit openttd.org)

SpriteObject playerChassis, playerTurret, enemyBase, playerBase;
PImage grass;
PFont stencilLarge, stencil;
boolean up, down, left, right, pregame, win, lose, endBegun, setupDone;
int[] enemyMovement = new int[15];
float[] shotTimers = new float[15];
Bullet[] bullets = new Bullet[15];
Bullet[] enemyBullets = new Bullet[15];
SpriteObject[] blockers = new SpriteObject[70];
SpriteObject[] temp = new SpriteObject[20];
SpriteObject[] enemyChassis = new SpriteObject[15];
SpriteObject[] enemyTurrets = new SpriteObject[15];
SpriteObject[] pellets = new SpriteObject[9];
AnimatedSpriteObject[] bExplosions = new AnimatedSpriteObject[15];
AnimatedSpriteObject[] cExplosions = new AnimatedSpriteObject[5];
SpriteObject redBase, blueBase;
AnimatedSpriteObject[] endExplode = new AnimatedSpriteObject[4];
int bVal, EBVal, enemyCounter, bExpCount, cExpCount, d, score;
int pelletCount, killCount, deaths;
float timer, gameTimer;

void setup()
{
  size(600, 600);
  playerChassis = new SpriteObject("blueTankChassis.png");
  playerChassis.x = 560;
  playerChassis.y = 300;
  playerTurret = new SpriteObject("blueTankTurret.png");
  playerTurret.x = playerChassis.x;
  playerTurret.y = playerChassis.y;
  
  for(int c = 0; c < 15; c++)
  {
    bullets[c] = new Bullet("fireSprite.png");
    bullets[c].speed = 10;
    bullets[c].x = -100;
    bullets[c].y = -100;
  }
  
  for(int c = 0; c < 15; c++)
  {
    enemyBullets[c] = new Bullet("fireSprite.png");
    enemyBullets[c].speed = 10;
    enemyBullets[c].x = -100;
    enemyBullets[c].y = -100;
  }
  
  for(int c = 0; c < 15; c++)
  {
    enemyChassis[c] = new SpriteObject("redTankChassis.png");
    enemyChassis[c].x = 40;
    enemyChassis[c].y = 300;
    
    enemyTurrets[c] = new SpriteObject("redTankTurret.png");
    enemyTurrets[c].x = 40;
    enemyTurrets[c].y = 300;
    
    enemyMovement[c] = (int)random(1, 5);
  }
  
  for(int c = 0; c < 24; c++)
  {
    blockers[c] = new SpriteObject("blocker.png");
    blockers[c+24] = new SpriteObject("blocker.png");
    blockers[c+35] = new SpriteObject("blocker.png");
    
    if(c < 12)
    {
      blockers[c].x = 290 + (20*(int)(c/6));
      blockers[c].y = 120+(20*(int)(c%6));
      
      blockers[c+24].x = 290 + (20*(int)(c/6));
      blockers[c+24].y = 380+(20*(int)(c%6)); 
    }
    
    else if (c < 24)
    {
      blockers[c].x = 250 + (20*(int)((c-12)%6));
      blockers[c].y = 160 + (20*(int)((c-12)/6));
      
      blockers[c+24].x = 250 + (20*(int)((c-12)%6));
      blockers[c+24].y = 420 + (20*(int)((c-12)/6));
    }
  }
  
  for(int c = 0; c < 20; c++)
  {
    temp[c] = new SpriteObject("blocker.png");
    temp[c].x = 100 + (400*(int)(c/10));
    temp[c].y = 225 + (20*(int)(c%10));
  }
  
  for(int c = 48; c < 68; c++)
  {
    blockers[c] = temp[c-48];
  }
  
  for(int c = 0; c < 15; c++)
  {
    bExplosions[c] = new AnimatedSpriteObject("explosionSheet.png");
    bExplosions[c].x = -100;
    bExplosions[c].y = -100;
    bExplosions[c].s = 0.35;
    bExplosions[c].frameWidth = 115;
    bExplosions[c].frameHeight = 95; 
  }
  
  for(int c = 0;c < 5; c++)
  {
    cExplosions[c] = new AnimatedSpriteObject("explosionSheet.png");
    cExplosions[c].x = -100;
    cExplosions[c].y = -100;
    cExplosions[c].s = 0.5;
    cExplosions[c].frameWidth = 115;
    cExplosions[c].frameHeight = 95;
  }
  
  redBase = new SpriteObject("redFactory.png");
  redBase.x = 40;
  redBase.y = 300;
  redBase.s = 0.15;
  blueBase = new SpriteObject("factory.png");
  blueBase.x = 560;
  blueBase.y = 300;
  blueBase.s = 0.15;
  for(int c = 0; c < 4; c++)
  {
    endExplode[c] = new AnimatedSpriteObject("explosionSheet.png");
    endExplode[c].x = -100;
    endExplode[c].y = -100;
    endExplode[c].s = 3.5;
    endExplode[c].frameWidth = 115;
    endExplode[c].frameHeight = 95;
  }
  
  for(int c = 0; c < 9; c++)
  {
    pellets[c] = new SpriteObject("pellet.png");
  }
  pellets[0].x = 154;
  pellets[0].y = 60;
  pellets[1].x = 154;
  pellets[1].y = 560;
  pellets[2].x = 165;
  pellets[2].y = 202;
  pellets[3].x = 150;
  pellets[3].y = 440;
  pellets[4].x = 300;
  pellets[4].y = 310;
  pellets[5].x = 450;
  pellets[5].y = 225;
  pellets[6].x = 450;
  pellets[6].y = 404;
  pellets[7].x = 560;
  pellets[7].y = 165;
  pellets[8].x = 560;
  pellets[8].y = 450;
  
  grass = loadImage("grass.jpg");
  bVal = 0;
  EBVal = 0;
  bExpCount = 0;
  cExpCount = 0;
  d = 0;
  timer = 0.0;
  gameTimer = 0.0;
  enemyCounter = 0;
  score = 0;
  stencilLarge = createFont("Stencil", 64);
  stencil = createFont("Stencil", 18);
  pregame = true;
  win = false;
  lose = false;
  endBegun = false;
  setupDone = false;
}

void draw()
{
  println(mouseX + "," + mouseY);
  if(pregame)
  {
    fill(0);
    rect(0, 0, 601, 601);
    fill(77, 103, 28);
    textFont(stencilLarge);
    text("Instructions", 80, 80);
    textFont(stencil);
    text("You are blue team, go destroy red team's base! They",
      40, 170);
    text("will be coming to take you out so be careful. We have",
      40, 200);
    text("a magic tank factory, so you can continually respawn",
      40, 230);
    text("at a small cost. However, the enemy will not stop",
      40, 260);
    text("until they destroy our base or run out of tanks.", 
      40, 290);
    text("Use WASD to move, and click the mouse to shoot.", 
      40, 320);
    text("There are resource points scattered around the",
      40, 350);
    text("battlefield, try and collect them before the enemy", 
      40, 380);
    text("does. Good luck Soldier!", 40, 410);
    textFont(stencil);
    pushMatrix();
    scale(1.75);
    text("Press SPACE to start the game", 25, 275);
    popMatrix();
  }
  
  else if(win)
  {   
    fill(0);
    rect(0, 0, 601, 601);
    fill(35, 33, 234); 
    textFont(stencilLarge);
    text("YOU WIN", 175, 150);
    fill(77, 103, 28);
    textFont(stencil);
    
    if(!setupDone)
    {
      cExplosions[1].setAnimation(0, 14, true);
      setupDone = true;
    }
    
    else
    {
      pellets[1].x = 50;
      pellets[1].y = 200;
      pellets[1].render();
      text("x" + pelletCount + "  =  " + (pelletCount*20), 150, 200);
      
      playerTurret.x = 50;
      playerChassis.x = 50;
      playerTurret.y = 250;
      playerChassis.y = 250;
      playerTurret.rotation = 0;
      playerChassis.rotation = 0;
      playerChassis.render();
      playerTurret.render();
      text("x" + deaths + "  =  " + (deaths*-50), 150, 250);
      
      cExplosions[1].frameWidth = 115;
      cExplosions[1].frameHeight = 95;
      cExplosions[1].x = 50;
      cExplosions[1].y = 250;
      
      cExplosions[1].update();
      cExplosions[1].render();
      
      enemyTurrets[1].x = 50;
      enemyChassis[1].x = 50;
      enemyTurrets[1].y = 300;
      enemyChassis[1].y = 300;
      enemyChassis[1].render();
      enemyTurrets[1].render();
      enemyTurrets[1].rotation = 0;
      enemyChassis[1].rotation = 0;
      text("x" + killCount + "  =  " + (killCount*50), 150, 300);
      
      redBase.x = 50;
      redBase.y = 350;
      redBase.render();
      text("x1  =  500", 150, 350);
    }
    
    
    text("Total score: " + score, 250, 400);
    
    text("Press 'R' to restart", 220, 525);
    
    endExplode[d].x = 150 + ((d*300)%600);
    endExplode[d].y = 150 + ((int)(d/2) * 300);
    
    if(!endBegun)
    {
      endExplode[d].setAnimation(0, 16, false);
      endBegun = true;
    }
    
    endExplode[d].update();
    endExplode[d].update();
    endExplode[d].render();
    
    if(endExplode[d].done && d < 3)
    {
      d++;
      endBegun = false;
    }
  }
  
  else if(lose)
  {
    fill(0);
    rect(0, 0, 601, 601);
    fill(180, 5, 5);
    textFont(stencilLarge);
    text("YOU LOSE", 175, 150);
    fill(77, 103, 28);
    textFont(stencil);
    text("Press 'R' to restart", 220, 500);
    
    if(!setupDone)
    {
      cExplosions[1].setAnimation(0, 16, true);
      cExplosions[2].setAnimation(0, 16, true);
      setupDone = true;
    }
    
    else
    {
      pellets[1].x = 50;
      pellets[1].y = 200;
      pellets[1].render();
      text("x" + pelletCount + "  =  " + (pelletCount*20), 150, 200);
      
      playerTurret.x = 50;
      playerChassis.x = 50;
      playerTurret.y = 250;
      playerChassis.y = 250;
      playerTurret.rotation = 0;
      playerChassis.rotation = 0;
      playerChassis.render();
      playerTurret.render();
      text("x" + deaths + "  =  " + (deaths*-50), 150, 250);
      
      cExplosions[1].frameWidth = 115;
      cExplosions[1].frameHeight = 95;
      cExplosions[1].x = 50;
      cExplosions[1].y = 250;
      
      cExplosions[1].update();
      cExplosions[1].render();
      
      enemyTurrets[1].x = 50;
      enemyChassis[1].x = 50;
      enemyTurrets[1].y = 300;
      enemyChassis[1].y = 300;
      enemyTurrets[1].rotation = 0;
      enemyChassis[1].rotation = 0;
      enemyChassis[1].render();
      enemyTurrets[1].render();
      text("x" + killCount + "  =  " + (killCount*50), 150, 300);
      
      blueBase.x = 50;
      blueBase.y = 350;
      blueBase.render();
      text("x1  =  -500", 150, 350);
      cExplosions[2].frameWidth = 115;
      cExplosions[2].frameHeight = 95;
      cExplosions[2].x = 50;
      cExplosions[2].y = 350;
      
      cExplosions[2].s = 1.0;
      cExplosions[2].update();
      cExplosions[2].render();
      
      text("Total score: " + score, 250, 400);
    }
    
    endExplode[d].x = 150 + ((d*300)%600);
    endExplode[d].y = 150 + ((int)(d/2) * 300);
    if(!endBegun)
    {
      endExplode[d].setAnimation(0, 14, false);
      endBegun = true;
    }
    endExplode[d].update();
    endExplode[d].update();
    endExplode[d].render();
    
    if(endExplode[d].done && d < 3)
    {
      d++;
      endBegun = false;
    }
  }
    
  else
  {
    image(grass, width/2, height/2, 600, 600);
    blueBase.render();
    redBase.render();
    checkMovement();
    playerChassis.render();
    playerTurret.x = playerChassis.x;
    playerTurret.y = playerChassis.y;
    playerTurret.lookAt(mouseX, mouseY);
    playerTurret.render();
    
    for(int c = 0; c < enemyCounter; c++)
    {
      enemyChassis[c].render();
      enemyTurrets[c].render();
    }
    
    if(timer >= 1.5 && enemyCounter < 15)
    {
      enemyCounter++;
      timer = 0.0;
    }
    
    checkBulletCollisions();
    updateEnemyBehavior();
    
    for(int c = 0; c < 68; c++)
    {
      blockers[c].render();
    }
    
    for(int c = 0; c < 15; c++)
    {
      bExplosions[c].update();
      bExplosions[c].render();
    }
    
    for(int c = 0; c < 5; c++)
    {
      cExplosions[c].update();
      cExplosions[c].render();
    }
    
    for(int c = 0; c < 9; c++)
    {
      pellets[c].render();
    }
    
    updatePellets();
    
    timer += 1.0/frameRate;
    gameTimer += 1.0/frameRate;
    
  }
  
}


class AnimatedSpriteObject extends SpriteObject
{
  int frameRow;
  int frameColumn;
  int frameWidth;
  int frameHeight;
  int startFrame;
  int endFrame;
  float currentFrame;
  boolean loop = true;
  boolean done = false;
  float frameSpeed = 12.0;
  PImage spriteSheet;
   
  AnimatedSpriteObject(String filename)
  {
    super(filename);
    this.spriteSheet = this.img;
  }
   
  void setAnimation(int start, int end, boolean looping)
  {
    this.startFrame = start;
    this.endFrame = end;
    this.currentFrame = this.startFrame;
    this.loop = looping;
  }
   
  void update()
  {
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
        done = true;
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
  }
   
}

class Bullet extends SpriteObject
{
  float speed;
  
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

void keyPressed()
{
  if(pregame && key == ' ')
  {
    pregame = false;
  }
  
  if((lose || win) && key == 'r')
  {
    setup();
  } 
  
  if(key == 'w')
  {
    up = true;
  }
  
  if(key == 's')
  {
    down = true;
  }
  
  if(key == 'a')
  {
    left = true;
  }
  
  if(key == 'd')
  {
    right = true;
  }
}

void keyReleased()
{
  if(key == 'w')
  {
    up = false;
  }
  
  if(key == 's')
  {
    down = false;
  }
  
  if(key == 'a')
  {
    left = false;
  }
  
  if(key == 'd')
  {
    right = false;
  }
}

void mouseReleased()
{
  if(mouseButton == LEFT && !pregame)
  {
    bullets[bVal].x = playerChassis.x;
    bullets[bVal].y = playerChassis.y;
    bullets[bVal].rotation = playerTurret.rotation;
    bullets[bVal].directionX = playerTurret.directionX;
    bullets[bVal].directionY = playerTurret.directionY;
    bVal++;
    bVal %= 15;
  }
}

void checkMovement()
{
  if(up && right)
  {
    playerChassis.rotation = 315;
    playerChassis.x++;
    playerChassis.y--;
  }
  
  else if(up && left)
  {
    playerChassis.rotation = 225;
    playerChassis.x--;
    playerChassis.y--;
  }
  
  else if(down && right)
  {
    playerChassis.rotation = 45;
    playerChassis.x++;
    playerChassis.y++;
  }
  
  else if(down && left)
  {
    playerChassis.rotation = 135;
    playerChassis.x--;
    playerChassis.y++;
  }
  
  else if(up)
  {
    playerChassis.rotation = 270;
    playerChassis.y--;
  }
  
  else if(down)
  {
    playerChassis.rotation = 90;
    playerChassis.y++;
  }
  
  else if(left)
  {
    playerChassis.rotation = 180;
    playerChassis.x--;
  }
  
  else if(right)
  {
    playerChassis.rotation = 0;
    playerChassis.x++;
  }
  
  for(int c = 0; c < 68; c++)
  {
    if(playerChassis.isOverlapping(blockers[c]))
    {
      if(up && right)
      {
        playerChassis.x --;
        playerChassis.y ++;
      }
      
      else if(up && left)
      {
        playerChassis.x ++;
        playerChassis.y ++;
      }
      
      else if(down && right)
      {
        playerChassis.x --;
        playerChassis.y --;
      }
      
      else if(down && left)
      {
        playerChassis.x ++;
        playerChassis.y --;
      }
      
      else if(up)
      {
        playerChassis.y ++;
      }
      
      else if(down)
      {
        playerChassis.y --;
      }
      
      else if(left)
      {
        playerChassis.x ++;
      }
      
      else if(right)
      {
        playerChassis.x --;
      }
    }
  }
}

void checkBulletCollisions()
{
  for(int c = 0; c < 15; c++)
  {
    bullets[c].update();
    bullets[c].render();
    for(int d = 0; d < 15; d++)
    {
      if(bullets[c].isOverlapping(enemyChassis[d]) && d < enemyCounter)
      {
        score += 50;
        killCount++;
        cExplosions[cExpCount].x = enemyChassis[d].x;
        cExplosions[cExpCount].y = enemyChassis[d].y;
        cExplosions[cExpCount].setAnimation(0, 14, false);
        cExpCount++;
        cExpCount %= 5;
        bullets[c].x = -100;
        bullets[c].y = -100;
        bullets[c].directionX = 0.0;
        bullets[c].directionY = 0.0;
        enemyChassis[d].x = -100;
        enemyChassis[d].y = 700;
      }
    }
    
    if(bullets[c].x < -50 || bullets[c].x > width+100 
      || bullets[c].y < -50 || bullets[c].y > height+100)
    {
      bullets[c].x = -100;
      bullets[c].y = -100;
      bullets[c].directionX = 0.0;
      bullets[c].directionY = 0.0;
    }
    
    for(int d = 0; d < 68; d++)
    {
      if(bullets[c].isOverlapping(blockers[d]))
      {
        bExplosions[bExpCount].x = bullets[c].x;
        bExplosions[bExpCount].y = bullets[c].y;
        bExplosions[bExpCount].setAnimation(0, 14, false);
        bExpCount++;
        bExpCount %= 5;
        bullets[c].x = -100;
        bullets[c].y = -100;
        bullets[c].directionX = 0.0;
        bullets[c].directionY = 0.0;
        
      }
    }
    
    if(bullets[c].isOverlapping(redBase))
    {
      score += 500;
      win = true;
    }
  }
  
  for(int c = 0; c < 15; c++)
  {
    enemyBullets[c].update();
    enemyBullets[c].render();
    for(int d = 0; d < 15; d++)
    {
      if(enemyBullets[c].isOverlapping(playerChassis))
      {
        score -= 50;
        deaths++;
        fill(250, 0, 0);
        rect(0, 0, 601, 601);
        playerChassis.x = 560;
        playerChassis.y = 300;
        enemyBullets[c].x = -100;
        enemyBullets[c].y = -100;
        enemyBullets[c].directionX = 0.0;
        enemyBullets[c].directionY = 0.0;
      }
    }
    
    if(enemyBullets[c].x < -50 || enemyBullets[c].x > width+100 
      || enemyBullets[c].y < -50 || enemyBullets[c].y > height+100)
    {
      enemyBullets[c].x = -100;
      enemyBullets[c].y = -100;
      enemyBullets[c].directionX = 0.0;
      enemyBullets[c].directionY = 0.0;
    }
    
    for(int d = 0; d < 68; d++)
    {
      if(enemyBullets[c].isOverlapping(blockers[d]))
      {
        bExplosions[bExpCount].x = enemyBullets[c].x;
        bExplosions[bExpCount].y = enemyBullets[c].y;
        bExplosions[bExpCount].setAnimation(0, 14, false);
        bExpCount++;
        bExpCount %= 5;
        enemyBullets[c].x = -100;
        enemyBullets[c].y = -100;
        enemyBullets[c].directionX = 0.0;
        enemyBullets[c].directionY = 0.0;
        
      }
    }
    
    if(enemyBullets[c].isOverlapping(blueBase))
    {
      score -= 500;
      lose = true;
    }
  }
}

void updateEnemyBehavior()
{
  for(int c = 0; c < enemyCounter; c++)
  {
    if(enemyChassis[c].x > 500)
    {
      enemyTurrets[c].lookAt(560, 300);
    }
    
    else
    {
      enemyTurrets[c].lookAt(playerTurret.x, playerTurret.y);
    }
    enemyTurrets[c].x = enemyChassis[c].x;
    enemyTurrets[c].y = enemyChassis[c].y;
    
    if(enemyMovement[c] == 1 && enemyChassis[c].x > 0)
    {
      if(enemyChassis[c].y > 180 && enemyChassis[c].x < 100)
      {
        enemyChassis[c].rotation = 270;
        enemyChassis[c].y --;
      }
      
      else if(enemyChassis[c].x < 160)
      {
        enemyChassis[c].rotation = 315;
        enemyChassis[c].x++;
        enemyChassis[c].y--;
      }
      
      else if(enemyChassis[c].x < 425)
      {
        enemyChassis[c].rotation = 0;
        enemyChassis[c].x++;
      }
      
      else if(enemyChassis[c].x < 560)
      {
        enemyChassis[c].rotation = 45;
        enemyChassis[c].x++;
        enemyChassis[c].y++;
      }
    }
    
    else if (enemyMovement[c] == 2 && enemyChassis[c].x > 0)
    {
      if(enemyChassis[c].y > 180 && enemyChassis[c].x < 100)
      {
        enemyChassis[c].rotation = 270;
        enemyChassis[c].y --;
      }
      
      else if(enemyChassis[c].x < 140)
      {
        enemyChassis[c].rotation = 0;
        enemyChassis[c].x++;
      }
      
      else if(enemyChassis[c].x < 275)
      {
        enemyChassis[c].rotation = 45;
        enemyChassis[c].x++;
        enemyChassis[c].y++;
      }
      
      else if(enemyChassis[c].x < 360)
      {
        enemyChassis[c].rotation = 0;
        enemyChassis[c].x++;
      }
      
      else if(enemyChassis[c].x < 560)
      {
        enemyChassis[c].rotation = 315;
        enemyChassis[c].x++;
        enemyChassis[c].y--;
      }
    }
    
    else if (enemyMovement[c] == 3 && enemyChassis[c].x > 0)
    {
      if(enemyChassis[c].y < 450 && enemyChassis[c].x < 50)
      {
        enemyChassis[c].rotation = 90;
        enemyChassis[c].y ++;
      }
      
      else if(enemyChassis[c].x < 140)
      {
        enemyChassis[c].rotation = 0;
        enemyChassis[c].x++;
      }
      
      else if(enemyChassis[c].x < 275)
      {
        enemyChassis[c].rotation = 315;
        enemyChassis[c].x++;
        enemyChassis[c].y--;
      }
      
      else if(enemyChassis[c].x < 360)
      {
        enemyChassis[c].rotation = 0;
        enemyChassis[c].x++;
      }
      
      else if(enemyChassis[c].x < 560)
      {
        enemyChassis[c].rotation = 45;
        enemyChassis[c].x++;
        enemyChassis[c].y++;
      }
    }
    
    else if (enemyMovement[c] == 4 && enemyChassis[c].x > 0)
    {
      if(enemyChassis[c].y < 450 && enemyChassis[c].x < 50)
      {
        enemyChassis[c].rotation = 90;
        enemyChassis[c].y ++;
      }
      
      else if(enemyChassis[c].x < 160)
      {
        enemyChassis[c].rotation = 45;
        enemyChassis[c].x++;
        enemyChassis[c].y++;
      }
      
      else if(enemyChassis[c].x < 425)
      {
        enemyChassis[c].rotation = 0;
        enemyChassis[c].x++;
      }
      
      else if(enemyChassis[c].x < 560)
      {
        enemyChassis[c].rotation = 315;
        enemyChassis[c].x++;
        enemyChassis[c].y--;
      }
    }
    
    shotTimers[c] += 1.0/60.0;
    
    if(shotTimers[c] >= 1.2)
    {
      enemyBullets[EBVal].x = enemyChassis[c].x;
      enemyBullets[EBVal].y = enemyChassis[c].y;
      enemyBullets[EBVal].rotation = enemyTurrets[c].rotation;
      enemyBullets[EBVal].directionX = enemyTurrets[c].directionX;
      enemyBullets[EBVal].directionY = enemyTurrets[c].directionY;
      EBVal++;
      EBVal %= 15;
      shotTimers[c] = 0.0;
    }
  }
}

void updatePellets()
{
  for(int c = 0; c < enemyCounter; c++)
  {
    for(int d = 0; d < 9; d++)
    {
      if(enemyChassis[c].isOverlapping(pellets[d]))
      {
        pellets[d].x = -100;
        pellets[d].y = -100;
      }
    }
  }
  
  for(int c = 0; c < 9; c++)
  {
    if(playerChassis.isOverlapping(pellets[c]))
    {
      pelletCount++;
      pellets[c].x = -100;
      pellets[c].y = -100;
      score += 20;
    }
  }
  
}
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  float directionX = 0.0;
  float directionY = 0.0;
  PImage img;
  boolean loaded = false;
    
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
   
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
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
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
      
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);  
      
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
   
  boolean isOverlappingRect(float otherLeft, float otherTop, float rwidth, float rheight)
  {
   float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
     
    float otherRight = otherLeft + rwidth;
    float otherBottom = otherTop + rheight;
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
  
  void lookAt(float otherX, float otherY)
  {
    this.rotation = degrees(atan2(otherY-this.y, otherX-this.x));
    this.directionX = cos(radians(this.rotation));
    this.directionY = sin(radians(this.rotation));
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
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}



