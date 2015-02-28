
// BALL

import java.awt.geom.*;

public class Ball {

  Rectangle rectangle;
  // BALL PROPERTIES --
  int width = 10;
  int height = 10;
  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #1434E0;
  // velocity
  int velX = 4;
  int velY = 4;
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
    if (result != 0){
        gameOver = true;
    }
    // collision with bricks
    if (result == 0) {
      for (int i=0; i<bricks1.length; i++){
         if(bricks1[i].imAlive){
           int res = checkCollisionWithRectangle(bricks1[i].rectangle);
           if (res != 0){
             bricks1[i].die();
             break;
           }
         }
      }
      for (int i=0; i<bricks2.length; i++){
         if(bricks2[i].imAlive){
           int res = checkCollisionWithRectangle(bricks2[i].rectangle);
           if (res != 0){
             bricks2[i].die();
             break;
           }
         }
      }
      for (int i=0; i<bricks3.length; i++){
         if(bricks3[i].imAlive){
           int res = checkCollisionWithRectangle(bricks3[i].rectangle);
           if (res != 0){
             bricks3[i].die();
             break;
           }
         }
      }
      for (int i=0; i<bricks4.length; i++){
         if(bricks4[i].imAlive){
           int res = checkCollisionWithRectangle(bricks4[i].rectangle);
           if (res != 0){
             bricks4[i].die();
             break;
           }
         }
      }
      for (int i=0; i<backdrop.length; i++){
         if(backdrop[i].imAlive){
           int res = checkCollisionWithBG(backdrop[i].rectangle);
           if (res != 0){
             backdrop[i].changeColor(#000000);
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
  
    int checkCollisionWithBG (Rectangle R){
    int result = 0;
    if (R.doesPointTouchMe(xcentre, ycentre)){
      // which side did it collide
      Line2D lineaBola = new Line2D.Float(xcentre,ycentre,ox+width/2,oy+height/2);
      result = R.whatSideDoesLineTouch(lineaBola, velX, velY);
    }
    return result;
  }
}


