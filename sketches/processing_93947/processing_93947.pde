


import java.awt.Rectangle;
import java.util.Iterator;
import java.util.LinkedList;
import java.awt.Shape;

static final long serialVersionUID = 1L;
boolean[] keys;
LinkedList<Object> allShapes = new LinkedList<Object>();
PongBar bar;
LinkedList<PongBall> balls = new LinkedList<PongBall>();
boolean pause;


PFont instrFont;
PFont infoFont;
PFont detailsFont;
PFont gameFont;

boolean gameOver;
boolean startGame;

int lives = 5;
int points = 0;
int level = 1;

long lastTime = 0;

PImage b1;
PImage ball;
PImage shotImg;
PImage pow;

Rectangle b;

int ptInc = 15;
int sphereDiameter = 12;
boolean shoot = false;

int randx() {
  return int(random(600));
}

int randSpeed(boolean pos) {
  int s = int(random(8) - 4);
  while(s == 0){
    s = int(random(8) - 4);
  }
  
  if(pos)
    return abs(s);
  return s;
}

int[] powX = {
  randx(), randx(), randx(), randx(), randx()
  };

int[] powY = { 
  0, 0, 0, 0, 0
};

int[] speeds = {
  randSpeed(true), randSpeed(true), randSpeed(true), randSpeed(true), randSpeed(true)
  };

  int lastShot = 0;

void setup() {
  size(600, 500);
  //String[] fontList = PFont.list();
  //println(fontList);

  keys = new boolean[256];

  b1 = loadImage("paddle3.svg.png");
  ball = loadImage("ball_plain1.png");
  shotImg = loadImage("bullet.png");
  pow = loadImage("pow.png");

  instrFont = loadFont("Arial-BoldMT-12.vlw");
  infoFont = loadFont("CourierNewPS-BoldMT-16.vlw");
  detailsFont = loadFont("CenturyGothic-Bold-15.vlw");
  gameFont = loadFont("Impact-36.vlw");

  bar = new PongBar(b1, "WSAD", 8, 10, 1);
  b = (Rectangle)bar.getShape();
  balls.add(new PongBall(ball, 200, 30, randSpeed(false) * 2, randSpeed(false) * 2));
  //balls.add(new PongBall(18, 150, 30));

  allShapes.add(bar);
  allShapes.addAll(balls);

  frameRate(200);
}

void draw() {
  //System.out.println("rate="+frameRate);

  if (!startGame) {
    background(0);
    fill(255, 255, 0);
    textFont(instrFont);
    textAlign(CENTER);
    text("Move the bar using the [WASD] keys and [CLICK] to shoot falling objects.", width/2, height/2 - 55);
    text("Avoid the ball(s) bouncing around you.", width/2, height/2 - 40);
    text("150 points * CURRENT_LVL gets you to the next level. Killing enemies gives points.", width/2, height/2 - 25);
    text("Getting hit by a ball makes you lose a life, 0 lives = Game Over", width/2, height/2 - 10);
    text("Hit [Space] as soon as you are ready to start.", width/2, height/2 + 5);
  }
  else {
    if (balls.size() != level) {
      PongBall newBall = new PongBall(ball, (int)random(0, width - ball.width), (int)random(0, height - ball.height), randSpeed(false) * 2, randSpeed(false) * 2);
      balls.add(newBall);
      allShapes.add(newBall);
    }

    if (!pause) {
      background(0);
      Iterator<Object> iter = allShapes.iterator();
      while (iter.hasNext ()) {
        Object next = iter.next();
        if (next instanceof Drawable)
          ((Drawable)next).draw(this);

        if (next instanceof Movable)
          ((Movable)next).updatePosition();
      }

      displayStats();

      if (gameOver)
        gameOverSequence();

      Iterator<PongBall> iter2 = balls.iterator();
      while (iter2.hasNext ()) {
        PongBall ball = (PongBall)iter2.next();
        if (bar.hasCollision(ball.getShape())) {
          Rectangle r = ball.getShape().getBounds();
          Rectangle r1 = bar.getShape().getBounds();
          int collisionSide = Direction.getCollisionSide(r, r1, ball.getDirection());
          if (collisionSide == Direction.LEFT || collisionSide == Direction.RIGHT) {
            ball.bounce(PongBall.XDIR);
          }
          else if (collisionSide == Direction.UP || collisionSide == Direction.DOWN) {
            ball.bounce(PongBall.YDIR);
          }

          if (abs(lastTime - millis()) > 800)
            lives--;

          lastTime = millis();
        }
      }

      if (lives == 0)
        gameOver = true;

      //println("Lives = " + lives);

      if (shoot==true) {
        checkPowContact();
      }

      movePow();
      replaceBalls();
    }
  }
}

void mousePressed() {
  if (abs(lastShot - millis()) < 800){
    shoot = false;
    return;
  }

  shoot = true;
  lastShot = millis();
}

void mouseReleased() {
  shoot = false;
}

void movePow() {  
  stroke(0, 112, 0);
  fill(0, 112, 0);
  for (int i=0; i<5; i++) {
    powY[i] += speeds[i];
    image(pow, powX[i], powY[i]);
  }
}

void checkPowContact() {
  boolean hit = false;
  strokeWeight(2);
  int midPoint = b.x + b.width/2;
  int w = 3;

  fill(255, 255, 0);
  for (int i = 0; i < 5; i++) {

    Rectangle shotR = new Rectangle(midPoint - w, 0, w, height);
    Rectangle powR = new Rectangle(powX[i], powY[i], pow.width, pow.height);

    if (midPoint >= powR.x && midPoint <= (powR.x + pow.width) || shotR.intersects(powR)) {

      hit = true;

      for (int j = midPoint - w; j < midPoint + w; j++) {
        fill(255, 255, 0);
        line(j, b.y, j, powY[i]);
      }

      ellipseMode(CENTER);
      ellipse(powX[i] + pow.width/2, powY[i] + pow.height/2, pow.width+25, pow.width+25);
      powX[i] = randx();
      powY[i] = 0;

      points += ptInc;

      if (points % 150 == 0) {
        level++;
      }
    }
  }

  if (hit == false) {
    for (int k = midPoint - w; k < midPoint + w; k++) {
      fill(255, 255, 0);
      line(k, b.y, k, 0);
    }
  }
}

void gameOverSequence() {
  textFont(gameFont);
  textAlign(CENTER);

  fill(255, 255, 0);
  text("Game Over.\nYour score was: " + points, width/2, height/2 - 15);
  noLoop();
}

void displayStats() {
  fill(255, 20, 0);
  textAlign(LEFT);
  int s = 14;
  int xStart = 2;
  //Write headers
  writeText(infoFont, "LEVEL:", xStart, xStart + s - 2);
  writeText(infoFont, "LIVES:", xStart, xStart + 2.5*s - 2);
  writeText(infoFont, "POINTS:", xStart, xStart + 4*s - 2);

  int w = 60;

  //Write details
  fill(255);
  writeText(detailsFont, " " + level, xStart + w, xStart + s - 1);
  writeText(detailsFont, " " + lives, xStart + w, xStart + 2.5 * s - 1);
  writeText(detailsFont, " " + points, xStart + w + 10, xStart + 4 * s - 1);
}

void writeText(PFont font, String text, float x, float y) {
  textFont(font);
  text(text, x, y);
}

void keyPressed() {
  setKey(true);
  Iterator<Object> iter = allShapes.iterator();
  while (iter.hasNext ()) {
    Object next = iter.next();
    if (next instanceof Movable)
      ((Movable)next).registerKeyPress(keyCode, keys);
  }

  if (keys[(int) 'P'])
    pause = !pause;

  if (keyCode == 32) {
    if (startGame) {
      //Rectangle r = (Rectangle)bar.getShape();
      //allShapes.add(new Shot(shotImg, r.x + r.width/2, r.y - 5, 5));
      //shoot = true;
      //checkPowContact(b.x + b.width/2);
    }
    startGame = true;
  }
}

void keyReleased() {
  setKey(false);
  Iterator<Object> iter = allShapes.iterator();
  while (iter.hasNext ()) {
    Object next = iter.next();
    if (next instanceof Movable)
      ((Movable)next).registerKeyRelease(keyCode, keys);
  }

  //  if(keyCode == 32){
  //    shoot = false;
  //  }
}

void setKey(boolean state) {
  keys[constrain(keyCode, 0, 255)] = state;
}

void replaceBalls() {
  for (int i=0; i< 5; i++) {
    if (powY[i]>=height-pow.height) {
      powY[i] = 0;
      powX[i] = randx();
      speeds[i] = randSpeed(true);
    }
  }
}


