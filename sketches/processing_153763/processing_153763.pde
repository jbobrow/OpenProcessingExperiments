
//load .png
PImage background_img, menubackground_img;

//load .svg
PShape playerbar_img, ball_img, tealpurplecirclebrick_img, solidbrick_img, redyellowcirclebrick_img, blackwhitecirclebrick_img, bluebrick_img, redbrick_img, greenbrick_img, pinkbrick_img, purplebrick_img, purpleorangebrick_img, redblackbrick_img, yellowbrick_img;

//global variables
int GameState;
final int width = 1280;
final int height = 720;
boolean isinitialized;

PVector ball_origin, ball_direction;

ArrayList<Brick> levelOneBricks = new ArrayList<Brick>();
Ball ball = new Ball();
Player player = new Player();

void setup() {
  size(width, height);

  
  //load images
  menubackground_img = loadImage("menubackground.png");
  background_img = loadImage("background.png");
  playerbar_img = loadShape("playerbar.svg");
  ball_img = loadShape("ball.svg");
  blackwhitecirclebrick_img = loadShape("blackwhitecirclebrick.svg");
  bluebrick_img = loadShape("bluebrick.svg");
  greenbrick_img = loadShape("greenbrick.svg");
  pinkbrick_img = loadShape("pinkbrick.svg");
  purplebrick_img = loadShape("purplebrick.svg");
  purpleorangebrick_img = loadShape("purpleorangebrick.svg");
  redblackbrick_img = loadShape("redblackbrick.svg");
  redbrick_img = loadShape("redbrick.svg");
  redyellowcirclebrick_img = loadShape("redyellowcirclebrick.svg");
  solidbrick_img = loadShape("solidbrick.svg");
  tealpurplecirclebrick_img = loadShape("tealpurplecirclebrick.svg");
  yellowbrick_img = loadShape("yellowbrick.svg");
  
  GameState = 0; //set game to main menu
}

void draw() {
  background(background_img);
  checkGameState();
  //text(mouseX + ", " + mouseY, mouseX, mouseY - 20); //draw mouse x,y coords
  drawBricks();
}

void checkGameState() {
  if (GameState == 0) { //Main Menu
    background(menubackground_img);
    isinitialized = false;
  }
  if (GameState >= 1) {
    if (ball.xspeed == 0 && ball.yspeed == 0) {
      textAlign(CENTER);
      textSize(50);
      stroke(0);
      fill(255);
      text("~Press Any Key to Begin~", width/2, height/2);
    }
  }
  if (GameState == 1) { //Level One
    if (isinitialized == false) {
      levelOneSetup();
      isinitialized = true;
    }
    ball.update();
    player.update();
  }
    //next level yet??
    checkProgress();
  }


void checkProgress() {
  if (levelOneBricks.size() == 0 && GameState != 0) {
    GameState++;
    isinitialized = false;
  }
}

void drawBricks() {
  for (int i = 0; i < levelOneBricks.size(); i++) {
    Brick brick = levelOneBricks.get(i);
    brick.update();
  }
}

//Level setup

void levelOneSetup() {
  //top row
  levelOneBricks.add(new Brick(150, 50, redbrick_img));  //1
  levelOneBricks.add(new Brick(350, 50, bluebrick_img)); //2
  levelOneBricks.add(new Brick(550, 50, redbrick_img));  //3
  levelOneBricks.add(new Brick(750, 50, bluebrick_img)); //4...
  levelOneBricks.add(new Brick(950, 50, redbrick_img));
  //middle row
  levelOneBricks.add(new Brick(100, 150, purplebrick_img));
  levelOneBricks.add(new Brick(200, 150, purplebrick_img));
  levelOneBricks.add(new Brick(300, 150, purplebrick_img));
  levelOneBricks.add(new Brick(400, 150, purplebrick_img));
  levelOneBricks.add(new Brick(500, 150, purplebrick_img));
  levelOneBricks.add(new Brick(600, 150, purplebrick_img));
  levelOneBricks.add(new Brick(700, 150, purplebrick_img));
  levelOneBricks.add(new Brick(800, 150, purplebrick_img));
  levelOneBricks.add(new Brick(900, 150, purplebrick_img));
  levelOneBricks.add(new Brick(1000, 150, purplebrick_img));
  //bottom row
  levelOneBricks.add(new Brick(150, 250, bluebrick_img));
  levelOneBricks.add(new Brick(350, 250, redbrick_img));
  levelOneBricks.add(new Brick(550, 250, bluebrick_img));
  levelOneBricks.add(new Brick(750, 250, redbrick_img));
  levelOneBricks.add(new Brick(950, 250, bluebrick_img));
}

//Input Actions

void mouseClicked() {
  if (GameState == 0) {
    if (mouseX > 415 && mouseX < 890 && mouseY > 425 && mouseY < 565) {
      GameState = 1;
      redraw();
    }
  }
}

void keyPressed() {
  if (GameState >= 1 && ball.xspeed == 0 && ball.yspeed == 0) {
    ball.xspeed = random(-4, 4);
    ball.yspeed = -3;
    redraw();
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      player.moveleft();
      redraw();
    }
    if (keyCode == RIGHT) {
      player.moveright();
      redraw();
    }
  }
}

//Declare Classes
class Player {
  float myx, myy, myw, myh, xspeed, boxx, boxy;
  
  Player() {
    myx = width/2;
    myy = height - 50;
    myw = 150;
    myh = 20;
    boxx = myx + myw;
    boxy = myy + myh;
  }
  
  void moveright() {
    myx += 8;
  }
  
  void moveleft() {
    myx -= 8;
  }
  
  void constriction() {
    if (myx < (width - width)) {
      myx += 5;
    }
    if (boxx > width) {
      myx -= 5;
    }
  }
  
  void ballcollision() {   
    if (ball.boxx > myx && ball.myx < boxx) {
      if (ball.boxy > myy && ball.myy < myy) {
        ball.yspeed *= -1.1;
        ball.myy -= 5;
      }
    }
    if (ball.boxy > (myy + 5) && ball.myy < (boxy - 5)) {
      if (ball.boxx > boxx && ball.myx < boxx) {
        ball.xspeed *= -1.05;
        ball.myx += 5;
      }
      if (ball.boxx > myx && ball.myx < myx) {
        ball.xspeed *= -1.05;
        ball.myx -= 5;
      }
    }
  }
  
  void update() {
    boxx = myx + myw;
    boxy = myy + myh;
    constriction();
    ballcollision();
    shape(playerbar_img, myx, myy, myw, myh);
  }
}


class Ball {
  float myx, myy, myd, xspeed, yspeed, direction, boxx, boxy;
  
  Ball() {
    myx = width/2;
    myy = 600;
    myd = 18;
    xspeed = 0;
    yspeed = 0;
    direction = 0;
    boxx = myx + myd;
    boxy = myy + myd;
  }
  
  void move() {
    //basic motion
    myx += xspeed;
    myy += yspeed;  
  }
  
  void constraints() {
    if (myx < (width - width)) {
      myx += 5;
      xspeed *= -1;
    }
    if (boxx > width) {
      myx -= 5;
      xspeed *= -1;
    }
    if (myy < (height - height)) {
      myy += 5;
      yspeed *= -1;
    }
    if (boxy > height + 100) {
      ball.reset();
    }
  }
  
  void maxangle() {
    if (direction == 0) {
      if (xspeed < -5) {
        xspeed = -5;
        direction = 0;
      }
    }
    else if (direction == 1) {
      if (xspeed > 5) {
        xspeed = 5;
        direction = 0;
      }
    }
  }
  
  void maxspeed() {
    if (yspeed > 5) {
      yspeed = 5;
    }
    if (yspeed < -5) {
      yspeed = -5;
    }
  }
  
  void reset() {
    myx = width/2;
    myy = 600;
    xspeed = 0;
    yspeed = 0;
  }
  
  void update() {
    boxx = myx + myd;
    boxy = myy + myd;
    ball.constraints();
    ball.maxangle();
    ball.maxspeed();
    ball.move();
    shape(ball_img, myx, myy, myd, myd);
  }
}

class Brick {
  //variables
  int myx, myy, myw, myh, boxx, boxy;
  public int hp;
  PShape img;
  public PShape bricktype;
  
  Brick(int x, int y, PShape getimg) { //constructor
    myx = x;
    myy = y;
    myw = 80;
    myh = 30;
    boxx = myx + myw;
    boxy = myy + myh;
    img = getimg;
    //set hp
    if (getimg == bluebrick_img || getimg == redbrick_img) {
        hp = 1;
    }
    else if (getimg == yellowbrick_img || getimg == purplebrick_img) {
        hp = 2;
    }
    else if (getimg == solidbrick_img) {
        hp = 10;
    }
    else if (getimg == blackwhitecirclebrick_img || getimg == redyellowcirclebrick_img || getimg == tealpurplecirclebrick_img) {
        hp = 1;
    }
    else {
        hp = 3;
    }
  }
  
  void brickballcollision() {   
    if (ball.boxx > myx && ball.myx < boxx) {
      if (ball.boxy > boxy && ball.myy < boxy) {
        ball.yspeed *= -1;
        ball.myy += 5;
        hp -= 1;
      }
      if (ball.boxy > myy && ball.myy < myy) {
        ball.yspeed *= -1;
        ball.myy -= 5;
        hp -= 1;
      }
    }
    if (ball.boxy > (myy + 5) && ball.myy < (boxy - 5)) {
      if (ball.boxx > boxx && ball.myx < boxx) {
        ball.xspeed *= -1;
        ball.myx += 5;
        hp -= 1;
      }
      if (ball.boxx > myx && ball.myx < myx) {
        ball.xspeed *= -1;
        ball.myx -= 5;
        hp -= 1;
      }
    }
  }
  
  void amIalive() {
    if ( hp <= 0) {
      levelOneBricks.remove(this);
    }
  }
  
  void update() { //everything that goes in draw()
    amIalive();
    boxx = myx + myw;
    boxy = myy + myh;
    brickballcollision();
    shape(img, myx, myy, myw, myh);
  }
}

