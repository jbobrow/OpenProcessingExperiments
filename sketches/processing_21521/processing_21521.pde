

class Ball {
  float X;
  float Y;
  float Xspeed;
  float Yspeed;
  float ballSize;
  color c;


  Ball(float tempX, float tempY, int XspeedT, int YspeedT, int sizeTemp,color colT) {
    X = tempX;
    Y = tempY;
    Xspeed = XspeedT;
    Yspeed = YspeedT;
    ballSize = sizeTemp;
    c = colT;
  }

  void placeBall() {
    noStroke();
    fill(c);
    ellipse(X,Y,ballSize,ballSize);
  }
  void bounce() {

    if (Y > height) { 
      Xspeed = Xspeed * -.5;
      Yspeed = Yspeed * -.75;
    }

    if (X > width) { 
      Xspeed = Xspeed * -.5;
      Yspeed = Yspeed * -.75;
    }
    if ( Y < 0) {
      Xspeed = Xspeed * -.75;
      Yspeed = Yspeed * -.5;
    }

    if ( X < 0) {

      Xspeed = Xspeed * -.75;
      Yspeed = Yspeed * -.5;
    }
    
  }

  void move() {

    X += Xspeed;
    Y += Yspeed;// + gravity;
  }

  
}


