
/*
import ddf.minim.*;
Minim minim;
AudioSample pew1, pew2, boom, blip;
*/

ArrayList backgroundSquares = new ArrayList();
ArrayList enemies = new ArrayList();
ArrayList enemyLasers = new ArrayList();
ArrayList bossLasers = new ArrayList();
ArrayList lasers = new ArrayList();
ArrayList powerUpDropChance = new ArrayList();
ArrayList actualPowerUps = new ArrayList();
boolean moveLeft = false;
boolean moveRight = false;
boolean moveUp = false;
boolean moveDown = false;
boolean space = false;
PImage playerModel, spLaser, enemyModel, enemyModel2;
PFont font1;
int xPlayer = 400;
int yPlayer = 500;
int popTextAlpha = 0;
int scoreCounter = 0;
boolean hasStarted = false;
boolean waveStart = false;
boolean startMenu = false;
boolean splashScreen = true;
boolean gameOver = false;
boolean isBossActive = false;

Wave waveControl;
Player thePlayer = new Player(xPlayer, yPlayer);
Boss theBoss; 

void setup() {
  size(800, 700);
  frameRate(60);
  smooth();
  ellipseMode(CENTER);
  imageMode(CENTER);
  noStroke();

  font1 = loadFont("testfont.vlw");

  loadImages();
//  loadSounds();
  loadBackground();
}

void draw() {
  updateBackground();
  if (splashScreen) {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textAlign(CENTER);    
    text("TEST.", width/2, height/3);
  }
  if (startMenu) {
    fill(0);
    rect(0, 0, width, height);
    fill(255);
    textAlign(CENTER);
    text("THIS IS FUN GAME. ENJOY FUN GAME.", width/2, height/3);
    text("< CLICK TO START >", width/2, height*2/3);
  }
  if (waveStart) {
    waveControl = new Wave(millis());
    thePlayer.reset();
    waveStart = false;
  }
  if (hasStarted) {
    updateEnemy();
    updateLaser();
    updatePowerups();
    updateEnemyLasers();
    updateBoss();
    thePlayer.update();
    waveControl.update();

    updateHUD();
  }
  println("-------------");
  println("Framerate: " + frameRate);
  println("Lasers: " + lasers.size());
  println("Enemy Lasers: " + enemyLasers.size());
  println("Boss Lasers: " + bossLasers.size());  
  println("Background: " + backgroundSquares.size());  

  doesThisPlayerSuck();
}


void updateBossLasers() {
  for (int i = 0; i < bossLasers.size(); i++) {
    BossLaser bossLaser = (BossLaser) bossLasers.get(i);
    bossLaser.update();
    if (!bossLaser.isOnScreen()) bossLasers.remove(i);
  }
}

void updateBoss() {
  if (isBossActive) {
    theBoss.update();
    updateBossLasers();
  }
}

void doesThisPlayerSuck() {
  if (thePlayer.shieldMeter <= 0) gameOver = true;
  if (gameOver) {
    resetGame();
    hasStarted = false;
    rectMode(CORNER);
    fill(0);
    rect(0, 0, width, height);
    textAlign(CENTER);
    textSize(120);
    fill(255);
    text("YOU SUCK!", width/2, height/4);
    textSize(24);
    text("< Click to Retry >", width/2, height*3/4);
    textSize(24);
    text("Score: " + scoreCounter, width/2, height/2);
  }
}

void resetGame() {
  for (int i = 0; i < enemies.size(); i++) enemies.remove(i);
  for (int i = 0; i < enemyLasers.size(); i++) enemyLasers.remove(i);
  for (int i = 0; i < lasers.size(); i++) lasers.remove(i);
  thePlayer.laserType = 0;
}

void updateBackground() {
  for (int i = 0; i < backgroundSquares.size(); i++) {
    BackgroundSquare bs = (BackgroundSquare) backgroundSquares.get(i);
    bs.update();
    if (isBossActive) bs.setStroke(color(0, 120, 225));
    if (!(bs.isOnScreen())) backgroundSquares.remove(i);
  }
  if (frameCount % 45 == 0) {
    for (int i = 0; i < 18; i++) {
      backgroundSquares.add(new BackgroundSquare(width - 50 - i*50, -100));
    }
  }
}

void updateHUD() {
  rectMode(CORNER);
  textAlign(CORNER);
  noStroke();
  fill(0, 150, 255);
  rect(25, 40, thePlayer.shieldMeter*1.2, 12, 3, 3, 3, 3);
  stroke(0, 100, 255);
  noFill();
  rect(25, 40, thePlayer.shieldMeterMax*1.2, 12, 3, 3, 3, 3);
  textSize(18);
  text("Shield Integrity:", 25, 30);
  if (thePlayer.laserType == 1) { 
    text("Laser Type: STOCK LASER", 350, 30);
    text("Ammo: UNLIMITED", 350, 55);
  }
  if (thePlayer.laserType == 2) {
    text("Laser Type: DECIMATOR LASER", 350, 30);
    text("Ammo: " + thePlayer.upgradeCounter, 350, 55);
  }
  if (thePlayer.laserType == 3) {
    text("Laser Type: HYPER BEAM", 350, 30);
    text("Ammo: " + float(int(thePlayer.upgradeDuration - thePlayer.currentTime)/100)/10 + " second(s)", 350, 55);
  }
  text("Score: " + scoreCounter, 650, 30);
  textSize(24);
  fill(0, 150, 255, popTextAlpha);
  text("+20", 260, 75);  
  if (popTextAlpha > 0) popTextAlpha -= 2;
}

void updateEnemyLasers() {
  for (int i = 0; i < enemyLasers.size(); i++) {
    EnemyLaser enemyLaser = (EnemyLaser) enemyLasers.get(i);
    enemyLaser.update();
    enemyLaser.display();
    enemyLaser.isOnScreen();
    //if (enemyLaser.top > height) enemyLasers.remove(i);    // this isnt working right, it will delete lasers still on screen too
    // also i get an "index out of bounds" error too

    boolean collisionDetected = isCollidingPlayerEnemyLaser(thePlayer, enemyLaser);
    if (collisionDetected) {
      enemyLasers.remove(i);
      //blip.trigger();
      thePlayer.shieldAlpha = .75;
      if (thePlayer.shieldMeter > 0) thePlayer.shieldMeter -= 10;
    }
  }
}

void updatePowerups() {
  for (int i = 0; i < actualPowerUps.size(); i++) {
    PowerUp powerUp = (PowerUp) actualPowerUps.get(i); 
    powerUp.display();
    powerUp.move();
  }
  for (int i = 0; i < powerUpDropChance.size(); i++) {
    PowerUp powerUp = (PowerUp) powerUpDropChance.get(i); 
    powerUp.update();
  }
}

void updateLaser() {
  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = (Laser) lasers.get(i);   
    laser.update();
    laser.display();
  }
}

void updateEnemy() {
  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = (Enemy) enemies.get(i); 
    enemy.update();
    enemy.move();
    enemy.isOnScreen();
  }
}

void loadImages() {
  playerModel = loadImage("ship3big.png");
  enemyModel = loadImage("enemyShip.png");
  enemyModel2 = loadImage("enemy2.png");
  spLaser = loadImage("flatShotR.png");
}

/*
void loadSounds() {
  minim = new Minim(this);
  blip = minim.loadSample("blip.wav");
  boom = minim.loadSample("boom.wav");
  pew1 = minim.loadSample("pew1.wav");
  pew2 = minim.loadSample("pew2.wav");
}
*/

void loadBackground() {
  for (int i = 0; i < 21; i++) {
    for (int j = 0; j < 18; j++) {
      backgroundSquares.add(new BackgroundSquare(width - j*50, height - i*50 + 100));
    }
  }
}

boolean isCollidingEnemyLaser(Enemy enemy, Laser laser) {
  float xDistance = abs(enemy.x - laser.x);
  float yDistance = abs(enemy.y - laser.y);

  switch (laser.type) {
  case 1:
    if (xDistance < 1 + 18 && yDistance < 5 + 18) return true;
    break;
  case 2:
    if (xDistance < 48 + 18 && yDistance < 20 + 18) return true;
    break;
  case 3:
    if (xDistance < 20 + 18 && yDistance < 400 + 18) return true;
    break;
  }    
  return false;
}

boolean isCollidingPlayerEnemyLaser(Player thePlayer, EnemyLaser enemyLaser) {
  float distance = sqrt(pow(abs(thePlayer.x - enemyLaser.x), 2) + pow(abs(thePlayer.y - enemyLaser.y), 2));
  if (distance < thePlayer.shieldDiameter/2 + enemyLaser.diameter/2) return true;
  return false;
}

boolean powerUpGet(Player thePlayer, PowerUp powerUp) {
  float distance = sqrt(pow(abs(thePlayer.x - powerUp.x), 2) + pow(abs(thePlayer.y - powerUp.y), 2));
  if (distance < thePlayer.shieldDiameter/2 + powerUp.radius) return true;
  return false;
}


void keyPressed() {
  if (keyCode == LEFT || keyCode == 'A') {
    moveLeft = true;
  }
  if (keyCode == RIGHT || keyCode == 'D') {
    moveRight = true;
  } 
  if (keyCode == UP || keyCode == 'W') {
    moveUp = true;
  }
  if (keyCode == DOWN || keyCode == 'S') {
    moveDown = true;
  }
  if (key == ' ') {
    space = true;
  }
}


void keyReleased() {
  if (keyCode == LEFT || keyCode == 'A') {
    moveLeft = false;
  }
  if (keyCode == RIGHT || keyCode == 'D') {
    moveRight = false;
  }  
  if (keyCode == UP || keyCode == 'W') {
    moveUp = false;
  }
  if (keyCode == DOWN || keyCode == 'S') {
    moveDown = false;
  }
  if (key == ' ') {
    space = false;
  }
}

void mousePressed() {
  if (!splashScreen) {
    if ((!hasStarted && !waveStart) || gameOver) {
      startMenu = false;
      hasStarted = true;
      waveStart = true;
      gameOver = false;
      scoreCounter = 0;
    }
  }

  if (splashScreen) {
    startMenu = true;
    splashScreen = false;
  }
}

/*
void stop() {        
  minim.stop();
  super.stop();
}*/

class BackgroundSquare {
  float xpos, ypos, w, h;
  color c;
  color strokeC = color(10, 30, 60);

  BackgroundSquare(float _x, float _y) {
    xpos = _x;
    ypos = _y;
    w = random(50, 80);
    h = random(50, 80);
    c = color(20, random(30, 40), random(70, 100));
  }

  void update() {
    display();
    move();
  }

  void display() {
    fill(c);
    stroke(strokeC);
    rect(xpos, ypos, w, h);
  }

  void setStroke(color _stroke) {
    strokeC = _stroke;
  }

  void move() {
    ypos ++;
  }

  boolean isOnScreen() {
    if (ypos > height + 50) return false;
    return true;
  }
}

class Boss {
  float x, y, leftBarrelX, leftBarrelY, rightBarrelX, rightBarrelY;
  int movePattern, laserType, currentShotTimer;
  int maxHealth = 300;
  int health = 300;
  int lastShot = 0;
  int shotDelay = 1500;
  float shieldAlpha = 1;
  boolean canShoot = false;

  Boss(float _x, float _y, int _movePattern, int _laserType, int _health) {
    x = _x;
    y = _y;
    movePattern = _movePattern;
    laserType = _laserType;
    health = _health;  
    isBossActive = true;
  }

  void update() {
    leftBarrelX = x - 35;
    leftBarrelY = y + 18;
    rightBarrelX = x + 35;
    rightBarrelY = y + 18;

    display();
    displayHealth();
    move();
    shoot();
    isHitByPlayer();
  }

  boolean isHitByPlayer() {
    float distance;
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = (Laser) lasers.get(i);  
      distance = dist(laser.x, laser.y, x, y);
      if (distance <= 70 + 5) {
        if (!(movePattern == 1)) {
          shieldAlpha = .75; 
          health -= 2;
        }
        lasers.remove(i);
        return true;
      }
    } 
    return false;
  }

  void display() {
    if (shieldAlpha >= 0) { 
      shieldAlpha -= .03;
    }
    image(enemyModel, x, y);
    for (int i = 0; i < 150; i++) {
      noFill();
      stroke(0, 255, 50, i*1.5*shieldAlpha);
      ellipse(x, y, i, i);
    }
  }

  void move() {
    if (movePattern == 1) {
      y += 2;
      if (y == 200) {
        movePattern = 2;
        canShoot = true;
      }
    }
    if (movePattern == 2) {
      x -= 2;
      if (x == 100) {
        movePattern = 3;
      }
    }
    if (movePattern == 3) {
      x += 3;
      if (x == 700) {
        movePattern = 4;
      }
    }
    if (movePattern == 4) {
      x -= 2;
      if (x == 400) {
        movePattern = 5;
      }
    }
  }

  void shoot() {
    currentShotTimer = millis() - lastShot;
    if (currentShotTimer > shotDelay) canShoot = true;
    if (canShoot) {
      switch (movePattern) {
      case 2: 
      case 3:
        bossLasers.add(new BossLaser(leftBarrelX, leftBarrelY, 1, 20, 20));
        bossLasers.add(new BossLaser(rightBarrelX, rightBarrelY, 1, 20, 20));
        break;
      }
      lastShot = millis();
      canShoot = false;
    }
  }  

  void displayHealth() {
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rectMode(CENTER);
    rect(x, y - 80, health*2/3, 4, 1, 1, 1, 1);
    noFill();
    rect(x, y - 80, maxHealth*2/3, 4, 1, 1, 1, 1);
  }
}

class BossLaser {
  float x, y, xVel, yVel;
  int diameter;
  int radius;
  int type = 1;
  int dmg = 30;
  boolean freezeVel = false;

  BossLaser(float _x, float _y, int _t, int _dmg, int _diameter) {
    x = _x;
    y = _y;
    type = _t;
    dmg = _dmg;
    diameter = _diameter;
    radius = diameter/2;
  }  

  void update() {
    display();
    move();
    isOnScreen();
  }

  float getRadius() {
    return radius;
  }

  float getX() { 
    return x;
  }

  float getY() { 
    return y;
  }

  void display() {
    fill(0, 255, 0);
    stroke(0, 255, 0);
    ellipse(x, y, diameter, diameter);
  }
  void move() {
    switch (type) {
    case 1:
      y += 4;
      break;
    case 2:
      y += yVel;
      x += xVel;
      float realDist = dist(thePlayer.getX(), thePlayer.getY(), x, y);
      if (realDist <= 150) freezeVel = true;

      int negativeX = 1;
      float distanceX;
      float distX = thePlayer.getX() - x;
      if (thePlayer.getX() < x) {
        distanceX = abs(distX);
        negativeX = -1;
      } 
      else { 
        distanceX = distX;
        negativeX = 1;
      }
      int negativeY = 1;
      float distanceY;
      float distY = thePlayer.getY() - y;
      if (thePlayer.getY() < y) {
        distanceY = abs(distY);
        negativeY = -1;
      } 
      else { 
        distanceY = distY;
        negativeY = 1;
      }
      if (!freezeVel) {
        xVel = negativeX*(0.3*sqrt(distanceX));
        yVel = negativeY*(0.3*sqrt(distanceY));
      }
    }
  }
  boolean isOnScreen() {
    if (y > height + radius) return false;
    return true;
  }
}

class Enemy {
  float x, y, w, h, top, bottom, left, right, radius;
  int sinVar = 0;

  Enemy(float _x, float _y) {
    x = _x;
    y = _y;
    w = 38;
    h = 36;
    top = y - h/2;
    bottom = y + h/2;
    left = x - w/2;
    right = x + w/2;
    radius = w/2;
  }
  
  float getRadius() {
    return radius;
  }
  
  float getX() { 
    return x;
  }
  
  float getY() { 
    return y;
  }

  void update() {
    fill(0, 150, 255);
    rectMode(CENTER); 
    imageMode(CENTER);   
    pushMatrix();
    translate(x, y);
    scale(1);
    rotate(0);
    image(enemyModel2, 0, 0);
    popMatrix();
    
    top = y - h/2;
    bottom = y + h/2;
    left = x - w/2;
    right = x + w/2;
  }

  void isOnScreen() {
    
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = (Enemy) enemies.get(i);
      if (enemy.left > width || enemy.right < 0 || enemy.top > height) {
        enemies.remove(i);
      }
    }
  }

  void move() {
    
    switch (waveControl.wavePattern) {
    case 1:
      float deltaY = 3*sin(.01*sinVar);
      y += deltaY;
      x += 2;
      sinVar += 3;
      break;
    case 2:
      y += 2;
      x += .0006*sq(.23*y);
      break;
    case 3:
      y += 2;
      x -= .0006*sq(.23*y);
      break;
    case 4:
      y += 2;
      break;
    case 5:
      int yVel = 2;
      if (x > 200) yVel = -2;
      if (x > 300) yVel = 2;
      if (x > 400) yVel = -2; 
      if (x > 500) yVel = 2;     
      if (x > 600) yVel = -2; 
      if (x > 700) yVel = 2; 
      y += yVel;
      x += 2;
      break;
    case 6:
      yVel = 2;
      if (x > 100) yVel = -2;
      if (x > 200) yVel = 2;
      if (x > 300) yVel = -2; 
      if (x > 400) yVel = 2;     
      if (x > 500) yVel = -2; 
      if (x > 600) yVel = 2; 
      y += yVel;
      x -= 2;
      break;
    }
  }
}

class EnemyLaser {
  float x, y, diameter; 
  int type;
  float top, bottom, left, right;

  EnemyLaser(float _x, float _y, int _t) {
    x = _x;
    y = _y;
    type = _t;
    diameter = 6;
  }

  void update() {
    y += 3;
    switch(type) {
      case 1:
        x--;
        break;
      case 3:
        x++;
        break;      
    }
    left = x;
    right = x + 4;
    top = y;
    bottom = y + 20;
  }

  void display() {
    noStroke();
    fill(0, 255, 0);
    ellipse(x, y, diameter, diameter);
  }

  void isOnScreen() {
    for (int i = 0; i < enemyLasers.size(); i++) {
      EnemyLaser enemyLaser = (EnemyLaser) enemyLasers.get(i);
      if (enemyLaser.top > height) {
        enemyLasers.remove(i);
      }
    }
  }
}



    
    
    
    
    
    
    
    


class Laser {
  int x, y;
  int type, top, bottom, left, right;
  int beamAlpha = 255;

  Laser(int _x, int _y, int _t) {
    x = _x;
    y = _y;
    type = _t;
  }

  void update() {

    for (int i = 0; i < 10; i++) {
      y--;
      switch (type) {
      case 1:
        left = x - 1;
        right = x + 1;
        top = y - 5;
        bottom = y + 5;
        break;
      case 2:
        left = x - 48;
        right = x + 48;
        top = y - 20;
        bottom = y + 20;
        break;
      case 3:
        y++;
        beamAlpha -= 3;
        
        left = x - 20;
        right = x + 20;
        top = y - 400;
        bottom = y + 400;        
        break;
      }

      for (int k = 0; k < enemies.size(); k++) {
        Enemy enemy = (Enemy) enemies.get(k); 
        for (int j = 0; j < lasers.size(); j++) {
          Laser laser = (Laser) lasers.get(j);  

          boolean collisionDetected = isCollidingEnemyLaser(enemy, laser);

          if (collisionDetected) {
            powerUpDropChance.add(new PowerUp(enemy.x, enemy.y, int(random(1, 21))));
            enemies.remove(k);
            if (type == 1) lasers.remove(j);
//            boom.trigger();
            scoreCounter += 50;
          }
        }
      }

      isOnScreen();
    }
  }

  void display() {
    removeBeams();
    switch (type) {
    case 1:
      noStroke();
      fill(255, 0, 0);
      rectMode(CENTER);
      rect(x, y, 2, 10);
      break;
    case 2:
      pushMatrix();
      translate(x, y);
      scale(6.0, 5);
      image(spLaser, 0, 0);
      popMatrix();
      break;
    case 3:
      fill(255, 0, 0, beamAlpha);
      stroke(255, 0, 0, beamAlpha);
      rect(x, y, 40, 800);
      break;
    }
  }

  void removeBeams() {
    for (int i = 0; i < lasers.size(); i++) {
      if (beamAlpha <= 0) lasers.remove(i);
    }
  }

  void isOnScreen() {
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = (Laser) lasers.get(i);

      if (laser.bottom < 0) {
        lasers.remove(i);
      }
    }
  }
}

class Player {
  int x, y, leftGunX, leftGunY, rightGunX, rightGunY, leftSide, rightSide, 
  top, bottom, centerGunX, centerGunY;
  int currentTime, shotTime;
  int upgradeTimerStart = 0;
  int upgradeTime = 0;
  int upgradeDuration = 8000;
  int upgradeCounter = 0;
  int shieldDiameter = 80;
  int radius = shieldDiameter/2;
  int shieldMeterMax = 200;
  int shieldMeter = shieldMeterMax;
  int shootDelay = 300;
  int laserType = 1;
  float shieldAlpha  = 1;
  boolean canShoot  = true;

  Player(int _x, int _y) {
    x = _x;
    y = _y;
  }
  void update() {
    x = xPlayer;
    y = yPlayer;
    leftGunX = x - 16;
    leftGunY = y - 8;
    rightGunX = x + 16;
    rightGunY = y - 8;
    leftSide = x;
    rightSide = x + 66;
    top = y;
    bottom = y + 71;
    centerGunX = x;
    centerGunY = y - 20;

    if (isBossActive) laserType = 1;

    if (shieldAlpha >= 0) {
      shieldAlpha -= .03;
    }
    isHittingBossLaser();
    isHittingEnemyShip();
    display();
    move();
    checkScouterPowerLevel();
    upgradeCheck();
  }
  
  

  void isHittingBossLaser() {
    float dist;
    for (int i = 0; i < bossLasers.size(); i++) {
      BossLaser bl = (BossLaser) bossLasers.get(i);
      dist = dist(x, y, bl.getX(), bl.getY());
      if (dist <= radius + bl.getRadius()) {
        bossLasers.remove(i);
        shieldAlpha = .75;
        if (shieldMeter > 0) shieldMeter -= 20;
      }
    }
  }

  void isHittingEnemyShip() {
    float dist;
    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = (Enemy) enemies.get(i);
      dist = dist(x, y, e.getX(), e.getY());
      if (dist <= radius + e.getRadius()) {
        enemies.remove(i);
        shieldAlpha = .75;
        if (shieldMeter > 0) shieldMeter -= 30;
      }
    }
  }

  float getX() { 
    return x;
  }
  float getY() { 
    return y;
  }

  void reset() {
    shieldMeter = shieldMeterMax;
  }


  void checkScouterPowerLevel() {

    for (int i = 0; i < actualPowerUps.size(); i++) {
      PowerUp powerUp = (PowerUp) actualPowerUps.get(i);

      boolean over9000 = powerUpGet(thePlayer, powerUp);

      if (over9000) {
        actualPowerUps.remove(i);
        thePlayer.shieldAlpha = .75;
        if (powerUp.upgradeType == 1) { 
          laserType = 2;
          upgradeStart(10);
        }
        if (powerUp.upgradeType == 2) { 
          if (thePlayer.shieldMeter <= 180) thePlayer.shieldMeter += 20;
          if (thePlayer.shieldMeter > 180) thePlayer.shieldMeter = 200;
          popTextAlpha = 200;
        }
        if (powerUp.upgradeType == 3) { 
          laserType = 3;
          upgradeTimerStart = millis();
        }
      }
    }

    if (laserType == 3) {
      currentTime = millis() - upgradeTimerStart;
      if (currentTime > upgradeDuration) laserType = 1;
    }
  }

  void upgradeStart(int _c) {
    if (upgradeCounter <= 20) upgradeCounter += _c;
    if (upgradeCounter > 20) upgradeCounter = 30;
  }

  void upgradeCheck() {
    if (upgradeCounter == 0 && !(laserType == 3)) laserType = 1;
  }


  void display() {
    pushMatrix();
    translate(x, y);
    scale(.6);
    image(playerModel, 0, 0);
    translate(0, 6);
    for (int i = 0; i < 135; i++) {
      noFill();
      stroke(0, 150, 255, i*1.5*shieldAlpha);
      //arc(0, 0, i, i*1.25, PI, TWO_PI);
      ellipse(0, 0, i, i);
    }
    popMatrix();

    currentTime = millis() - shotTime;

    if (currentTime > shootDelay) canShoot = true;

    if (space && canShoot) {
      switch (laserType) {
      case 1:
        lasers.add(new Laser(leftGunX, leftGunY, 1));  
        lasers.add(new Laser(rightGunX, rightGunY, 1)); 
        break;
      case 2:
        lasers.add(new Laser(centerGunX, centerGunY, 2));
        break;
      case 3:
        lasers.add(new Laser(centerGunX, centerGunY - 400, 3));
        break;
      }
      canShoot = false;
      shotTime = millis();
//      pew2.trigger();
      if (upgradeCounter > 0) upgradeCounter--;
    }
  }


  void move() {

    if (!moveUp && !moveDown) {
      if (moveLeft) { 
        if (xPlayer - 33> 0) xPlayer -= 5;
      }
      if (moveRight) { 
        if (xPlayer + 33< width) xPlayer += 5;
      }
    }
    if (!moveRight && !moveLeft) {
      if (moveUp) { 
        if (yPlayer - 37> 0) yPlayer -= 5;
      }
      if (moveDown) { 
        if (yPlayer + 37< height) yPlayer += 5;
      }
    }
    if (moveUp) {
      if (moveRight) {
        if (xPlayer + 33< width) xPlayer += 3;
        if (yPlayer - 37> 0) yPlayer -= 3;
      }
      if (moveLeft) {
        if (xPlayer - 33> 0) xPlayer -= 3;
        if (yPlayer - 37> 0) yPlayer -= 3;
      }
    }
    if (moveDown) {
      if (moveRight) {
        if (xPlayer + 33< width) xPlayer += 3;
        if (yPlayer + 37< height) yPlayer += 3;
      }
      if (moveLeft) {
        if (xPlayer - 33> 0) xPlayer -= 3;
        if (yPlayer + 37< height) yPlayer += 3;
      }
    }
  }
}

class PowerUp {
  float x, y;
  int rng;
  int diameter = 12;
  int radius = diameter/2;
  int upgradeType;

  PowerUp(float _x, float _y, int _rng) {
    x = _x;
    y = _y;
    rng = _rng;
  }

  void update() {
    for (int i = 0; i < powerUpDropChance.size(); i++) {
      PowerUp powerUpDrop = (PowerUp) powerUpDropChance.get(i); 
      if (rng <= 7) {
        actualPowerUps.add(new PowerUp(x, y, rng));
      }
      powerUpDropChance.remove(i);
    }
  }

  void display() {
    for (int i = 0; i < actualPowerUps.size(); i++) {
      PowerUp powerUp = (PowerUp) actualPowerUps.get(i);
      if (rng == 1) {
        upgradeType = 1;
        fill(255, 100, 100);
        stroke(255, 0, 0);
      }
      if (rng == 2) {
        upgradeType = 2;
        fill(255, 255, 0);
        stroke(255, 255, 0);
      }
      if (rng == 3) {
        upgradeType = 3;
        fill(155, 255, 0);
        stroke(155, 255, 0);
      }
      if (rng == 4 || rng == 5 || rng == 6|| rng == 7) {
        upgradeType = 4;
        fill(50, 50, 255);
        stroke(50, 50, 255);
      }

      ellipse(x, y, diameter, diameter);

      if (rng == 4 || rng == 5 || rng == 6|| rng == 7) {
        fill(0);
        noStroke();
        rect(x, y, diameter*.8, diameter*.2);
        rect(x, y, diameter*.2, diameter*.8);
      }
    }
  }

  void move() {

    for (int i = 0; i < actualPowerUps.size(); i++) {
      PowerUp powerUp = (PowerUp) actualPowerUps.get(i);
    }
    y += 2;
  }
}

class Wave {
  int currentSpawnTime, currentShotTimer;
  int lastShot = 0;
  int shotDelay = 2500;
  int lastSpawn = 0; 
  int spawnDelay = 800;
  int xSpawn, ySpawn;
  int wave1Counter = 8;
  int wave2Counter = -1;
  int wave3Counter = -1;  
  int wave4Counter = -1;  
  int wave5Counter = -1;
  int wave6Counter = -1;
  int wavePattern;

  Wave(int _time) {
    currentSpawnTime = _time;
  }

  void update() {
    currentSpawnTime = millis() - lastSpawn;
    currentShotTimer = millis() - lastShot;
    if (currentSpawnTime > spawnDelay) spawn();
    if (currentShotTimer > shotDelay) shoot();
    if (wave1Counter == 0 && enemies.size() == 0) { 
      wave1Counter = -1;
      wave2Counter = 12;
      spawnDelay = 600;
    }
    if (wave2Counter == 0 && enemies.size() == 0) { 
      wave2Counter = -1;
      wave3Counter = 12;
    }    
    if (wave3Counter == 0 && enemies.size() == 0) { 
      wave3Counter = -1;
      wave4Counter = 12;
      spawnDelay = 500;
    }
    if (wave4Counter == 0 && enemies.size() == 0) { 
      wave4Counter = -1;
      wave5Counter = 8;
      spawnDelay = 1000;
    }
    if (wave5Counter == 0 && enemies.size() == 0) { 
      wave5Counter = -1;
      wave6Counter = 8;
      spawnDelay = 1000;
    }
    if (wave6Counter == 0 && enemies.size() == 0) { 
      wave6Counter = -1;
      theBoss = new Boss(400, -50, 1, 1, 300);
    }
  }

  void spawn() {
    if (wave1Counter > 0) {
      xSpawn = -15;
      ySpawn = 150;
      enemies.add(new Enemy(xSpawn, ySpawn));
      wavePattern = 1;
      wave1Counter--;
    }
    if (wave2Counter > 0) {
      xSpawn = 0;
      ySpawn = 0;    
      enemies.add(new Enemy(xSpawn, ySpawn));
      enemies.add(new Enemy(xSpawn + width/2, ySpawn));
      wavePattern = 2;
      wave2Counter--;
    }
    if (wave3Counter > 0) {
      xSpawn = width;
      ySpawn = 0;    
      enemies.add(new Enemy(xSpawn, ySpawn));
      enemies.add(new Enemy(xSpawn - width/2, ySpawn));
      wavePattern = 3;
      wave3Counter--;
    }
    if (wave4Counter > 0) {
      xSpawn = int(random(50, width - 50));
      ySpawn = 0;    
      enemies.add(new Enemy(xSpawn, ySpawn));
      wavePattern = 4;
      wave4Counter--;
    }
    if (wave5Counter > 0) {
      xSpawn = 0;
      ySpawn = 0;    
      enemies.add(new Enemy(xSpawn, ySpawn));
      wavePattern = 5;
      wave5Counter--;
    }
    if (wave6Counter > 0) {
      xSpawn = width;
      ySpawn = 0;    
      enemies.add(new Enemy(xSpawn, ySpawn));
      wavePattern = 6;
      wave6Counter--;
    }
    lastSpawn = millis();
  }

  void shoot() {
//    if ((wave1Counter > 0 || wave2Counter > 0) && enemies.size() > 0) pew1.trigger();
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = (Enemy) enemies.get(i);

      enemyLasers.add(new EnemyLaser(enemy.x, enemy.y + 15, 1));
      enemyLasers.add(new EnemyLaser(enemy.x, enemy.y + 15, 2));
      enemyLasers.add(new EnemyLaser(enemy.x, enemy.y + 15, 3));
    }
    lastShot = millis();
  }
}



