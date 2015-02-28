
import ddf.minim.*;

PImage block;
PImage castle;
PImage coin;
PImage coinCounter;

//taken from http://wiki.processing.org/w/Multiple_key_presses
boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keydown = false;

boolean ifDying = false;
boolean hasWon = false;
boolean debug = true;

int coinCollected;

//audio
Minim minim;
AudioSample marioGamePlay;
AudioSample marioGameOver;
AudioSample marioLevelComplete;
AudioSample marioCoin;
AudioSample marioJump;

int score;
float xShift, yShift;

//mario world objects

ArrayList<Ground> floor = new ArrayList<Ground>();
ArrayList<Brick> bricks = new ArrayList<Brick>();
ArrayList<Coin> coins = new ArrayList<Coin>();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
ArrayList<Block> blocks = new ArrayList<Block>();
ArrayList<Block> topBlocks = new ArrayList<Block>();

Mario mario;
Flag flag;

void setup() {
  size(700, 300);
  background(123, 170, 252);

  xShift = 0; 
  yShift = 0;

  mario = new Mario(10, 200);
  flag = new Flag(1163, 163);

  block = loadImage("Mario_BLOCK.PNG");
  castle = loadImage("Mario_CASTLE.PNG");
  coin = loadImage("Mario_COIN.gif");
  coinCounter = loadImage("Mario_COINCOUNTER.PNG");

  //sound
  minim = new Minim(this);
  //MarioGamePlay.MP3 from http://www.youtube.com/watch?v=3zIf4lj5rFY
  marioGamePlay = minim.loadSample("Mario_GAMEPLAY.MP3", 2048);
  //MarioGameOver.MP3 from http://www.youtube.com/watch?v=5Wc3kwv0Ddw
  marioGameOver = minim.loadSample("Mario_GAMEOVER.MP3", 2048);
  //MarioLevelComplete.MP3 from http://www.youtube.com/watch?v=3BsBXp6VkvU
  marioLevelComplete = minim.loadSample("Mario_LEVELCOMPLETE.MP3", 2048);
  //MarioCoin.MP3 from http://www.youtube.com/watch?v=Vp5YEjNhywQ
  marioCoin = minim.loadSample("Mario_COIN.MP3", 2048);
  //MarioJump.MP3 from http://www.youtube.com/watch?v=uypEE2xOgBQ
  marioJump = minim.loadSample("Mario_JUMP.MP3", 2048);

  marioGamePlay.trigger();

  //populates ArrayList with floor
  for (int i = 0; i < width * 2; i = i+14) {
    if (i != 56 && i != 70 && i != 280 && i != 392 && i != 406 && i != 700 && i != 714) {
      floor.add(new Ground(i, 220));
    }
  }

  //populates ArrayList with bricks
  for (int i = 59; i < 124; i = i+13) {
    bricks.add(new Brick(i, 160));
  }

  //populates ArrayList with pipes
  for (int i = 130; i < 1000; i += 800) {
    pipes.add(new Pipe(i, 204));
  }

  //populates ArrayList with coins
  for (int i = 0; i < 10; i++) {
    coins.add(new Coin((int) (260 + Math.random() * 700), 205));
  }

  //populates ArrayList with blocks
  for (int i = 246; i > 190; i -= 14) {
    for (int j = 175; j < 210; j += 15) {
      i -= 14;
      blocks.add(new Block(i, j));
      topBlocks.add(new Block(i, j));
    }
  }

  blocks.add(new Block(232, 190));
  blocks.add(new Block(232, 205));
  blocks.add(new Block(218, 205));

  for (int i = 1042; i > 1000; i -= 14) {
    for (int j = 175; j < 210; j += 15) {
      i -= 14;
      blocks.add(new Block(i, j));
      topBlocks.add(new Block(i, j));
    }
  }

  blocks.add(new Block(1028, 190));
  blocks.add(new Block(1028, 205));
  blocks.add(new Block(1014, 205));

  blocks.add(new Block(1175, 205));
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      keyup = true;
    }
    if (keyCode == RIGHT) {
      keyright = true;
    }

    if (keyCode == LEFT) {
      keyleft = true;
    }
  }
}


void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) keyup = false; 
    if (keyCode == DOWN) keydown = false; 
    if (keyCode == LEFT) keyleft = false; 
    if (keyCode == RIGHT) keyright = false;
  }
}


void draw() {

  //creates a light blue background 
  background(123, 170, 252);

  //see if mario is on a stair or on ground, if not, mario falls
  if (!isOnStair() && !isOnGround()) {
    mario.y += 2;
  } 

  if (mario.y > 200 && mario.y < 205) {
    marioGamePlay.stop();
    marioGameOver.trigger();
  }

  else if (keyup == true) {
    //println(isOnStair());
    //println(nearestStair());
    //if (!hasDied()) {
    if (isOnGround() || isOnStair()) {
      mario.y -= 30;
      marioJump.trigger();
    }
  }

  if (keyright == true) {

    if (!isOnGround()) {
      mario.x += 0;
    }
    if (coinCollected()) {
      marioCoin.trigger();
    }

    if (touchingBlockLeft() || hasCollidedPipe()) {
    }

    //allows mario to move during beginning of map and and centers him
    else if (mario.x > xShift && mario.x < width/2) { 
      mario.x += 2;
    }

    //allows mario to move while he is centered and moves the map
    else if (xShift > -700 && mario.x >= width/2) {
      mario.x += 2;
      if (mario.x < -xShift + width/2) {
        xShift -= 0;
      } 
      else {
        xShift -= 2;
      }
    }

    else if (xShift == -700 && mario.x < 1350) {
      if (hasWon()) {
        mario.x += 0;
        marioGamePlay.stop();
        marioLevelComplete.trigger();
      } 
      else {
        mario.x += 2;
      }
    }
  }

  if (keyleft == true) {
    if (coinCollected()) {
      marioCoin.trigger();
    }
    if (touchingBlockRight()) {
    }
    //prevents mario from moving  left in beginning of world
    if (mario.x < 10) {
    }
    //centers mario if not centered and allow him to move
    else if (mario.x > -(xShift)) {
      if (hasWon()) {
        mario.x += 0;
      }
      else {
        mario.x -= 2;
      }
    } 
    //if xShift is at the end of the world, only allow mario to move
    else if (xShift == -(700 - width)) {
      mario.x -= 2;
    }
  }


  translate(xShift, yShift);

  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(mario.x, mario.y, 2, 2);

  //populates world with pipes
  for (Pipe p: pipes) {
    p.render();
  }

  //populates world with floor
  for (Ground g: floor) {
    g.render();
  }

  //populates world with bricks
  for (Brick b: bricks) {
    b.render();
  }

  //populates world with coins
  for (Coin c: coins) {
    c.render();
  }

  //adds blocks to world
  for (Block b: blocks) {
    b.render();
  }

  //adds castle to world
  image(castle, 1250, 170);
  //adds coin counter to top of screen
  image(coinCounter, -xShift + 43, yShift + 9);
  image(coin, -xShift + 30, yShift + 10);
  text(coinCollected, -xShift + 62, yShift + 22);


  //adds flag to world
  flag.render();

  //adds mario to world
  mario.render();
}

//returns true if mario makes contact with as coin, if contact is made, mario collects it
boolean coinCollected() {
  for (Coin c: coins) {
    if ((Math.abs(c.x - mario.x) <= 10)  && c.y - mario.y <= 5) {
      coins.remove(c);
      coinCollected++;
      return true;
    }
  }
  return false;
}


//returns true if mario collides with a pipe, false otherwise
boolean hasCollidedPipe() {
  for (Pipe p: pipes) {
    if (Math.abs(p.x - mario.x) < 15 && p.y - mario.y < 18) {
      println("mario.x = " + mario.x);
      println("p.x = " + p.x);
      println("mario.y = " + mario.y);
      println("p.y = " + p.y);
      return true;
    }
  }
  return false;
}

//returns x value of nearest block
float nearestGround() {
  for (int i = 0; i < floor.size(); i++) {
    if (floor.get(i).x - 8 < mario.x && floor.get(i).x + 8 > mario.x) {
      return floor.get(i).x;
    }
  }
  return 0;
}

//returns true if mario collides with a block's left side, false otherwise
boolean touchingBlockLeft() {
  for (Block b: blocks) {
    if ((Math.abs(b.x - mario.x) <= 15 ) && b.y - mario.y <= 8) {
      /*println("b.x = " + b.x);
       println("mario.x = " + mario.x);
       println("b.y = " + b.y);
       println("mario.y = " + mario.y);*/
      if ( debug ) b.flash();
      return true;
    }
  }
  return false;
}

//returns true if mario collides with a block's right side, false otherwise
boolean touchingBlockRight() {
  Block nearest = nearestBlock();  
  if (nearest == null) {
    return false;
  }
  if (mario.x - nearest.x <= 10 && nearest.y - mario.y <= 5) {
    println("nearest.x = " + nearest.x);
    //println("mario.x = " + mario.x);
    //println("nearest.y = " + nearest.y);
    //println("mario.y = " + mario.y);
    if ( debug ) nearest.flash();

    return true;
  }
  return false;
}

Block nearestBlock() {
  for (Block b: blocks) {
    println("mario.x = " + mario.x);
    println("b.x = " + b.x);
    if (mario.x - b.x <= 100 && mario.x - b.x > 5) {
      return b;
    }
  }
  return null;
}

//returns the nearest top stair object to mario, null if no top stair is near mario
Block nearestStair() {
  for (Block b: topBlocks) {
    if (mario.x - b.x <= 5 && mario.x - b.x > -5) {
      return b;
    }
  }
  return null;
}

//returns true if mario is on a stair, false otherwise
boolean isOnStair() {
  Block nearest = nearestStair();
  if (nearest == null) { 
    return false;
  }
  if (nearest.y - mario.y < 21) {
    return true;
  }
  return false;
}


//return true is mario is on ground, false otherwise
boolean isOnGround() {
  for (Ground g: floor) {
    if (g.y - mario.y <= 20 && nearestGround() != 0  && g.y - mario.y >= 5) {
      return true;
    }
  }
  return false;
}

boolean hasWon() {
  if (flag.x - mario.x <= 7) {
    return true;
  }
  return false;
}


class Ground {
  private float x, y;
  private PImage ground;

  Ground (float widthVal, float heightVal) {
    x = widthVal;
    y = heightVal;
    ground = loadImage("Mario_GROUND.PNG");
  }


  void render() {
    image(ground, x, y);
  }
}

class Brick {
  private float x, y;
  private PImage brick;

  Brick(float widthVal, float heightVal) {
    x = widthVal;
    y = heightVal;
    brick = loadImage("Mario_BRICK.png");
  }

  void render() {
    image(brick, x, y);
  }
}

class Coin {
  private float x, y;
  private PImage coin;

  Coin(float widthVal, float heightVal) {
    x = widthVal;
    y = heightVal;
    coin = loadImage("Mario_COIN.gif");
  }

  void render() {
    image(coin, x, y);
  }
}

class Mario {
  float x, y;
  PImage marioImg;

  Mario(float widthVal, float heightVal) {
    x = widthVal;
    y = heightVal;
    marioImg = loadImage("Mario_IDLE.gif");
  }

  void render() {
    image(marioImg, x, y);
  }
}

class Pipe {
  private float x, y;
  private PImage pipe;

  Pipe(float widthVal, float heightVal) {
    x = widthVal;
    y = heightVal;
    pipe = loadImage("Mario_PIPE.png");
  }

  void render() {
    image(pipe, x, y);
  }
}

class Flag {
  private float x, y;
  private PImage flag;

  Flag(float widthVal, float heightVal) {
    x = widthVal;
    y = heightVal;
    flag = loadImage("Mario_FLAG.PNG");
  }

  void render() {
    image(flag, x, y);
  }
}

class Block {
  private float x, y;
  private PImage block;

  Block(float widthVal, float heightVal) {
    x = widthVal;
    y = heightVal;
    block = loadImage("Mario_BLOCK.PNG");
  }

  void render() {
    image(block, x, y);
  }

  void flash() {
    fill(255, 0, 0);
    rect(x-1, y-1, 16, 17);
  }
}

