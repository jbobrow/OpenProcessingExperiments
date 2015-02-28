
/*
Tower Defense Game made by Bryant Ng
 Two classes and a few methods taken from Tower Defense:  http://openprocessing.org/visuals/?visualID=6459
 
 */
PImage path;
ArrayList towers = new ArrayList();
ArrayList circleMonsters = new ArrayList();
ArrayList circleBosses = new ArrayList();
int spawnTime = 0;
int buttonTimer = 0;
int money = 750;
int lives = 1;
int monsters = 4;
int boss = 1;
int copyBoss = boss;
int copyMonster = monsters;
int circleHealth = 350;
int bossHealth = 5000;
int level = 1;

int cols = 16;
int rows = 12;
int squarePlacement [][] = new int[cols][rows];
int mousefindXPos, mousefindYPos;

Button[] b = new Button[cols*rows];

boolean play = false;
boolean end = false;
boolean intro = false;
boolean sameTowerPlacement = false;
boolean allMonstersSpawned = false;

PFont file;

void setup () {
  int u = 0;

  size(640, 480);
  rectMode(CENTER);
  imageMode(CENTER);
  smooth();
  frameRate(30);

  textAlign(CENTER);

  path = loadImage("hkhk.jpg");

  for (int h = 0; h < 192; h++) {
    b[h] = new Button();
  }

  for (int v = 0; v < rows; v++) {
    for (int w = 0; w < cols; w++) {
      squarePlacement[w][v] = u;
      u++;
    }
  }
}

int xLocation (int x, int y) {
  int xpos = 0;
  int buttonChoice = squarePlacement[x][y];
  xpos = b[buttonChoice].rectX;
  return xpos;
}

int yLocation (int x, int y) {
  int ypos = 0;
  int buttonChoice = squarePlacement[x][y];
  ypos = b[buttonChoice].rectY;
  return ypos;
}
void draw () {

  mousefindXPos = int(map(mouseX, 0, 640, 0, 16));
  mousefindYPos = int(map(mouseY, 0, 480, 0, 12));

  if (!intro) {

    buttonTimer++;
    pushMatrix();
    image(path, 319, 239);
    popMatrix();

    fill(100);
    rect(540, 460, 120, 40); // start button
    rect(100, 460, 120, 40); // how many lives
    rect(220, 460, 120, 40); // what level
    rect(340, 460, 120, 40); // how much money

    fill(255);
    text("START IT!", 540, 465);
    fill(255);
    text("Lives:" + " " + nf(lives, 2), 100, 465);
    fill(255);
    text("Level:" + " " + nf(level, 2), 220, 465);
    fill(255);
    text("Money:" + " " + nf(money, 2), 340, 465);

    int buttonNumber = 0;
    for (int i = 0; i < 12; i++) {
      for (int j = 0; j < 16; j++) {
        b[buttonNumber].showButton((20+(j*40)), (20+(i*40)));
        buttonNumber++;
      }
    }
  }

  if (play) {
    if (level % 10 == 0) {
      spawnTime++;
      if (spawnTime == 20) { // spawn rate
        circleBosses.add(new Circles(bossHealth));
        copyBoss--;
        if ( copyBoss == 0) {
          spawnTime = 21;
        } 
        else {
          spawnTime = 0;
        }
      }
      for (int j = 0; j < circleBosses.size(); j++) { // 
        if (circleBosses.size() > 0) {
          ((Circles)circleBosses.get(j)).circleMovement();
        }
      }

      if (circleBosses.size() == 0) { //all monsters gone, new level starts
        if (spawnTime >= 26) {
          spawnTime = 0;
          bossHealth += 500;
          boss += 1;
          level += 1;
          play = false;
          copyBoss = boss;
        }
      }
    } 
    else {
      spawnTime++;
      if (spawnTime == 25) { // spawn rate
        if ( copyMonster == 0) {
          spawnTime = 26;
        } 
        else {
          circleMonsters.add(new Circles(circleHealth));
          copyMonster--;
          spawnTime = 0;
        }
      }

      for (int j = 0; j < circleMonsters.size(); j++) { // 
        if (circleMonsters.size() > 0)
          ((Circles)circleMonsters.get(j)).circleMovement();
      } 
      if (circleMonsters.size() == 0) { //all monsters gone, new level starts
        if (spawnTime >= 26) {
          spawnTime = 0;
          circleHealth += 50;
          monsters += 2;
          level += 1;
          play = false;
          copyMonster = monsters;
        }
      }
    }
  }

  if (lives <= 0) { //game over
    play = false;
    end = true;
  }
  for (int i=0; i<towers.size(); i++) {

    ((Tower)towers.get(i)).showTower();
    ((Tower)towers.get(i)).shoot();
  }

  if (end) {
    for (int z = 0; z < towers.size(); z++) {
      towers.remove(z);
    }
    for (int z = 0; z < circleMonsters.size(); z++) {
      circleMonsters.remove(z);
    }
    for (int z = 0; z < circleBosses.size(); z++) {
      circleBosses.remove(z);
    }
    lose();
  }
}
void mousePressed() {

  if (intro) { //continue button
    if ((mouseX >= 480 && mouseX <= 600) && (mouseY >= 440 && mouseY <= 480)) {
      intro = false;
      buttonTimer = 0;
    }
  }

  if (!play && !intro) {
    if ((mouseX >= 480 && mouseX <= 600) && (mouseY >= 440 && mouseY <= 480)) {
      if (buttonTimer > 1)
        play = true;
    }
  }
  if (!end && !intro) {
    if (mousefindYPos < 11 && !(mousefindYPos == 1 && mousefindXPos < 15) && !(mousefindXPos == 14 && (mousefindYPos >= 1 && mousefindYPos <= 3 || mousefindYPos >= 5 && mousefindYPos <= 7)) && 
      !(mousefindYPos == 3 && mousefindXPos < 15 && mousefindXPos >= 1) && !(mousefindYPos == 5 && mousefindXPos < 15 && mousefindXPos >= 1) && !(mousefindYPos == 7 && mousefindXPos < 15) && !(mousefindXPos == 1 && mousefindYPos == 4)) {

      for (int x = 0; x < towers.size(); x++) {
        if ( xLocation(mousefindXPos, mousefindYPos) == ((Tower)towers.get(x)).getX() && yLocation(mousefindXPos, mousefindYPos) == ((Tower)towers.get(x)).getY()) {
          if (((Tower)towers.get(x)).upgrade && money >= 500) {
            towers.add(new Tower(((Tower)towers.get(x)).getX(), ((Tower)towers.get(x)).getY(), false));
            money -= 500;
          }
          sameTowerPlacement = true;
        } 
        else {
          sameTowerPlacement = false;
        }
      }
      if (money >= 250 && !sameTowerPlacement) {
        towers.add(new Tower(xLocation(mousefindXPos, mousefindYPos), yLocation(mousefindXPos, mousefindYPos), true));
        money -= 250;
      }
    }
  }
}
void lose() {
  background(0);
  fill(255);
  text("GAME OVER", 320 , 200);
}
/*
Class Taken
 */
class Button {

  int rectX = 0;
  int rectY = 0;
  int xPos, yPos;
  int rectSize = 40;
  color rColor, bColor, highlighter, rRed, cColor;
  boolean rectOver = false;
  boolean rectOn = false;

  Button() {
    highlighter = color(175, 100);
    rRed = color(#278AA8, 25);
    bColor = color(102);
    cColor = rRed;
  }

  void showButton (int x, int y) {
    rectX = x;
    rectY = y;
    rColor = color(cColor);

    update(mouseX, mouseY);
    xPos = findXPos(mouseX, mouseY);
    yPos = findYPos(mouseX, mouseY);
    if (rectOver) {
      if (mousefindYPos < 11 && !(mousefindYPos == 1 && mousefindXPos < 15) && !(mousefindXPos == 14 && (mousefindYPos >= 1 && mousefindYPos <= 3 || mousefindYPos >= 5 && mousefindYPos <= 7)) && 
        !(mousefindYPos == 3 && mousefindXPos < 15 && mousefindXPos >= 1) && !(mousefindYPos == 5 && mousefindXPos < 15 && mousefindXPos >= 1) && !(mousefindYPos == 7 && mousefindXPos < 15) && !(mousefindXPos == 1 && mousefindYPos == 4)) {
        fill(highlighter);
      }
    }
    else {
      fill (rColor);
    }

    stroke(255, 10);
    rect(rectX, rectY, rectSize, rectSize);
  }

  void update (int x, int y) {

    if (overRect(rectX, rectY, rectSize, rectSize)) {
      rectOver = true;
    }
    else {
      rectOver = false;
    }

    if (mousePressed && rectOver) {
      rectOn = true;
    }
    else {
      rectOn = false;
    }
  }

  int findXPos (int x, int y) {
    int a = 0;
    if (mousePressed && rectOn) {
      a = rectX;
    }
    return a;
  }

  int findYPos (int x, int y) {
    int a = 0;
    if (mousePressed && rectOn) {
      a = rectY;
    }
    return a;
  }

  boolean overRect (int x, int y, int width, int height)
  {
    if (mouseX > x-20 && mouseX <= x+20 && mouseY > y-20 && mouseY <= y+20) {
      return true;
    }
    else {
      return false;
    }
  }
}
class Circles {

  int xpos = -1;
  int ypos = 60;
  int speed = 2;
  int circleHP;
  PImage circle;
  boolean xLine = true;
  boolean xLine2 = true;

  Circles (int hp) {
    circleHP = hp;
    if (level % 10 == 0) {
      circle = loadImage("Boss.png");
    } 
    else {
      circle = loadImage("Monster.png");
    }
  }

  void damage() {
    circleHP -= 10;
  }

  void upgradeDamage() {
    circleHP -= 20;
  }

  void circleMovement() {

    if (xpos < 580 && xLine) {
      xpos += speed;
    }
    else if (ypos < 140) {
      ypos += speed;
      xLine = false;
    }
    else if (xpos > 60 && xLine2) {
      xpos -= speed;
    }
    else if (ypos < 220 && ypos >= 140) {
      ypos += speed;
      if (ypos == 218) {
        xLine = true;
        xLine2 = false;
      }
    }
    else if (ypos < 300 && ypos >= 220) {
      ypos += speed;
      xLine = false;
    }
    else
      xpos -= speed;

    pushMatrix();
    translate(xpos, ypos);
    image(circle, 0, 0, 40, 25);
    popMatrix();

    if (circleHP < 0) {
      if (level % 10 == 0) {
        circleBosses.remove(this);
        money += 200;
      } 
      else {
        circleMonsters.remove(this);
        money += 50;
      }
    }
    if (xpos < -25) {
      if (level % 10 == 0) {
        circleBosses.remove(this);
        lives -= 2;
      } 
      else {
        lives -= 1;
        circleMonsters.remove(this);
      }
    }
  }
}
/*
Class Taken
 */
class Bullet {
  PVector loc = new PVector();
  int time = 0;
  PVector center;
  PVector turret;
  float xDir, yDir;
  PImage bullets;

  Bullet (float x, float y) {
    loc.x = x;
    loc.y = y;
    turret = new PVector(loc.x, loc.y);
  }

  void run(float x, float y) {
    xDir = x;
    yDir = y;
    center = new PVector(xDir, yDir);
    PVector velocity = PVector.sub(center, turret);
    loc.add(new PVector(velocity.x/2, velocity.y/2));
  }
}
class Tower {

  ArrayList bullets;
  PVector location = new PVector();
  float r = 40;
  float aX = r;
  float aY = r;
  int radius = 100;
  int Tfr = 0;
  int inReach = 160;
  PImage towers;
  boolean upgrade;
  float towerX, towerY;


  float angle;

  Tower (float x, float y, boolean upgradable) {
    towerX = x;
    towerY = y;
    location.x = x;
    location.y = y;
    upgrade = upgradable;
    bullets = new ArrayList();
    if (!upgradable) {
      towers = loadImage("upgraded.png");
    } 
    else {
      towers = loadImage("vehicle-tower-defense-3.png");
    }
  }
  int getX() {
    return (int)towerX;
  }
  int getY() {
    return (int)towerY;
  }

  void showTower() {
    //code taken
    for (int i=0; i < circleMonsters.size(); i++) {
      if (dist(((Circles)circleMonsters.get(0)).xpos, ((Circles)circleMonsters.get(0)).ypos, location.x, location.y) < inReach) {       
        angle = atan2((((Circles)circleMonsters.get(0)).ypos)-location.y, (((Circles)circleMonsters.get(0)).xpos)-location.x);
        aX = (r * cos(angle)) + location.x;
        aY = (r * sin(angle)) + location.y;
      }
    }

    image(towers, location.x, location.y);
    pushMatrix();
    translate(location.x, location.y+1);
    popMatrix();
  }

  void shoot() {
    //code taken
    if ( level % 10 == 0) {
      if (circleBosses.size() > 0) {
        if (dist(((Circles)circleBosses.get(0)).xpos, ((Circles)circleBosses.get(0)).ypos, location.x, location.y) < inReach) {
          if (upgrade) {
            Tfr++;
          }
          Tfr++;
          if (Tfr == 6) {
            bullets.add(new Bullet(location.x, location.y)); 
            Tfr = 0;
          }
        }

        for (int k=0; k<bullets.size(); k++) {

          image(towers, location.x, location.y);
          ((Bullet)bullets.get(k)).run(aX, aY);
          pushMatrix();
          translate(location.x, location.y);
          popMatrix();


          if (dist(((Circles)circleBosses.get(0)).xpos, ((Circles)circleBosses.get(0)).ypos, ((Bullet)bullets.get(k)).loc.x, ((Bullet)bullets.get(k)).loc.y) < 25) {
            bullets.remove(k);
            if ( !upgrade ) {
              ((Circles)circleBosses.get(0)).upgradeDamage();
            } 
            else {
              ((Circles)circleBosses.get(0)).damage();
            }
          }
          else if (((Bullet)bullets.get(k)).loc.x > width || ((Bullet)bullets.get(k)).loc.x < 0 || ((Bullet)bullets.get(k)).loc.y > height || ((Bullet)bullets.get(k)).loc.y < 0) {
            bullets.remove(k);
          }
        }
      }
    } 
    else {
      if (circleMonsters.size() > 0) {
        if (dist(((Circles)circleMonsters.get(0)).xpos, ((Circles)circleMonsters.get(0)).ypos, location.x, location.y) < inReach) {
          if (upgrade) {
            Tfr++;
          }
          Tfr++;
          if (Tfr == 6) {
            bullets.add(new Bullet(location.x, location.y)); 
            Tfr = 0;
          }
        }

        for (int k=0; k<bullets.size(); k++) {

          image(towers, location.x, location.y);
          ((Bullet)bullets.get(k)).run(aX, aY);
          pushMatrix();
          translate(location.x, location.y);
          popMatrix();


          if (dist(((Circles)circleMonsters.get(0)).xpos, ((Circles)circleMonsters.get(0)).ypos, ((Bullet)bullets.get(k)).loc.x, ((Bullet)bullets.get(k)).loc.y) < 25) {
            bullets.remove(k);
            ((Circles)circleMonsters.get(0)).damage();
          }
          else if (((Bullet)bullets.get(k)).loc.x > width || ((Bullet)bullets.get(k)).loc.x < 0 || ((Bullet)bullets.get(k)).loc.y > height || ((Bullet)bullets.get(k)).loc.y < 0) {
            bullets.remove(k);
          }
        }
      }
    }
  }
}



