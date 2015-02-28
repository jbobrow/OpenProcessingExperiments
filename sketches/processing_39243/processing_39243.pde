
class Ball {

  // Properties

  float ballPosX;
  float ballPosY;
  float ballSize;
  int ballColor;
  int ballTrans;

  // Constructor
  Ball(float x, float y, float s, color c, int t) {
    this.ballPosX = x;
    this.ballPosY = y; 
    this.ballSize = s; 
    this.ballColor = c;
    this.ballTrans = t;
  }

  // Methods
  void drawBall() {
    fill(this.ballColor, this.ballTrans);
    ellipse(this.ballPosX, this.ballPosY, this.ballSize, this.ballSize);
    this.ballSize +=1;
  }

  void updateFade() {

    if (this.ballSize > 200) {
      this.ballTrans+=1;
      ballSize=1;
      ballPosX+=30;
      ballPosY+=30;
    }

    if (this.ballPosX >= 800 ) {
      this.ballPosX = random(50, 150);
    }

    if (this.ballPosY >= 600) {
      this.ballPosY = random(50, 150);
    }
  }
}


