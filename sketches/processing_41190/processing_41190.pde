

class Ball

{
  // Properties
  int ballPosX;
  int ballPosY;
  int ballWidth;
  int ballHeight;
  color ballColor;
  int xSpeed=10;
  int ySpeed=10;


  // Constructor

  Ball(int x, int y, int w, int h, color c, int s)

  {
    this.ballPosX = x;
    this.ballPosY = y;
    this.ballWidth = w;
    this.ballHeight = h;
    this.ballColor = c;
    this.xSpeed =this.ySpeed =s;
  }

  // Methods

    void drawBall()
  {
    fill(this.ballColor);
    ellipse( this.ballPosX, this.ballPosY, this.ballWidth, this.ballHeight);
  }
  void updatePosition()
  {

    if ((this.ballPosX > width-this.ballWidth/2)  || (this.ballPosX < this.ballWidth/2))
      {
        this.xSpeed = -this.xSpeed;
      }
    if ((this.ballPosY > height-this.ballHeight/2) || (this.ballPosY < this.ballHeight/2))
      {
        this.ySpeed = -this.ySpeed;
      }
   
    this.ballPosX += this.xSpeed;
    this.ballPosY += this.ySpeed;
  }
}


