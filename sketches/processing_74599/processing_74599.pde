
// BALL

import java.awt.geom.*;

public class Ball {

  Rectangle rectangle;
  // BALL PROPERTIES --
  int[] xCoords;
  int[] yCoords;
  int tailCount;
  
  int width = 5;
  int height = 5;
  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;
  // velocity
  int velX = 3;
  int velY = 3;
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
    
    tailCount = 1;
    xCoords = new int[100];
    yCoords = new int[100];
    xCoords[0] = x;
    yCoords[0] = y;
  }
  
  
  

  void refresh(){
    updatePosition();
    for(int i = 0; i < tailCount; i++) {
      rectangle.setPosition(xCoords[i], yCoords[i]);
      rectangle.drawYourself();
    }
  }
  
  
  

  void updatePosition() {
    
    //I'm HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    int[] xCopy = new int[xCoords.length];
    int[] yCopy = new int[yCoords.length];
    arrayCopy(xCoords, xCopy); 
    arrayCopy(yCoords, yCopy);
    
    for(int i = tailCount-1; i > 0; i--) {
      xCoords[i] = xCopy[i-1];
      yCoords[i] = yCopy[i-1];
    }
    
    int prevX = x;
    int prevY = y;
    
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
             if(tailCount < 100) {
               xCoords[tailCount] = prevX;
               yCoords[tailCount] = prevY;
               tailCount++; 
             }
             break;
           }
         }
      }
    }
    ox = x;
    oy = y;
    xCoords[0] = x;
    yCoords[0] = y;
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


