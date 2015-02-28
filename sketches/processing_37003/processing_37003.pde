
// BALL

import java.awt.geom.*;

public class Ball {

  Rectangle rectangle;
  // BALL PROPERTIES --
  int ballWidth = 5;
  int ballHeight = 5;
  int ballDepth = 5;
  boolean hasStroke = false;
  color strokeColor = #FFFFFF;
  boolean hasFill = true;
  color fillColor = #ffffff;
  // velocity
  int velX = 2;
  int velY = 2;
  int velZ = 2;
  //
  int x;
  int y;
  int z;
  int ox;
  int oy;
  int oz;
  int xcentre;
  int ycentre;
  int zcentre;

  boolean is3D = true;
  //



  Ball(int X, int Y) {
    x = X;
    y = Y;
    rectangle = new Rectangle(ballWidth, ballHeight, hasStroke, strokeColor, hasFill, fillColor);
    rectangle.setPosition(x, y);
  }
  Ball(int X, int Y, int Z) {
    x = X;
    y = Y;
    z = Z;
    rectangle = new Rectangle(ballWidth, ballHeight, ballDepth, hasStroke, strokeColor, hasFill, fillColor);
    rectangle.setTranslation(x, y, z);
  }




  void refresh() {
    
      
    updatePosition();
    if( !is3D) {
    rectangle.setPosition(x, y);
    
    }
    else {
      rectangle.setFill((int) map(z, 0, gameFrameDepth, 0, 255));
      rectangle.setTranslation(x,y,z);
    }
    rectangle.drawYourself();
  }




  void updatePosition() {
    if (!is3D) {
      // add velocity to position
      x+=velX;
      y+=velY;
      // collision with limits
      if (x<=0 || x>=gameFrameWidth-ballWidth) {
        velX = -velX;
        x = constrain(x, 0, gameFrameWidth-ballWidth);
      }
      if (y<=0 || y>=gameFrameHeight-ballHeight) {
        velY = -velY;
        y = constrain(y, 0, gameFrameHeight-ballHeight);
      }
      xcentre = x+ballWidth/2;
      ycentre = y+ballHeight/2;
      // collision with paddle
      int result = checkCollisionWithRectangle(paddle.rectangle);
      // if collides on top, control direction of ball
      if (result == 1) {
        if (xcentre < paddle.rectangle.x1+paddle.rectangle.rectWidth/2) {
          if (velX>0) {
            velX = -velX;
          }
        }
        else {
          if (velX<0) {
            velX = -velX;
          }
        }
      }
      // collision with bricks
      if (result == 0) {
        
        for (int i=0; i<bricks.length; i++) {
          if (bricks[i].imAlive) {
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


    /**************************
     3D stuff here
     *************************/
    else {
      // add velocity to position
      x+=velX;
      y+=velY;
      z+=velZ;
      // collision with limits
      if (x<=0 || x>=gameFrameWidth-ballWidth) {
        velX = -velX;
        x = constrain(x, 0, gameFrameWidth-ballWidth);
      }
      if (y<=0 || y>=gameFrameHeight-ballHeight) {
        velY = -velY;
        y = constrain(y, 0, gameFrameHeight-ballHeight);
      }
      if (z<=0 || z>=gameFrameDepth-ballDepth) {
        velZ = -velZ;
        z = constrain(z, 0, gameFrameDepth-ballHeight);
      }
      xcentre = x+ballWidth/2;
      ycentre = y+ballHeight/2;
      zcentre = z+ballDepth/2;
      // collision with paddle
      int result = checkCollisionWithRectangle(paddle.rectangle);
      // if collides on top, control direction of ball
      if (result == 1) {
        if (xcentre < paddle.rectangle.x1+paddle.rectangle.rectWidth/2) {
          if (velX>0) {
            velX = -velX;
          }
        }
        else {
          if (velX<0) {
            velX = -velX;
          }
        }
      }
      // collision with bricks
      if (result == 0) {
        for (int i=0; i<bricks.length; i++) {
          if (bricks[i].imAlive) {
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
  }


  // FUNCION DETECCION DE COLISION --
  // result: 0: no collision 1: top 2: right 3: bottom 4: left 5: couldn't detect which side
  int checkCollisionWithRectangle (Rectangle R) {
    int result = 0;
    if (!is3D) {
      if (R.doesPointTouchMe(xcentre, ycentre)) {
        // which side did it collide
        Line2D lineaBola = new Line2D.Float(xcentre, ycentre, ox+ballWidth/2, oy+ballHeight/2);
        result = R.whatSideDoesLineTouch(lineaBola, velX, velY);
        // top
        if (result==1) {
          velY = -velY;
          y = R.y1-ballHeight;
          // right
        }
        else if (result==2) {
          velX = -velX;
          x = R.x2;
          // bottom
        }
        else if (result==3) {
          velY = -velY;
          y = R.y2;
          // left
        }
        else if (result==4) {
          velX = -velX;
          x = R.x1-ballWidth;
        }
        else {
          result = 5;
        }
      }
    }
    else {
      if (R.doesPointTouchMe(xcentre, ycentre, zcentre)) {
        if(R.isPaddle) {
          velX = 0;
          velY = 0;
          velZ = 0;
        }
        else {
        // which side did it collide
        Line2D lineaBola = new Line2D.Float(xcentre, ycentre, ox+ballWidth/2, oy+ballHeight/2);
        result = R.whatSideDoesLineTouch(lineaBola, velX, velY, velZ, zcentre);
        // top
        switch(result) {
        case 1:
          velY = -velY;
          y = R.y1-ballHeight;
          // right
          break;
        case 2:
          velX = -velX;
          x = R.x2;
          break;
          // bottom
        case 3:
          velY = -velY;
          y = R.y2;
          break;
          // left
        case 4:
          velX = -velX;
          x = R.x1-ballWidth;
          break;
        default:
          velZ = -velZ;
        }
        }
      }
    }
    return result;
  }
}


