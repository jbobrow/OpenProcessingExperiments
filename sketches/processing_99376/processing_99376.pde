
PImage mario; //done
PImage block; //done
PImage castle; //done

int score;
float xShift, yShift;

PVector moveMario;
PVector vel;

ArrayList<Goomba> goombas = new ArrayList<Goomba>();
ArrayList<Ground> floor = new ArrayList<Ground>();
ArrayList<Brick> bricks = new ArrayList<Brick>();
ArrayList<Coin> coins = new ArrayList<Coin>();
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
ArrayList<Flag> flag = new ArrayList<Flag>();
ArrayList<Block> blocks = new ArrayList<Block>();
void setup() {
  xShift = 0; 
  yShift = 0;
  size(800, 300);
  background(123, 170, 252);

  mario = loadImage("Mario_IDLE.gif");
  block = loadImage("Mario_BLOCK.PNG");
  castle = loadImage("Mario_CASTLE.PNG");

  moveMario = new PVector (10, 200);

  //populates ArrayList with goombas
  int j = 0;
  while (j < 4) {
    goombas.add(new Goomba((int) (260 + (Math.random() * 700)), 203));
    j++;
  }

  //populates ArrayList with floor
  for (int i = 0; i < width * 2; i = i+14) {
    floor.add(new Ground(i, 220));
  }

  //populates ArrayList with bricks
  for (int i = 59; i < 124; i = i+13) {
    bricks.add(new Brick(i, 175));
  }

  //populates ArrayList with pipes
  for (int i = 150; i < 1000; i += 800) {
    pipes.add(new Pipe(i, 204));
  }

  //populates ArrayList with coins
  for (int i = 0; i < 10; i++) {
    coins.add(new Coin((int) (200 + Math.random() * 700), 200));
  }

  //populates ArrayList with blocks
  blocks.add(new Block(1175, 205));

  //adds flag to ArrayList
  flag.add(new Flag(1163, 163));
  
  Flag f1 = new Flag(1163,163);
  start();
}

void keyPressed() {
  if (keyCode == UP) {
    jump();
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      //stop at end of world
      if (xShift <= -700) {
      } 
      //centers mario and prevents mario from moving off the world
      else if (moveMario.x < width/4 - xShift/2) {
        moveMario.x += 2.5;
      } 
      //allows mario to keep on moving when xShift stops at end of world
      else if (moveMario.x >= 522.5 && moveMario.x < 690) {
        moveMario.x += 2.5;
      } 
      else {
        //shift right
        xShift -= 5;
        moveMario.x += 2.5;
      }
    }
    else if (keyCode == LEFT) {
      // prevents mario from going off the left side of the world
      if (xShift <= 0 && moveMario.x > 10) {
        // prevents mario from moving outside of world after translate has happened
        if (moveMario.x < - (xShift/2) + 2.5) {
        } 
        else {
          //shift left
          moveMario.x -= 2.5;
        }
      }
    }
    else if (keyCode == DOWN) {
      moveMario.y += 5;
    }
  }
}

void draw() {
  translate(xShift, yShift);
  background(123, 170, 252);


  image(mario, moveMario.x * 2, moveMario.y);

  //populates world with pipes
  for (Pipe p: pipes) {
    p.render();
  }

  //populates world with goombas
  for (Goomba g: goombas) {
    g.render();
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

  //adds flag to world
  for (Flag f: flag) {
    f.render();
  }

  //adds blocks to world
  for (Block b: blocks) {
    b.render();
  }

  for (int i = 190; i < 254; i = i + 14) {
    for (int j = 205; j > 190; j = j - 15) {
      image(block, i, j);
    }
  }
  for (int i = 1000; i < 1064; i = i + 14) {
    for (int j = 205; j > 130; j = j - 15) {
      i += 14;
      // image(block, i, j);
    }
  }

  for (int j = 145; j < 220; j += 15) {
    for (int i = 1064; i > 1000; i -= 14) {
      image(block, i, j);
    }
  }
  image(castle, 1250, 170);

  if (hasDied()) {
    image(mario, 1000, 1000);
  }
}

boolean hasDied() {
  for (Goomba g: goombas ) {
    //took from Jonathan Chen's 'Evade'
    float distance = dist(g.x, g.y, moveMario.x, moveMario.y);
    if (distance <= 25) {
      return true;
    }
  }
  return false;
}

/*boolean hasCollided() {
 if (moveMario.x) {
 }
 }*/

boolean isOnGround() {
  for (Ground g: floor) {
    if (g.y - moveMario.y == 20 ) {
      return true;
    }
  }
  return false;
}

void jump() {
  if (keyPressed) {
    if (key == ' ') {
      moveMario.y--;
      println(moveMario.y);
    }
  }
}

void start() {
  fill(0);
  text("Mario", width/2, 20);
  text("Press space to start", 315, 50);
  if (keyCode == ' ') {
  }
}

class Goomba {
  float x, y;
  PImage goomba;

  Goomba(float widthVal, float heightVal) {
    x = widthVal;
    y = heightVal;
    goomba = loadImage("Mario_GOOMBA.gif");
  }

  void render() {
    image(goomba, x, y);
  }
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
  private float x, y;
  private PImage mario;

  Mario(float widthVal, float heightVal) {
    x = widthVal;
    y = heightVal;
    mario = loadImage("Mario_IDLE.gif");
  }

  void render() {
    image(mario, x, y);
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
}



