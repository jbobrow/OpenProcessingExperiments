
class Ball
{
  //Properties
  int ballPosX;
  int ballPosY;
  int ballWidth;
  int ballHeight;
  color ballColor;//adding color
  int xSpeed= 5;// speed of x coord
  int ySpeed= 5;// speed of y coord

  //Constructor
  Ball (int x, int y, int w, int h, color c, int s)
  {
    this.ballPosX = x;
    this.ballPosY = y;
    this.ballWidth = w;
    this.ballHeight = h;
    this.ballColor = c;//declare color
    this.xSpeed=this.ySpeed=s;//declare speed
  }

  //Methods
  void drawBall()
  {
    fill(this.ballColor);//draw color
    ellipse (this.ballPosX, this.ballPosY, this.ballWidth, this.ballHeight);
  }
  void updatePosition()
  {
    if ((this.ballPosX>width-this.ballWidth/2) || (this.ballPosX <this.ballHeight/2))
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


