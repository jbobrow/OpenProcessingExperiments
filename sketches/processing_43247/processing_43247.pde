
class Ball
{

  //properties
  int ballPosX;
  int ballPosY;
  int ballWidth;
  int ballHeight;
  color ballColor01;
  color ballColor02;
  color ballColor03;
  int xSpeed = 5;
  int ySpeed = 5;

  //constructor
  Ball(int x, int y, int w, int h, color c1, color c2, color c3, int s)

  {

    this.ballPosX = x;
    this.ballPosY = y;
    this.ballWidth = w;
    this.ballHeight = h;
    this.ballColor01 = c1;
    this.ballColor02 = c2;
    this.ballColor03 = c3;
    this.xSpeed = this.ySpeed=s;
  }

  //methods
  void drawBall01()
  {
    
    fill(this.ballColor01);
    rect(this.ballPosX, this.ballPosY, this.ballWidth, this.ballHeight);
  }
  
    void drawBall02()
  {
    
    fill(this.ballColor02);
    ellipse(this.ballPosX, this.ballPosY, this.ballWidth, this.ballHeight);
  }
    
    void drawBall03()
  {
    
    stroke(this.ballColor03);
    ellipse(this.ballPosX, this.ballPosY, this.ballWidth, this.ballHeight);
  }
  
  
  void updatePosition()
  {    
  
    if((this.ballPosX > width - this.ballWidth/2)
       ||(this.ballPosX < this.ballWidth/2))
       {
        this.xSpeed = -this.xSpeed; 
       }
       
    if((this.ballPosY > height - this.ballHeight/2)
       ||(this.ballPosY < this.ballHeight/2))
       {
        this.ySpeed = -this.ySpeed; 
       }
    
    this.ballPosX += this.xSpeed;
    this.ballPosY += this.ySpeed;
  }
  
}

 


