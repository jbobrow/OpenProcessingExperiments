
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/17689*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

//This is an alteration of the code for "Breakout" by Steph Thirion.
//Tweaked by Tanay Singhal on 01/16/2015
 
Rectangle gameFrame;
Brick[] bricks;
Paddle paddle;
Ball ball;

int score;

void setup() {
  size(700, 700);
  background(0, 150, 0);
  rectMode(CORNER);
  ellipseMode(CORNER);
  
  createBricks();
  createBall();
  paddle = new Paddle(150,20); //width, height
  textAlign(CENTER,CENTER);
  
  score = 0;
  println("up to here");
}

void draw() {
  refreshScreen();
  getscore();
}

void createBall() {
  ball = new Ball(100, 500);
}

void createBricks() {
  // BRICK GROUP PROPERTIES --
  int brickCount = 60;
  int bricksPerRow = 10;
  int brickWidth = width/bricksPerRow;
  int brickHeight = 50;
  int brickY = 50;
  
  color[] rowsColors = {
    color(100,0,180), //purple
    color(0,0,255), //blue
    color(0,255,0), //green
    color(255,255,0), //yellow
    color(255,127,0), //orange
    color(255,0,0) //red
  };
  
  // CREATE BRICKS --
  bricks = new Brick[brickCount];
  for (int i=0; i < brickCount; i++) {
    int rowNum = i/bricksPerRow;
    
    // location
    int x = brickWidth*i;
    x -= rowNum*bricksPerRow*brickWidth;
    int y = brickY + i/bricksPerRow*brickHeight;
    
    // color
    int num = min(rowNum, rowsColors.length-1);
    color rowColor = rowsColors[num];
    
    // create brick
    bricks[i] = new Brick(x, y, brickWidth, brickHeight, rowColor);
  }
}

void refreshScreen() {
  background(0);

  ball.refresh();
  paddle.refresh();
  for (int i=0; i<bricks.length; i++) {
    bricks[i].refresh();
  }
}

void getscore() {
  fill(255);
  text("Score: " + score,width/2,25);
}
import java.awt.geom.*;

public class Ball {

  Rectangle rectangle;
  // BALL PROPERTIES --
  int w  = 30;
  int h = 30;
  int velX = 3, velY = 3;
  int x, y, ox, oy, xcentre, ycentre;

  Ball(int X, int Y) {
    x = X;
    y = Y;
    rectangle = new Rectangle( w , h, color(255));
    rectangle.setPosition(x, y);
  }

  void refresh() {
    updatePosition();
    rectangle.setPosition(x, y);
    
    fill(255);
    ellipse(x, y, w , h);
  }

  void updatePosition() {
    // add velocity to position
    x += velX;
    y += velY;
    // collision with limits
    if (x <= 0 || x >= width- w  ) {
      velX = -velX;
    }
    if (y <= 0) {
      velY = -velY;
    }
    else if(y >= height- h) {
      setup();
    }
    
    xcentre = x + w/2;
    ycentre = y + h/2;
    // collision with paddle
    int result = checkCollisionWithRectangle(paddle.rectangle);
    // if collides on top, control direction of ball
    if (result == 1) {
      if (xcentre < paddle.rectangle.x1+paddle.rectangle. w/2) {
        if (velX > 0) {
          velX = -velX;
        }
      } else {
        if (velX < 0) {
          velX = -velX;
        }
      }
    }
    // collision with bricks
    if (result == 0) {
      for (int i=0; i<bricks.length; i++) {
        if (bricks[i].alive) {
          int res = checkCollisionWithRectangle(bricks[i].rectangle);
          if (res != 0) {
            bricks[i].die();
            break;
          }
        }
      }
    }
    ox = x;
    oy = y;
  }

  // Detect collision
  // result: 0: no collision 1: top 2: right 3: bottom 4: left 5: couldn't detect which side
  int checkCollisionWithRectangle (Rectangle R) {
    int result = 0;
    if (R.doesPointTouchMe(xcentre, ycentre)) {
      // which side did it collide
      Line2D lineaBola = new Line2D.Float(xcentre, ycentre, ox + w  /2, oy + h/2);
      result = R.whatSideDoesLineTouch(lineaBola, velX, velY);
      // top
      if (result==1) {
        velY = -velY;
        y = R.y1- h;
        // right
      } else if (result==2) {
        velX = -velX;
        x = R.x2;
        // bottom
      } else if (result==3) {
        velY = -velY;
        y = R.y2;
        // left
      } else if (result==4) {
        velX = -velX;
        x = R.x1- w  ;
      } else {
        result = 5;
      }
    }
    return result;
  }
}

public class Brick {
  Rectangle rectangle;
  int x = width/2, y = 270;
  boolean alive;
  
  Brick(int X, int Y, int W, int H, color FILL) {
    rectangle = new Rectangle(W, H, FILL);
    rectangle.setPosition(X, Y);
    alive = true;
  }
   
  void refresh(){
    if (alive){
      rectangle.drawYourself();
    }
  }
  
  void die() {
    alive = false;
    score ++;
  }
}

public class Paddle {
  
  Rectangle rectangle;
  // PADDLE PROPERTIES --
  int w, h;
  int x = width/2, y = height-50;
  
  Paddle(int W, int H) {
    w = W;
    h = H;
    rectangle = new Rectangle(w, h, color(255,255,0));
    rectangle.setPosition(x, y);
  }
  
  void refresh(){
    //paddle follows mouse
    x = mouseX-w/2;
    //don't allow paddle to go off screen
    x = constrain(x, 0, width-w);
    rectangle.setPosition(x, y);
    rectangle.drawYourself();
  }
}

import java.awt.geom.*;

public class Rectangle {

  int w ;
  int h;
  color fillColor;
  int x1, y1, x2, y2;
  
  Rectangle(int W, int H, color FILL) {
    w  = W;
    h = H;
    fillColor = FILL;
  }
   
  void setPosition(int X, int Y) {
    x1 = X;
    y1 = Y;
    x2 = x1+ w ;
    y2 = y1+ h;
  }
   
  void drawYourself(){
    fill(fillColor);
    rect(x1, y1, w , h);
  }
  
  // COLLISION DETECTION FUNCTIONS
  boolean doesPointTouchMe (int PX, int PY){
    boolean result = false;
    if (PX >= x1 && PX <= x2) {
      if (PY >= y1 && PY <= y2) {
        result = true;
      }
    }
    return result; 
  }  
    
  int whatSideDoesLineTouch (Line2D LINE, int VELX, int VELY){
      Line2D side;
      // top (1) / bottom (3)
      if (VELY>0){
        side = new Line2D.Float(x1,y1,x2,y1);
        if(LINE.intersectsLine(side)){
          return 1;
        }
      } else if (VELY<0){
        side = new Line2D.Float(x1,y2,x2,y2);
        if(LINE.intersectsLine(side)){
          return 3;
        }
      }
      // left (4) / right (2)
      if (VELX>0){
        side = new Line2D.Float(x1,y1,x1,y2);
        if(LINE.intersectsLine(side)){
          return 4;
        }
      } else if (VELX<0){
        side = new Line2D.Float(x2,y1,x2,y2);
        if(LINE.intersectsLine(side)){
          return 2;
        }
      }
      return 0;
  }
  
}


