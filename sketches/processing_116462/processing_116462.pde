
/*
import ddf.minim.*;
Minim minim;
AudioSample pew1, pew2, boom, blip;
*/

ArrayList enemies = new ArrayList();
ArrayList enemyLasers = new ArrayList();
ArrayList lasers = new ArrayList();
ArrayList powerUpDropChance = new ArrayList();
ArrayList actualPowerUps = new ArrayList();
boolean moveLeft, moveRight, moveUp, moveDown, space;
PImage playerModel, spLaser;
int xPlayer = 400;
int yPlayer = 500;

Wave wave1 = new Wave(millis());
Player thePlayer = new Player(xPlayer, yPlayer);


void setup() {
  size(800, 800);
  frameRate(60);
  smooth();
  ellipseMode(CENTER);
  imageMode(CENTER);
  noStroke();

  playerModel = loadImage("ship3big.png");
  spLaser = loadImage("flatShotR.png");

/*
  minim = new Minim(this);
  blip = minim.loadSample("blip.wav");
  boom = minim.loadSample("boom.wav");
  pew1 = minim.loadSample("pew1.wav");
  pew2 = minim.loadSample("pew2.wav");  
*/

  moveLeft = false;
  moveRight = false;
  moveUp = false;
  moveDown = false;
}

void draw() {
  background(0);

  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = (Enemy) enemies.get(i); 
    enemy.update();
    enemy.move();
    enemy.isOnScreen();
  }

  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = (Laser) lasers.get(i);   
    laser.update();
    laser.display();
  }

  for (int i = 0; i < actualPowerUps.size(); i++) {
    PowerUp powerUp = (PowerUp) actualPowerUps.get(i); 
    powerUp.display();
    powerUp.move();
  }

  for (int i = 0; i < powerUpDropChance.size(); i++) {
    PowerUp powerUp = (PowerUp) powerUpDropChance.get(i); 
    powerUp.update();
  }

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

  thePlayer.update();
  wave1.update();
}


boolean isCollidingEnemyLaser(Enemy enemy, Laser laser) {
  float xDistance = abs(enemy.x - laser.x);
  float yDistance = abs(enemy.y - laser.y);

  switch (laser.type) {
  case 1:
    if (xDistance < 2 + 15 && yDistance < 10 + 15) return true;
    break;
  case 2:
    if (xDistance < 24 + 15 && yDistance < 10 + 15) return true;
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

/*
void stop() {        
  minim.stop();
  super.stop();
}
*/
class Enemy {
  float x, y, w, h, top, bottom, left, right;
  int sinVar = 0;

  Enemy(float _x, float _y) {
    x = _x;
    y = _y;
    w = 30;
    h = 30;
    top = y - h/2;
    bottom = y + h/2;
    left = x - w/2;
    right = x + w/2;
  }

  void update() {
    fill(0, 150, 255);
    rectMode(CENTER);
    rect(x, y, w, h);
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
    
    switch (wave1.wavePattern) {
    case 1:
      float deltaY = 3*sin(.01*sinVar);  //5*sin(0.4*(sinVar*PI/16));
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
    diameter = 10;
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

  Laser(int _x, int _y, int _t) {
    x = _x;
    y = _y;
    type = _t;
  }



  void update() {
    
    for (int i = 0; i < 8; i++) {
      y--;
      switch (type) {
      case 1:
        left = x - 2;
        right = x + 2;
        top = y - 10;
        bottom = y + 10;
        break;
      case 2:
        left = x - 24;
        right = x + 24;
        top = y - 10;
        bottom = y + 10;
        break;
      }

      for (int k = 0; k < enemies.size(); k++) {
        Enemy enemy = (Enemy) enemies.get(k); 
        for (int j = 0; j < lasers.size(); j++) {
          Laser laser = (Laser) lasers.get(j);  

          boolean collisionDetected = isCollidingEnemyLaser(enemy, laser);

          if (collisionDetected) {
            powerUpDropChance.add(new PowerUp(enemy.x, enemy.y, int(random(1, 10))));
            lasers.remove(j);
            enemies.remove(k);
            //boom.trigger();
          }
        }
      }

      isOnScreen();
    }
  }



  void display() {
    
    if (type == 2) {
      
      
    }
    
    switch (type) {
    case 1:
      noStroke();
      fill(255, 0, 0);
      rectMode(CENTER);
      rect(x, y, 4, 20);
      break;
    case 2:
      pushMatrix();
      translate(x, y);
      scale(3.0, 2.5);
      image(spLaser, 0, 0);
      popMatrix();
      break;
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
  int upgradeDuration = 5000;
  int shieldDiameter = 84;
  int shieldMeterMax = 200;
  int shieldMeter = shieldMeterMax;
  int shootDelay = 500;
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

    if (shieldAlpha >= 0) {
      shieldAlpha -= .03;
    }

    display();
    move();
    checkScouterPowerLevel();
  }


  void checkScouterPowerLevel() {


    for (int i = 0; i < actualPowerUps.size(); i++) {
      PowerUp powerUp = (PowerUp) actualPowerUps.get(i);

      boolean over9000 = powerUpGet(thePlayer, powerUp);

      if (over9000) {
        println("OVER 90000000000");
        actualPowerUps.remove(i);
        thePlayer.shieldAlpha = .75;

        laserType = 2;

        upgradeTimerStart = millis();
        
      }
    }
    
    
    if (laserType == 2) {
      currentTime = millis() - upgradeTimerStart;
      if (currentTime > upgradeDuration) laserType = 1;
    }
    
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

    rectMode(CORNER);
    stroke(0, 100, 255);
    rect(25, 50, shieldMeterMax, 12);
    fill(0, 150, 255);
    rect(25, 50, shieldMeter, 12);

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
      }
      canShoot = false;
      shotTime = millis();
      //pew2.trigger();
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
  int diameter = 10;
  int radius = diameter/2;

  PowerUp(float _x, float _y, int _rng) {
    x = _x;
    y = _y;
    rng = _rng;
    println("RNG: " + rng);
  }

  void update() {
    for (int i = 0; i < powerUpDropChance.size(); i++) {
      PowerUp powerUpDrop = (PowerUp) powerUpDropChance.get(i); 
      if (rng == 1) {
        actualPowerUps.add(new PowerUp(x, y, rng));
      }
      powerUpDropChance.remove(i);
    }
  }

  void display() {

    for (int i = 0; i < actualPowerUps.size(); i++) {
      PowerUp powerUp = (PowerUp) actualPowerUps.get(i);
      if (rng == 1) {
        fill(150, 0, 220);
        stroke (150, 0, 220);
      }
      ellipse(x, y, diameter, diameter);
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
      wave2Counter = 8;
      spawnDelay = 600;
    }
    if (wave2Counter == 0 && enemies.size() == 0) { 
      wave2Counter = -1;
      wave3Counter = 8;
    }    
    if (wave3Counter == 0 && enemies.size() == 0) { 
      wave3Counter = -1;
      wave4Counter = 16;
      spawnDelay = 1000;
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

    lastSpawn = millis();
  }


  void shoot() {
    //if ((wave1Counter > 0 || wave2Counter > 0) && enemies.size() > 0) pew1.trigger();
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = (Enemy) enemies.get(i);

      enemyLasers.add(new EnemyLaser(enemy.x, enemy.y + 15, 1));
      enemyLasers.add(new EnemyLaser(enemy.x, enemy.y + 15, 2));
      enemyLasers.add(new EnemyLaser(enemy.x, enemy.y + 15, 3));
    }
    lastShot = millis();
  }
}



