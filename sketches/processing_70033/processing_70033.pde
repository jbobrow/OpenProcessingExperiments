
class followTri {
  int x;
  int y;
  int headingX;
  int headingY;
  float angle;
  color col;
  boolean away = false;
  int runCount;


  followTri(int mX, int mY) {   
    x = (int)random(0, width);
    y = (int)random(0, height);
    angle = atan2(mY, mX);
    col = color(random(50, 150), 5, random(50, 150), 90);
  }

  void follow(int mX, int mY) {

    pushMatrix();
    translate(x, y);    

    if (away) {
      angle = atan2(headingY-y, headingX-x);
      x += (headingX-x)*0.1;
      y += (headingY-y)*0.1;
      runCount++;

      if (runCount>=20) {
        away = false;
      }
    } 
    else {
      angle = atan2(mY-y, mX-x);
      x += (mX-x)*0.05;
      y += (mY-y)*0.05;

      if (mX-x<3&&mX-x>-3||mY-y<3&&mY-y>-3) {
        away = true;
        runCount = 0;
        headingX = x + (int)random(-200, 200);
        headingY = y + (int)random(-200, 200);
      }
    }
    drawTri();
    popMatrix();
  }

  void drawTri() {
    stroke(255);
    fill(col);
    rotate(angle);
    triangle(0, 0, -30, -15, -30, 15);
    
  }
}


