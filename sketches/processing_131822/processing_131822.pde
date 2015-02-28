
color BACKDROP = color(69,139,116);
color GROUND = color(255,255,255);
color RED = color(255,0,0);
int BASE = 230;
boolean GAME_OVER = false;
PImage backdrop;
PImage game_over;

Player player;
Block block;

void setup(){
  size(450,300);
  frameRate(60);
  
  player = new Player();
  block = new Block();
  
  game_over = loadImage("game_over.png");
  backdrop = loadImage("backdrop.png");
}

void draw(){
  if (GAME_OVER != true){
  image(backdrop,0,0);
  stroke(GROUND);
  line(20,BASE,430,230);

  block.draw();
  block.step();

  player.draw();
  if (mousePressed) player.jumping = true;
  }
  if (GAME_OVER != false) {
    image(game_over,0,0);
    if (mousePressed) GAME_OVER = false;
  }
}
class Block {
  PImage block;
  int x, y;
  
  Block(){
    block = loadImage("block.png");
    x = width + block.width;
    y = BASE - block.width;
  }
  
  void draw(){
    image(block,x,y);
    if (player.x+20 > x && player.x < x+20 && player.y > BASE-40){
      GAME_OVER = true;
    }
  }
  
  void step(){
    x -= 4;
    if(x < -block.width){
      x = width + block.width;
    }
  }
}
class Player {
  PImage image;
  float x, y;
  float GRAVITY = 1;
  int VELOCITY = -10;
  int T = 0;
  boolean jumping = false;
  boolean falling = false;
  
  Player(){
    image = loadImage("cube0.png");
    x = 80;
    y = BASE-image.height;
  }
  
  void draw(){
    image(image,x,y);
    jump();
    correct();
  }
  void jump(){
    if (jumping != false){
      y = y+VELOCITY+GRAVITY*T;
      T++;
      if (VELOCITY+GRAVITY*T >= 0){
        jumping = false;
        falling = true;
        T=0;
      }
    }
  }
  void correct(){
    if (falling != false){
      y = y-VELOCITY+GRAVITY*T;
      T++;
      if (x+19 >= block.x && x <= block.x + 19 && y-VELOCITY+GRAVITY*T > BASE-image.height){
        y = BASE-2*image.height;
        falling = false;
        T=0;
      }
      if (x+19 >= block.x && x <= block.x + 19 && y+image.height == BASE-image.height){
        falling = false;
        T=0;
      }
      if (y-VELOCITY+GRAVITY*T > BASE-image.height){
        y = BASE-image.height;
        falling = false;
        T=0;
      }
      if (y == BASE-image.height){
        falling = false;
        T=0;
      }
    }
    if (x > block.x+20){
      falling = true;
      T=0;
    }
  }
}



