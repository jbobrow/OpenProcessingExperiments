
float i = 0;
float j = 70;
float k = -5;
float l = 900;
float m = -50;
float n = 400;
float o = -90;
float p = 1;
float q = -500;
float r = 314;

Rectangle gameFrame;
Brick[] bricks;
Paddle paddle;
Ball[] balls;
//
//
int frameNum = 1;
//
// SCREEN PROPERTIES --
int screenWidth = 800;
int screenHeight = 800;
color backgroundColor = #000000;
boolean backgroundRefreshes = false;
//



// GAME FRAME PROPERTIES --
int gameFrameWidth = 800;
int gameFrameHeight = 800;
color gameFrameStroke = #FFFFFF;
boolean gameFrameHasStroke = false;
color gameFrameFill = #000000;
int opacityOfRefresh = 257;
boolean gameFrameRefreshes = true;
//
//
int recX = (screenWidth-gameFrameWidth)/20;
int recY = (screenHeight-gameFrameHeight)/20;
//









 
 
// SETUP FUNCTION --
void setup(){
  background(255,0,0);
  size(800,800);

  background(backgroundColor);
  frameRate(60);
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
  int numberOfBalls = 1000;
  int yBalls = 1000;
  //
  balls = new Ball[numberOfBalls];
  for (int i=0; i<numberOfBalls; i++){
    int x = i*20;
    balls[i] = new Ball(x, yBalls);
  }
}
 
 
 
 
 
void createBricks(){
  // BRICK GROUP PROPERTIES --
  int numberOfBricks = 1000;
  int bricksPerRow = 100;
  int brickWidth = gameFrameWidth/bricksPerRow;
  int brickHeight = 10;
  boolean brickHasStroke = true;
  color brickStroke = #ffffff;
  boolean brickHasFill = false;
  color brickFill = #ff0000;
  int yBricks = 50;
  color[] rowsColors = {#ff00ff, #ff0000, #ff9900, #ffff00, #00ff00, #00ffff};
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
  int width = 3;
  int height =3;
  boolean hasStroke = false;
  color strokeColor = #00FF0A;
  boolean hasFill = true;
  color fillColor = #00FF0A;
  // velocity
  int velX = 1;
  int velY = 2;
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
  boolean hasStroke = true;
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
  int width = 60;
  int height = 5;
  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;
  //
  int x = gameFrameWidth/2;
  int y = 400;
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



