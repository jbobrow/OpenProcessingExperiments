
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
  int velX = 6;
  int velY = 6;
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




  void refresh() {
    updatePosition();
    rectangle.setPosition(x, y);

    if (superBrickTotal == ultimateCount) {
      velX = 3;
      velY = 3;
    }
    rectangle.drawYourself();
  }




  void updatePosition() {
    // add velocity to position
    x+=velX;
    y+=velY;
    // collision with limits
    if (x<=0) {
      if (wallW > 9) {
        if (x <= 0 - 100) {
          velX= - velX;
          x = constrain(x, 0, gameFrameWidth - width);
        }
      }
      else {
        velX = -velX;
        x = constrain(x, 0, gameFrameWidth - width);
      }
      wallW++;
    } 
    if (x>=gameFrameWidth-width) {
      if (wallE > 9) {
        if (x >= gameFrameWidth + 100 - width) {
          velX = -velX;
          x = constrain(x, 0, gameFrameWidth - width);
        }
      }
      else {
        velX = -velX;
        x = constrain(x, 0, gameFrameWidth - width);
      }
      wallE++;
    }

    if (y<=0) {
      if (wallN > 9) {
        if (y <= 0 -100) {
          velY = -velY;
          y = constrain(y, 0, gameFrameHeight - height);
        }
      }
      else {
        velY = -velY;
        y = constrain(y, 0, gameFrameHeight - height);
      }
      wallN++;
    } 
    if (y>=gameFrameHeight-height) {
      if (wallS > 9) {
        if (y >= gameFrameHeight + 100 - height) {
          velY = -velY;
          y = constrain(y, 0, gameFrameHeight - height);
        }
      }
      else {
        velY = -velY;
        y = constrain(y, 0, gameFrameHeight-height);
      }
      wallS++;
    }
    xcentre = x+width/2;
    ycentre = y+height/2;
    // collision with paddle
    int result = checkCollisionWithRectangle(paddle.rectangle);
    // if collides on top, control direction of ball
    if (result == 1) {
      if (xcentre < paddle.rectangle.x1+paddle.rectangle.width/2) {
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


  // FUNCION DETECCION DE COLISION --
  // result: 0: no collision 1: top 2: right 3: bottom 4: left 5: couldn't detect which side
  int checkCollisionWithRectangle (Rectangle R) {
    int result = 0;
    if (R.doesPointTouchMe(xcentre, ycentre)) {
      // which side did it collide
      Line2D lineaBola = new Line2D.Float(xcentre, ycentre, ox+width/2, oy+height/2);
      result = R.whatSideDoesLineTouch(lineaBola, velX, velY);
      // top
      if (result==1) {
        velY = -velY;
        y = R.y1-height;
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
        x = R.x1-width;
      }
      else {
        result = 5;
      }
    }
    return result;
  }
}


