
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer audioPlayer1;
AudioSample getTrophy;
PImage playerSheet;
PImage enemySheet;
PImage trophy1;
PImage backgroundLevel1;
PImage backgroundGrass;
PImage[] playerSprites;
PImage[] enemySprites;
boolean atStart;
boolean inGame;

long time;
long numFrames;
long level;

Button startButton;

Teleporter topTeleporter;
Teleporter leftTeleporter;
Teleporter rightTeleporter;

Goal goal;
Player player;
Enemy[] enemies;
Hitbox[] hitboxes;

void setup() {
  minim = new Minim(this);
  audioPlayer1 = minim.loadFile("LD27 MainSong.mp3");
  getTrophy = minim.loadSample("LD27 GetTrophy.mp3", 512);
  audioPlayer1.loop();
  initializeGame();
}

void draw() { 
  frameRate(60);
  numFrames++;

  if (numFrames % 60 == 0 && inGame) time++;

  imageMode(CENTER);

  if (inGame) { 
    background(backgroundGrass);
    textSize(24);
    text("TIME: " + time + "  LEVEL: " + level, 0, 0, 100, 100);
    makeHitboxes();

    goal.drawGoal();

    player.drawPlayer();
    topTeleporter.teleportPlayer(player, topTeleporter, leftTeleporter, rightTeleporter);
    leftTeleporter.teleportPlayer(player, topTeleporter, leftTeleporter, rightTeleporter);
    rightTeleporter.teleportPlayer(player, topTeleporter, leftTeleporter, rightTeleporter);

    player.movePlayer();
    player.grabGoal(goal);
    for (int i = 0; i < enemies.length; i++) {
      player.loseHealth(enemies[i]);
    }
    player.canMoveUp = player.canMoveDown = player.canMoveLeft = player.canMoveRight = true;

    drawEnemies();

    image(backgroundLevel1, width / 2, height / 2);

    lose();

    for (int i = 0; i < hitboxes.length; i++) {
      hitboxes[i].drawHitbox();
    }
  }

  if (atStart) {
    startButton.drawButton();
    startButton.highlightButton();
  }
}

void mousePressed() {
  startButton.clickButton(1);
}

void getEnemySprites() {
  enemySheet = loadImage("EnemySpritesheet.png");
  enemySprites = new PImage[10]; 
  for (int i = 0; i < enemySprites.length; i++) {
    enemySprites[i] = enemySheet.get(i * 32, 0, 32, 32);
  }
}

void getPlayerSprites() {
  playerSheet = loadImage("PlayerSpritesheet.png");
  playerSprites = new PImage[8];
  for (int i = 0; i < playerSprites.length; i++) {
    playerSprites[i] =  playerSheet.get(i * 16, 0, 16, 16);
    playerSprites[i].resize(32, 0);
  }
}


void initializeGame() {
  time = 0;
  numFrames = 0;
  level = 0;
  getPlayerSprites();
  getEnemySprites();
  trophy1 = loadImage("Trophy.png");
  backgroundLevel1 = loadImage("BackgroundLevel1.png");
  backgroundGrass = loadImage("BackgroundGrass.png");
  size(600, 600); 
  inGame = false;
  atStart = true;
  startButton = new Button(width / 4, height / 4, width / 2, height / 2, 1, "START");
  hitboxes = new Hitbox[8];
  enemies = new Enemy[15];
  player = new Player();
  goal = new Goal(63, 549);
  topTeleporter = new Teleporter(297, 190);
  leftTeleporter = new Teleporter(124, 506);
  rightTeleporter = new Teleporter(475, 500);
 
  hitboxes[0] = new Hitbox(120, 231, 45, 70);
  hitboxes[1] = new Hitbox(455, 137, 30, 55);
  hitboxes[2] = new Hitbox(324, 256, 34, 50);
  hitboxes[3] = new Hitbox(220, 345, 48, 73);
  hitboxes[4] = new Hitbox(86, 386, 39, 60);
  hitboxes[5] = new Hitbox(233, 484, 40, 68);
  hitboxes[6] = new Hitbox(375, 387, 37, 65);
  hitboxes[7] = new Hitbox(512, 329, 38, 84);

  for (int i = 0; i < enemies.length; i++) {
     enemies[i] = new Enemy(0, 0);
  }
  
  // add other enemies when trophy is aquired

}

void drawEnemies() {
  for (int i = 0; i < enemies.length; i++) {
    enemies[i].moveTowardsPlayer(player);
    enemies[i].canMoveUp = enemies[i].canMoveDown = enemies[i].canMoveLeft = enemies[i].canMoveRight = true;
  }
}

void makeHitboxes() {
  for (int i = 0; i < hitboxes.length; i++) {

    hitboxes[i].stopPlayer(player);
    for (int j = 0; j < enemies.length; j++) {
      hitboxes[i].stopEnemy(enemies[j]);
    }
  }
}

void lose() {
  if (time > 9) {
    atStart = true;
    inGame = false;
    fill(0);
    text("YOU REACHED LEVEL " + level, 150, height / 5);
  }
}

public class Button {
  int x;
  int y;
  int w;
  int h;
  int buttonVal; // used to determine which method to execute
  String someText;

  public Button(int xCoor, int yCoor, int wid, int hei, int v, String s) {
    x = xCoor;
    y = yCoor;
    w = wid;
    h = hei;
    buttonVal = v;
    someText = s;
  }

  public void drawButton() {
    fill(255);
    stroke(0);
    rect(x, y, w, h);
    fill(0);
    textSize(30);
    text(someText, x + w / 2, y + h / 2);
  }
  public void highlightButton() {
    if (mouseX > this.x && mouseX < this.x + this.w && mouseY > this.y && mouseY < this.y + this.h) {
      fill(0);
      rect(x, y, w, h);
      fill(255);
      textSize(30);
      text(someText, x + w / 2, y + h / 2);
    }
  }
  public void clickButton(int v) {
    if (mouseX > this.x && mouseX < this.x + this.w && mouseY > this.y && mouseY < this.y + this.h) {
      // what to do if start button is clicked
      if (v == 1) {
        initializeGame();
        inGame = true;
        atStart = false;
      }
    }
  }
}

public class Enemy {
  float x;
  float y;
  float divisor;
  float xSpeed;
  float ySpeed;

  boolean canMoveUp;
  boolean canMoveDown;
  boolean canMoveLeft;
  boolean canMoveRight;

  public Enemy(int xCoor, int yCoor) {
    x = xCoor;
    y = yCoor;
    canMoveUp = canMoveDown = canMoveLeft = canMoveRight = true;
  }

  public void moveTowardsPlayer(Player p) {
    if (p.x > this.x) {
      xSpeed = 1;
      if (numFrames % 40 > 20) {
      image(enemySprites[4], x, y);
      } 
      else {
        image(enemySprites[5], x, y); 
      }
    }
    if (p.x < this.x) {
      xSpeed = -1;
      if (numFrames % 40 > 20) {
        image(enemySprites[6], x, y);
      }
      else {
       image(enemySprites[7], x, y); 
      }
    }
    if (p.y > this.y) {
      if (numFrames % 40 > 20) {
        image(enemySprites[0], x, y);
      }
      else {
        image(enemySprites[1], x, y);  
      }
      if (xSpeed > 0) {
        xSpeed = ySpeed = 0.5;
      }
      else if (xSpeed < 0) {
        xSpeed = -0.5;
        ySpeed = 0.5;
      }
      else {
        ySpeed = 1;
      }
    }
    if (p.y < this.y) {
      if (numFrames % 40 > 20) {
        image(enemySprites[2], x, y);
      }
      else {
        image(enemySprites[3], x, y);  
      }
      if (xSpeed > 0) {
        xSpeed = 0.5;
        ySpeed = - 0.5;
      }
      else if (xSpeed < 0) {
        xSpeed = -0.5;
        ySpeed = -0.5;
      }
      else {
        ySpeed = -1;
      }
    }

    if (canMoveLeft && canMoveRight) {
      x += xSpeed;
    }
    if (canMoveUp && canMoveDown) {
      y += ySpeed;
    }
  }
}

public class Goal {
  int x;
  int y;
  boolean withPlayer;

  public Goal(int xCoor, int yCoor) {
    x = xCoor;
    y = yCoor;
    withPlayer = false;
  }

  public void drawGoal() {
    if (!withPlayer) {
      fill(255, 255, 0);
      image(trophy1, x, y);
    }
  }
}

public class Hitbox {
  int x;
  int y;
  int w;
  int h;
  boolean visible;

  public Hitbox(int xCoor, int yCoor, int wid, int hei) {
    x = xCoor;
    y = yCoor;
    w = wid;
    h = hei;
    visible = false;
  }

  public void drawHitbox() {
    if (visible) {
      noFill();
      stroke(0, 0, 255);
      rect(x, y, w, h);
    }
  }

  public void stopPlayer(Player p) {
    if (p.y <= this.y + this.h + 1 && p.y >= this.y && p.x >= this.x && p.x <= this.x + this.w) {
      p.canMoveUp = false;
    }
    if (p.y <= this.y + this.h && p.y >= this.y - 1 && p.x >= this.x && p.x <= this.x + this.w) {
      p.canMoveDown = false;
    }
    if (p.y <= this.y + this.h && p.y >= this.y && p.x >= this.x && p.x <= this.x + this.w + 1) {
      p.canMoveLeft = false;
    }
    if (p.y <= this.y + this.h && p.y >= this.y && p.x >= this.x - 1 && p.x <= this.x + this.w) {
      p.canMoveRight = false;
    }
  }

  public void stopEnemy(Enemy e) {
    if (e.y <= this.y + this.h + 1 && e.y >= this.y && e.x >= this.x && e.x <= this.x + this.w) {
      e.canMoveUp = false;
    }
    if (e.y <= this.y + this.h && e.y >= this.y - 1 && e.x >= this.x && e.x <= this.x + this.w) {
      e.canMoveDown = false;
    }
    if (e.y <= this.y + this.h && e.y >= this.y && e.x >= this.x && e.x <= this.x + this.w + 1) {
      e.canMoveLeft = false;
    }
    if (e.y <= this.y + this.h && e.y >= this.y && e.x >= this.x - 1 && e.x <= this.x + this.w) {
      e.canMoveRight = false;
    }
  }
}

public class Player {
  // xSpeed and ySpeed should be no greater than the + on the hitbox
  float x;
  float y;
  int xSpeed;
  int ySpeed;
  int numSteps;
  int direction;
  boolean canMoveUp;
  boolean canMoveDown;
  boolean canMoveLeft;
  boolean canMoveRight;
  int health; // out of 120 (two seconds and youre dead)

  public Player() {
    numSteps = 0;
    health = 120;
    direction = 1;
    x = width / 2;
    y = height / 2;
    canMoveUp = canMoveDown = canMoveLeft = canMoveRight = true;
  }

  public void drawPlayer() {
    if (direction == 1) {
      if (numSteps % 60 > 30) {
        image(playerSprites[2], x, y);
      }
      else {
        image(playerSprites[3], x, y);
      }
    }
    if (direction == 2) {
      if (numSteps % 60 > 30) {
        image(playerSprites[0], x, y);
      }
      else {
        image(playerSprites[1], x, y);
      }
    }
    if (direction == 3) {
      if (numSteps % 60 > 30) {
        image(playerSprites[6], x, y);
      }
      else {
        image(playerSprites[7], x, y);
      }
    }
    if (direction == 4) {
      if (numSteps % 60 > 30) {
        image(playerSprites[4], x, y);
      }
      else {
        image(playerSprites[5], x, y);
      }
    }
  }
  public void movePlayer() {
    numSteps++;
    if (keyPressed) {
      if (key == 'w') {
        direction = 1;
        xSpeed = 0;
        ySpeed = -1;
      }
      if (key == 's') {
        direction = 2;
        xSpeed = 0;
        ySpeed = 1;
      }
      if (key == 'a') {
        direction = 3;
        xSpeed = -1;
        ySpeed = 0;
      }
      if (key == 'd') {
        direction = 4;
        xSpeed = 1;
        ySpeed = 0;
      }
    }

    if (x > width) {
      x = 0;
    }
    if (x < 0) {
      x = width;
    }
    if (y > height) {
      y = 0;
    }
    if (y < 0) {
      y = height;
    }

    if ((canMoveLeft && xSpeed < 0) || canMoveRight && xSpeed > 0) {
      x += xSpeed;
    }
    if ((canMoveUp && ySpeed < 0) || canMoveDown && ySpeed > 0) {
      y += ySpeed;
    }
  }

  public void loseHealth(Enemy e) {
    if (dist(e.x, e.y, this.x, this.y) < 10) {
      fill(255, 0, 0, 20);
      rect(0, 0, width, height);
      health--;
    }  
    if (health <= 0) {
      health = 120;
      x = width / 2;
      y = height / 2;
    }
  }

  public void grabGoal(Goal g) {
    if (dist(this.x, this.y, g.x, g.y) < 15) {
      getTrophy.trigger();
      time = 0;
      level++;
      if (level % 1 == 0) {
        g.x = 88;
        g.y = 310;
        enemies[1] = new Enemy(0, 600);
        enemies[2] = new Enemy(0, 0);
      }
      if (level % 2 == 0) {
        g.x = 383;
        g.y = 528;
        enemies[3] = new Enemy(600, 0);
      }
      if (level % 3 == 0) {
        g.x = 200;
        g.y = 240;
        enemies[4] = new Enemy(0, 300);
      }
      if (level % 4 == 0) {
        g.x = 358;
        g.y = 502;
        enemies[5] = new Enemy(300, 0);
      }
      if (level % 5 == 0) {
        g.x = 437;
        g.y = 310;
        enemies[6] = new Enemy(3000, 600);
      }
      if (level % 6 == 0) {
        g.x = 350;
        g.y = 178;
        enemies[7] = new Enemy(600, 300);
      }
      if (level % 7 == 0) {
        g.x = 180;
        g.y = 179;
        enemies[8] = new Enemy(0, 0);
      }
      if (level % 8 == 0) {
        g.x = 113;
        g.y = 292;
        enemies[9] = new Enemy(600, 0);
      }
      if (level % 9 == 0) {
        g.x = 43;
        g.y = 88;
        enemies[10] = new Enemy(0, 600);
      }
      if (level % 10 == 0) {
        g.x = 243;
        g.y = 245;
        enemies[11] = new Enemy(600, 600);
      }
      if (level % 11 == 0) {
        g.x = 311;
        g.y = 401;
        enemies[12] = new Enemy(300, 600);
      }
      if (level % 12 == 0) {
        g.x = 170;
        g.y = 424;
          enemies[13] = new Enemy(0, 300);
      }
      if (level % 13 == 0) {
        g.x = 470;
        g.y = 412;
        enemies[15] = new Enemy(600, 300);
      }
    }
  }
}

public class Teleporter {
  int x;
  int y;
  public Teleporter(int xCoor, int yCoor) {
    x = xCoor;
    y = yCoor;
  }  
  
  public void teleportPlayer(Player p, Teleporter t1, Teleporter t2, Teleporter t3) {
    if (dist(p.x, p.y, t1.x, t1.y) < 15) {
      p.x = t2.x;
      p.y = t2.y + 25;
    }  
    if (dist(p.x, p.y, t2.x, t2.y) < 15) {
      p.x = t3.x;
      p.y = t3.y + 25;
    }  
    if (dist(p.x, p.y, t3.x, t3.y) < 15) {
      p.x = t1.x;
      p.y = t1.y + 25;
    }  
  }
}


