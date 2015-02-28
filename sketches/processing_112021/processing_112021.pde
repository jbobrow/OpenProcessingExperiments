
// Breakout // // 28/02/2007
// Steph Thirion - Game Mod workshop: < http://trsp.net/teaching/gamemod >
// 
// english version :)
// made with Processing 0124 Beta


Rectangle gameFrame;
Brick[] bricks;
Paddle paddle;
Ball[] balls;
//
//
int frameNum = 0;
//
// SCREEN PROPERTIES --
int screenWidth = 800;
int screenHeight = 400;
color backgroundColor = #303030;
boolean backgroundRefreshes = false;
// 
// GAME FRAME PROPERTIES --
int gameFrameWidth = 800;
int gameFrameHeight = 400;
color gameFrameStroke = #FFFFFF;
boolean gameFrameHasStroke = false;
color gameFrameFill = #000000;
int opacityOfRefresh = 100;
boolean gameFrameRefreshes = true;
// 
//
int recX = (screenWidth-gameFrameWidth)/2;
int recY = (screenHeight-gameFrameHeight)/2;
//




// SETUP FUNCTION --
void setup() {
  size(screenWidth,screenHeight,P3D);
  background(backgroundColor);
  frameRate(600);
  //
  // create objects
  gameFrame = new Rectangle(gameFrameWidth, gameFrameHeight, gameFrameHasStroke, gameFrameStroke, true, gameFrameFill);
  gameFrame.opacity = opacityOfRefresh;
  createBricks();
  createBalls();
  paddle = new Paddle();
  //
  refreshScreen();
}





// DRAW FUNCTION --
void draw() {
  refreshScreen();
  //
  //
  //
  saveScreenshots();  
}






void createBalls(){
  // BALL(S) PROPERTIES --
  int numberOfBalls = 100;
  int yBalls = 150;
  //
  balls = new Ball[numberOfBalls];
  for (int i=0; i<numberOfBalls; i++){
    int x = i/2;
    balls[i] = new Ball(x, yBalls);
  }
}





void createBricks(){
  // BRICK GROUP PROPERTIES --
  int numberOfBricks = 60000;
  int bricksPerRow = 80;
  int brickWidth = gameFrameWidth/bricksPerRow;
  int brickHeight = 10;
  boolean brickHasStroke = true;
  color brickStroke = #ffffff;
  boolean brickHasFill = true;
  color brickFill = #ff0000;
  int yBricks = 50; 
  color[] rowsColors = {#FF3E3E, #BC2828, #E81AB8, #62104F, #8E12C4, #570A79, #4B5ED3, #286993, #164664, #0E8647, #0C3E24, #45EA51, #1F7125,#7CCE1F, #7CCE1F,#DCF52A, #6B7617, #E0AF26, #E06126,
 #FA2D45,  #A1A5DB, #56BEED,#32C696,#024D35,#43DE6D,#0A5F21,#9CF26E,#7B9856,#F0E068,#F0C568,#CB6E33,#CE6A51,
#E55935,#F22031,#F22031,#F22031,#F22031 };
  //
  //
  // CREATE BRICKS --
  bricks = new Brick[numberOfBricks];
  for (int i=0; i<numberOfBricks; i++){
    int rowNum = i/bricksPerRow;
    // coords
    int x = brickWidth*i;
    x -= rowNum*bricksPerRow*brickWidth;
    int y = yBricks+i/bricksPerRow*brickHeight;
    // color
    int num = min(rowNum, rowsColors.length-1);
    color rowColor = rowsColors[num];
    // create brick
    bricks[i] = new Brick(x, y, brickWidth, brickHeight, brickHasStroke, brickStroke, brickHasFill, rowColor);
  }
}







void refreshScreen() {
  // BACKGROUND
  if(backgroundRefreshes){
    background(backgroundColor);
  }
  // GAME FRAME
  if(gameFrameRefreshes){
    gameFrame.drawYourself();
  }
  // PADDLE
  paddle.refresh();
  //
  // BRICKS
  for (int i=0; i<bricks.length; i++){
    bricks[i].refresh();
  }
  // BALLS
  for (int i=0; i<balls.length; i++){
    balls[i].refresh();
  }
}


// be careful with this function - only change if you know what you're doing
// the hard disk could fill up with images in a few minutes
// 
//
// press the 'G' key to save frames in TGA pictures in 'saved' folder
//
void saveScreenshots(){
   frameNum++;
   if (keyPressed) {
    if (key == 'g' || key == 'G') {
      if(frameNum%2==0){
        saveFrame("saved/frame-####.tga");
      }
    }
  } 
}
      
   

// BALL

import java.awt.geom.*;

public class Ball {

 
  Rectangle rectangle;
  // BALL PROPERTIES --
  int width = 5;
  int height = 5;
  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;
  // velocity
  int velX = 10;
  int velY = 10;
  //
  int x;
  int y;
  int ox;
  int oy;
  int xcentre;
  int ycentre;
  //
  
  

  Ball(int X, int Y) {
    x = X;
    y = Y;
    rectangle = new Rectangle(width, height, hasStroke, strokeColor, hasFill, fillColor);
    rectangle.setPosition(x, y);
  }
  
  
  

  void refresh(){
    updatePosition();
    rectangle.setPosition(x, y);
    rectangle.drawYourself();
  }
  
  
  

  void updatePosition() {
    // add velocity to position
    x+=velX;
    y+=velY;
    // collision with limits
    if(x<=0 || x>=gameFrameWidth-width){
      velX = -velX;
      x = constrain(x, 0, gameFrameWidth-width);
    }
    if(y<=0 || y>=gameFrameHeight-height){
      velY = -velY;
      y = constrain(y, 0, gameFrameHeight-height);
    }
    xcentre = x+width/2;
    ycentre = y+height/2;
    // collision with paddle
    int result = checkCollisionWithRectangle(paddle.rectangle);
    // if collides on top, control direction of ball
    if (result == 1){
        if(xcentre < paddle.rectangle.x1+paddle.rectangle.width/2){
          if(velX>0){
            velX = -velX;  
          }
        }else{
          if(velX<0){
            velX = -velX;  
          }
        }
    }
    // collision with bricks
    if (result == 0) {
      for (int i=0; i<bricks.length; i++){
         if(bricks[i].imAlive){
           int res = checkCollisionWithRectangle(bricks[i].rectangle);
           if (res != 0){
             bricks[i].die();
             break;
           }
         }
      }
    }
    ox = x;
    oy = y;
  }
  
  
  // FUNCION DETECCION DE COLISION --
  // result: 0: no collision 1: top 2: right 3: bottom 4: left 5: couldn't detect which side
  int checkCollisionWithRectangle (Rectangle R){
    int result = 0;
    if (R.doesPointTouchMe(xcentre, ycentre)){
      // which side did it collide
      Line2D lineaBola = new Line2D.Float(xcentre,ycentre,ox+width/2,oy+height/2);
      result = R.whatSideDoesLineTouch(lineaBola, velX, velY);
      // top
      if(result==1){
        velY = -velY;
        y = R.y1-height;
        // right
      }else if(result==2){
        velX = -velX;
        x = R.x2;
        // bottom
      }else if(result==3){
        velY = -velY;
        y = R.y2;
        // left
      }else if(result==4){
        velX = -velX;
        x = R.x1-width;
      }else{
        result = 5;
      }
    }
    return result;
  }
  
}

// BRICK

public class Brick {
  
  Rectangle rectangle;
  // BRICK PROPERTIES --
  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;
  //
  int x = gameFrameWidth/2;
  int y = 270;
  //
  boolean respawns = false;
  int timeToRespawn = 60; // time is in frames
  
  //
  int frame;
  boolean imAlive;
  //
  
  
  
  
  Brick(int X, int Y, int W, int H, boolean HASSTROKE, color STROKE, boolean HASFILL, color FILL) {
    rectangle = new Rectangle(W, H, HASSTROKE, STROKE, HASFILL, FILL);
    rectangle.setPosition(X, Y);
    imAlive = true;
  }
  
  
  
  
  void refresh(){
    if (imAlive){
      rectangle.drawYourself();
    }else{
      if (respawns){
        frame++;
        if(frame>timeToRespawn){
          // rise up from your grave, brick
          imAlive=true;
        }
      }
    }
  }
  
  
  
  void die() {
    imAlive = false;
    frame = 0;
  }


}

// PADDLE

public class Paddle {
  
  Rectangle rectangle;
  // PADDLE PROPERTIES --
  int width = 0;
  int height = 0;
  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;
  //
  int x = gameFrameWidth/2;
  int y = 270;
  //
  //
  
  
  
  Paddle() {
    rectangle = new Rectangle(width, height, hasStroke, strokeColor, hasFill, fillColor);
    rectangle.setPosition(x, y);
  }
  
  
  
  void refresh(){
    updatePosition();
    rectangle.setPosition(x, y);
    rectangle.drawYourself();
  }
  
  
 
  void updatePosition() {
    x = mouseX-recX-width/2;
    x = constrain(x, 0, gameFrameWidth-width);
  }

}







// in this game every visible object is a Rectangle
// (ball, paddle, bricks, even the game frame)
// are represented by a Rectangle:





// CAJA

import java.awt.geom.*;

public class Rectangle {

  //
  int width;
  int height;
  boolean hasStroke = false;
  color strokeColor;
  boolean hasFill = false;
  color fillColor;
  color opacity;
  //
  int x1;
  int y1;
  int x2;
  int y2;
  //
  //
  
  
  //
  Rectangle(int W, int H, boolean HASSTROKE, color STROKE, boolean HASFILL, color FILL) {
    width = W;
    height = H;
    hasStroke = HASSTROKE;
    strokeColor = STROKE;
    hasFill = HASFILL;
    fillColor = FILL;
    //
    opacity = 255;
  }
  
  
  
  //
  void setPosition(int X, int Y) {
    x1 = X;
    y1 = Y;
    x2 = x1+width;
    y2 = y1+height;
  }
  
 
 
  //
  void drawYourself(){
    // stroke
    if (hasStroke) {
      stroke(strokeColor);
    } else{
      noStroke();
    }
    // fill
    if (hasFill) {
      fill(fillColor, opacity);
    } else{
      noFill();
    }
    rect(recX+x1, recY+y1, width, height);
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


